package Tetris;

import java.util.ArrayList;
import java.util.List;

public class Shape
{
	List<int[]> boxes;
    List<int[]> offsets;

    public Shape() 
    {
        boxes = new ArrayList<>();
        offsets = new ArrayList<>();
    }
}
