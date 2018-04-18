package Tetris;

import org.chocosolver.solver.Model;
import org.chocosolver.solver.Solver;
import org.chocosolver.solver.constraints.Constraint;
import org.chocosolver.solver.constraints.nary.geost.Constants;
import org.chocosolver.solver.constraints.nary.geost.externalConstraints.ExternalConstraint;
import org.chocosolver.solver.constraints.nary.geost.externalConstraints.NonOverlapping;
import org.chocosolver.solver.constraints.nary.geost.geometricPrim.GeostObject;
import org.chocosolver.solver.constraints.nary.geost.geometricPrim.ShiftedBox;
import org.chocosolver.solver.search.strategy.Search;
import org.chocosolver.solver.variables.IntVar;
import org.chocosolver.util.tools.ArrayUtils;


import java.util.ArrayList;
import java.util.List;

import javax.swing.Box;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;


public class Main 
{

    private List<Shape> figures = new ArrayList<>();
    private Board board;

    public static void main(String[] args) 
    {
    	int size=0, I=0, L=0, D=0, T=0;
    	
    	
    	while(true)
    	{
    		try
    		{
    			JTextField I_field = new JTextField(5);
    		    JTextField L_field = new JTextField(5);
    		    JTextField D_field = new JTextField(5);
    		    JTextField T_field = new JTextField(5);
    		    
    		    JPanel myPanel = new JPanel();
    		    myPanel.add(new JLabel("I:"));
    		    myPanel.add(I_field);
    		    myPanel.add(Box.createHorizontalStrut(15));
    		    myPanel.add(new JLabel("L:"));
    		    myPanel.add(L_field);
    		    myPanel.add(Box.createHorizontalStrut(15));
    		    myPanel.add(new JLabel("D:"));
    		    myPanel.add(D_field);
    		    myPanel.add(Box.createHorizontalStrut(15));
    		    myPanel.add(new JLabel("T:"));
    		    myPanel.add(T_field);
    		    
    		    int fechar = JOptionPane.showConfirmDialog(null, myPanel, "Insert the number of shapes", JOptionPane.OK_CANCEL_OPTION);
    		    if(JOptionPane.CANCEL_OPTION==fechar||fechar==JOptionPane.CLOSED_OPTION)
    		    	 System.exit(0);
    		    
    		    I =Integer.parseInt(I_field.getText());
    		    L =Integer.parseInt(L_field.getText());
    		    D =Integer.parseInt(D_field.getText());
    		    T =Integer.parseInt(T_field.getText());
    		    
    		    if(I==0 && D==0 && L==0 && T==0)
    		    	throw new Exception("Exception thrown");;
    		    
    		   
    		    String cancel = JOptionPane.showInputDialog("insert the size:");
    		    if(cancel==null||(cancel!=null && ("".equals(cancel))))
        			System.exit(0);
        		size = Integer.parseInt(cancel);
        		
        		
        		if(I+L+D+T!=size)
        			JOptionPane.showMessageDialog(null, "Invalid input (I+L+D+T!=Tamanho)");
        		else if(T>size||I>size||L>size||D>size)
        			JOptionPane.showMessageDialog(null, "Invalid input (I||L||D||T>Tamanho)");
        		else if(I<0||D<0||L<0||T<0)
        			JOptionPane.showMessageDialog(null, "Invalid input (I||L||D||T<0)");
        		else
        			break;
        	}
        	catch(Exception e)
        	{
        		JOptionPane.showMessageDialog(null, "invalid input");
        	}
    	}
    	
        new Main(new int[]{I, D, L, T}, size, size);  	
    }

    public Main(int[] qts, int X, int Y) 
    {
    	board = new Board(X);
    	
        figures.add(new I(0));	figures.add(new I(1));
        figures.add(new D(0));	figures.add(new D(1));
        figures.add(new L(0));	figures.add(new L(1));	figures.add(new L(2));	figures.add(new L(3));
        figures.add(new T(0));	figures.add(new T(1));	figures.add(new T(2));	figures.add(new T(4));

        List<ShiftedBox> figure_swift = new ArrayList<>();
        int sid = 0;
        for (Shape s : figures) 
        {
            sid++;
            for (int i = 0; i < s.boxes.size(); i++) 
                figure_swift.add(new ShiftedBox(sid, s.offsets.get(i), s.boxes.get(i)));
        }

        List<int[]> figureID = new ArrayList<>();
        figureID.add(new int[]{1, 2}); 			// I
        figureID.add(new int[]{3, 4}); 			// D
        figureID.add(new int[]{5, 6, 7, 8});	// L
        figureID.add(new int[]{9, 10, 11, 12}); // T

        Model model = new Model();
        int dim = 2;
        
        List<GeostObject> objects = new ArrayList<>();
        List<IntVar> coordinates = new ArrayList<>();
        List<IntVar> theShapes = new ArrayList<>();
        
        int k = 1;
        for (int j = 0; j < qts.length; j++) 
        {
            for (int i = 0; i < qts[j]; i++) 
            {
                IntVar shapeId = model.intVar("sid_" + k, figureID.get(j));
                theShapes.add(shapeId);
                IntVar[] coords = new IntVar[2];
                coords[0] = model.intVar("X_" + k, 1, X, false);
                coords[1] = model.intVar("Y_" + k, 1, Y, false);
                coordinates.add(coords[0]);
                coordinates.add(coords[1]);
                objects.add(new GeostObject(dim, k++, shapeId, coords, model.intVar(1), model.intVar(1), model.intVar(1)));
            }
        }

        List<ExternalConstraint> ectr2 = new ArrayList<>();

        int[] objOfEctr2 = new int[objects.size()];
        for (int d = 0; d < objects.size(); d++) 
            objOfEctr2[d] = objects.get(d).getObjectId();
        

        NonOverlapping n2 = new NonOverlapping(Constants.NON_OVERLAPPING, ArrayUtils.array(1,dim), objOfEctr2);
        ectr2.add(n2);

        Constraint geost = Geost_Model.geost(dim, objects, figure_swift, ectr2);
        model.post(geost);

        Solver solver = model.getSolver();
        solver.setSearch(Search.inputOrderLBSearch(coordinates.toArray(new IntVar[coordinates.size()])),
                Search.inputOrderLBSearch(theShapes.toArray(new IntVar[theShapes.size()])));
        
        board.showSolutions(solver, X, qts);

    }

}
