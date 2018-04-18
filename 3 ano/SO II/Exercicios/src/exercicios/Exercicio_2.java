/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exercicios;

import java.util.LinkedList;

/**
 *
 * @author Eduardo
 */
public class Exercicio_2
{

    public static void main(String[] args)
    {
        LinkedList<String> l = new LinkedList<>();

        for (int i = 0; i < args.length; i++)
        {
            insertionSort(args[i], l);
            System.out.println("");
        }

        System.out.println(l);
    }

    public static void insertionSort(String nome, LinkedList<String> l)
    {
        int i = 0;
        while (i < l.size() && l.get(i).compareTo(nome) < 0)
        {
            i++;
            System.out.println("sdsd");
            System.out.println(i);
        }
        l.add(i, nome);
    }
}
