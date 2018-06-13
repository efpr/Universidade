/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.trabalho;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author dias
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "artigo", propOrder = {
    "code",
    "titulo",
    "stock",
    "sold",
    "author"
})
@XmlRootElement(name = "artigo") 

public class ArticleImpl implements Serializable{
    @XmlElement(required = true)
    private int code;
    @XmlElement(required = true)
    private String titulo;
    @XmlElement(required = true)
    private int stock;
    @XmlElement(required = true)
    private int sold;
    @XmlElement(required = true)
    private ArrayList<Integer> author;

    public ArticleImpl(int code, String titulo, int stock, int sold, ArrayList<Integer> author) {
        this.code = code;
        this.titulo = titulo;
        this.stock = stock;
        this.sold = sold;
        this.author = author;
    }
    
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public ArrayList<Integer> getAuthor() {
        return author;
    }

    public void setAuthor(ArrayList<Integer> author) {
        this.author = author;
    }
}
