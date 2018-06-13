/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.trabalho;

import java.io.Serializable;
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
@XmlType(name = "autor", propOrder = {
    "code",
    "name",
    "email"
})
@XmlRootElement(name = "autor") 

public class Author implements Serializable{
    @XmlElement(required = true)
    private int code;
    @XmlElement(required = true)
    private String name;
    @XmlElement(required = true)
    private String email;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
