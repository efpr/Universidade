package Tetris;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;

import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuBar;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.Border;

import org.chocosolver.solver.Solution;
import org.chocosolver.solver.Solver;


public class Board extends JFrame implements ActionListener
{
	private JPanel[][] panel;
	private int tab_size;
	private Solver last_solution;
	private int[] num_figures;
	private JButton new_game, button;
	private JLabel carregar;
	
	public Board(int x) 
	{
		tab_size = x;
		panel = new JPanel[x][x];
		
		this.setSize(350,300);
		this.setLayout(new GridLayout(4,4));
		this.setLocationRelativeTo(null);
		
		JMenuBar menubar = new JMenuBar();
		button = new JButton("Next");
		new_game = new JButton("New");
		carregar = new JLabel();
		button.addActionListener(this);
		new_game.addActionListener(this);
		menubar.add(new_game);
		menubar.add(carregar);
		menubar.add(Box.createHorizontalGlue());
		menubar.add(button);
		
		this.setJMenuBar(menubar);
		
		Border border = BorderFactory.createLineBorder(Color.DARK_GRAY, 1);
	
		for(int i=0; i<x; i++)
			for(int j=0; j<x; j++)
			{
				panel[i][j] = new JPanel();
				panel[i][j].setBorder(border);
				this.add(panel[i][j]);
				
			}
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	public void changeColor(int x, int y, Color color)
	{
		panel[x][y].setBackground(color);
	}
	
	public void setWhite()
	{
		for(int i=0; i<tab_size; i++)
			for(int j=0; j<tab_size; j++)
				panel[i][j].setBackground(Color.white);				
	}
	
	
	public void showSolutions(Solver solver, int X, int[] qts)
	{
		last_solution = solver;
		num_figures = qts;
				
		try
		{		
			carregar.setText("Searching for solution...");
			new_game.setEnabled(false);
			button.setEnabled(false);
			
			Solution solution = last_solution.findSolution();
			
	        String frase = solution.toString().substring(9); 
	     
	        if (!valido(frase, X, qts[0]+qts[1]+qts[2]+qts[3]))
	            showSolutions(last_solution, X, num_figures);
		}
		catch(StackOverflowError e)
		{
			JOptionPane.showMessageDialog(null, "No solution");
			String[] args = new String[0];
			this.dispose();
			Main.main(args);
		}
        
	}
	

    public boolean valido(String str, int tamanho, int total){
      	
        String[][] board = new String[tamanho][tamanho];
        this.setVisible(true);
        
        for (int i=0; i<tamanho; i++)
        	Arrays.fill(board[i],"0");
        
        this.setWhite();

        for (int j=0; j<total; j++)
        {
            String fig_id = new String(str.substring(7,9));
            if (fig_id.equals("10") || fig_id.equals("11") || fig_id.equals("12"))
            {
                int x = str.charAt(15) - '0';
                int y = str.charAt(22) - '0';

                if (fig_id.equals("11"))
                {
                    if (x>tamanho-2)        // Shape 3 eixo X
                        return false;
                    
                    if (y-1<=0)         	// Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
             
                    board[y-1][x-1] = "T";	panel[y-1][x-1].setBackground(color);
                    board[y-1][x] 	= "T";	panel[y-1][x].setBackground(color);
                    board[y-1][x+1] = "T";	panel[y-1][x+1].setBackground(color);
                    board[y-2][x] 	= "T";	panel[y-2][x].setBackground(color);
                }
                else if (fig_id.equals("10"))
                {
                    if (x>tamanho-1)          // Shape 3 eixo X
                        return false;
                    
                    if (y>tamanho-2)          // Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "T";	panel[y-1][x-1].setBackground(color);
                    board[y][x-1] 	= "T";	panel[y][x-1].setBackground(color);
                    board[y+1][x-1] = "T";	panel[y+1][x-1].setBackground(color);
                    board[y][x] 	= "T";	panel[y][x].setBackground(color);
                }
                else	//fig_id.equals("12")
                {
                    if (x-1<=0)          // Shape 3 eixo X
                        return false;
                    
                    if (y>tamanho-2)          // Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "T";	panel[y-1][x-1].setBackground(color);
                    board[y][x-1] 	= "T";	panel[y][x-1].setBackground(color);
                    board[y+1][x-1] = "T";	panel[y+1][x-1].setBackground(color);
                    board[y][x-2] 	= "T";	panel[y][x-2].setBackground(color);
                }

                str = str.substring(24);	

            } 
            else 
            {
                int x = str.charAt(14) - '0';
                int y = str.charAt(21) - '0';

                if (str.charAt(7)=='1')
                {
                    if (x>tamanho-3)          // Shape 1 eixo X
                        return false;

                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "I";	panel[y-1][x-1].setBackground(color);
                    board[y-1][x] 	= "I";	panel[y-1][x].setBackground(color);
                    board[y-1][x+1] = "I";	panel[y-1][x+1].setBackground(color);
                    board[y-1][x+2] = "I";	panel[y-1][x+2].setBackground(color);
                }
                else if (str.charAt(7)=='2')
                {
                    if (y>tamanho-3)          // Shape 2 eixo Y
                        return false;
                 
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "I";	panel[y-1][x-1].setBackground(color);
                    board[y][x-1]	= "I";	panel[y][x-1].setBackground(color);
                    board[y+1][x-1] = "I";	panel[y+1][x-1].setBackground(color);
                    board[y+2][x-1] = "I";	panel[y+2][x-1].setBackground(color);
                }
                else if (str.charAt(7)=='3')
                {
                    if (x>tamanho-1)          // Shape 3 eixo X
                        return false;
                    
                    if (y>tamanho-1)          // Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "D";	panel[y-1][x-1].setBackground(color);
                    board[y-1][x] 	= "D";	panel[y-1][x].setBackground(color);
                    board[y][x-1] 	= "D";	panel[y][x-1].setBackground(color);
                    board[y][x] 	= "D";	panel[y][x].setBackground(color);
                }
                else if (str.charAt(7)=='4')
                    return false;

                else if (str.charAt(7)=='5')
                {
                    if (x>tamanho-2)          // Shape 3 eixo X
                        return false;
                    
                    if (y-1<=0)          // Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "L";	panel[y-1][x-1].setBackground(color);
                    board[y-1][x] 	= "L";	panel[y-1][x].setBackground(color);
                    board[y-1][x+1] = "L";	panel[y-1][x+1].setBackground(color);
                    board[y-2][x+1] = "L";	panel[y-2][x+1].setBackground(color);
                }
                else if (str.charAt(7)=='7' )
                {
                    if (x>tamanho-2)          // Shape 3 eixo X
                        return false;
                    
                    if (y>tamanho-1)          // Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "L";	panel[y-1][x-1].setBackground(color);
                    board[y-1][x] 	= "L";	panel[y-1][x].setBackground(color);
                    board[y-1][x+1] = "L";	panel[y-1][x+1].setBackground(color);
                    board[y][x-1] 	= "L";	panel[y][x-1].setBackground(color);
                }
                else if (str.charAt(7)=='6')
                {
                    if (x>tamanho-1)          // Shape 3 eixo X
                        return false;
                    
                    if (y>tamanho-2)          // Shape 3 eixo Y
                        return false;
                   
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "L";	panel[y-1][x-1].setBackground(color);
                    board[y-1][x] 	= "L";	panel[y-1][x].setBackground(color);
                    board[y][x] 	= "L";	panel[y][x].setBackground(color);
                    board[y+1][x] 	= "L";	panel[y+1][x].setBackground(color);
                }
                else if (str.charAt(7)=='8')
                {
                    if (x>tamanho-1)          // Shape 3 eixo X
                        return false;
                    
                    if (y>tamanho-2)          // Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "L";	panel[y-1][x-1].setBackground(color);
                    board[y][x-1] 	= "L";	panel[y][x-1].setBackground(color);
                    board[y+1][x-1] = "L";	panel[y+1][x-1].setBackground(color);
                    board[y+1][x] 	= "L";	panel[y+1][x].setBackground(color);
                }
                else if (str.charAt(7)=='9')
                {
                    if (x>tamanho-2)          // Shape 3 eixo X
                        return false;
                    
                    if (y>tamanho-1)          // Shape 3 eixo Y
                        return false;
                    
                    Color color = new Color((int)(Math.random()*0x1000000));
                    
                    board[y-1][x-1] = "T";	panel[y-1][x-1].setBackground(color);
                    board[y-1][x] 	= "T";	panel[y-1][x].setBackground(color);
                    board[y-1][x+1] = "T";	panel[y-1][x+1].setBackground(color);
                    board[y][x] 	= "T";	panel[y][x].setBackground(color);
                }
                str = str.substring(23);
            }
        }
        
        int soma=0;
        for (int a=0 ; a<tamanho; a++)
            for (int b=0; b<tamanho; b++)
                if (board[a][b].equals("L") || board[a][b].equals("T") || board[a][b].equals("D") || board[a][b].equals("I"))
                    soma++;
                
        if (soma!= total*4)
            return false;
        
        new_game.setEnabled(true);
		button.setEnabled(true);
		carregar.setText("");
              
        return true;
    }

	@Override
	public void actionPerformed(ActionEvent arg0)
	{
		if(arg0.getSource().equals(new_game))
		{
			String[] args = new String[0];
			this.dispose();
			Main.main(args);
		}
			
		else
			showSolutions(last_solution, tab_size, num_figures);
		
	}
	
}
