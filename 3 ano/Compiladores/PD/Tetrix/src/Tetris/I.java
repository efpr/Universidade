package Tetris;

public class I extends Shape
{
		public I(int x) 
		{
			switch(x)
			{
				case 0:	offsets.add(new int[]{0, 0});
						boxes.add(new int[]{4, 1});
						break;
		        
	            default:	offsets.add(new int[]{0, 0});
	            			boxes.add(new int[]{1, 4});
			}
	        
		}
	
}
