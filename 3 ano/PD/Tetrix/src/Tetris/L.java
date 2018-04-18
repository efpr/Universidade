package Tetris;

public class L extends Shape
{
	public L(int x)
	{
		switch(x)
		{
			case 0: offsets.add(new int[]{0, 0});
		            boxes.add(new int[]{3, 1});
		            offsets.add(new int[]{2, -1});
		            boxes.add(new int[]{1, 1});
		            break;
			case 1:	offsets.add(new int[]{0, 0});
		            boxes.add(new int[]{1, 1});
		            offsets.add(new int[]{1, 0});
		            boxes.add(new int[]{1, 3});
		            break;
			case 2: offsets.add(new int[]{0, 0});
		            boxes.add(new int[]{3, 1});
		            offsets.add(new int[]{0, 1});
		            boxes.add(new int[]{1, 1});
		            break;
            default:offsets.add(new int[]{0, 0});
		            boxes.add(new int[]{1, 3});
		            offsets.add(new int[]{1, 2});
		            boxes.add(new int[]{1, 1});
		}
	}
}
