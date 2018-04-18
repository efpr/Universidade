package Tetris;

public class D extends Shape
{
	public D(int x)
	{
		switch(x)
		{
			case 0:	offsets.add(new int[]{0, 0});
					boxes.add(new int[]{2, 2});
					break;
			default:	offsets.add(new int[]{0, 0});
						boxes.add(new int[]{2, 2});
		}
	}
}
