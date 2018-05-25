/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author efpr
 */
public class Gerate {

    private Random random;
    private Connection con;

    public Gerate(Connection con) {
        random = new Random();
        this.con = con;
    }

    private String readFile(String arg0, int line) {
        try {
            InputStream input = getClass().getResourceAsStream(arg0);
            BufferedReader br = new BufferedReader(new InputStreamReader(input));
            for (int i = 0; i < line; i++) {
                br.readLine();
            }
            return br.readLine();
        } catch (Exception ex) {
            System.out.println("");
            return "Erro";
        }

    }

    private void writeFile(String arg0, String line) {
        BufferedWriter br = null;
        try {
            br = new BufferedWriter(new FileWriter(arg0, true));
            br.write(line);
            br.newLine();
            br.flush();
        } catch (Exception ex) {
            System.out.println("");
        }
        if (br != null) {
            try {
                br.close();
            } catch (IOException ioe2) {
                // just ignore it
            }
        }
    }

    private int between(int min, int max) {
        return random.nextInt(max - min) + min;
    }

    private void genarate_escola(int cod, String school_name, String name, int cod_instituicao, boolean oracle) {

        ArrayList<String> list = new ArrayList<>();

        list.add("" + cod_instituicao + cod); // codigo da escola
        list.add("" + cod_instituicao); // codigo da instituição
        list.add("'" + school_name + "'"); // nome da escola
        list.add("'" + name + "'"); // pseudominio

        //city_file = open("city.txt", "r")
        list.add("'" + readFile("city.txt", between(1, 2699)) + "'"); // cidade
        String[] modelo_de_ensino = {"Private", "Public"};
        String[] choice = {"S", "N"};

        list.add("'" + modelo_de_ensino[random.nextInt(2)] + "'"); // modelo de ensino
        list.add("'" + choice[random.nextInt(2)] + "'"); // teste de admissao
        list.add("" + between(1000, 9999)); // codigo do estado
        list.add("'" + choice[random.nextInt(2)] + "'"); // Escola principal da instituição ?
        list.add("'" + choice[random.nextInt(2)] + "'"); // Esnsino doméstico
        list.add("'" + choice[random.nextInt(2)] + "'"); // ajuda financeira
        list.add("'" + choice[random.nextInt(2)] + "'"); // em funcionamento

        list.add("" + between(10, 99)); // classificação basica
        list.add("" + between(10, 99)); // classificação de estudadentes
        list.add("" + between(10, 99)); // classificação de espaços

        list.add("" + between(1000000, 9999999)); // valor propinas recebidas
        list.add("" + between(1000000, 9999999)); // proprinas de alunos internos
        list.add("" + between(1000000, 9999999)); // propinas de alunos externos

        list.add("" + between(100000000, 999999999)); // despesas da escola

        list.add("" + between(1000000, 9999999)); // media salarial
        list.add("" + between(1000000, 9999999));// media de custo para estudantes
        list.add("" + between(1000000, 9999999)); // media de custo por curso
        list.add("" + between(10000, 99999)); // media rendimentos baixos
        list.add("" + between(10000, 99999)); // media rendimentos medios
        list.add("" + between(1000000, 9999999)); // media rendimentos altos

        list.add("" + between(100000, 999999)); // candidatura de apoio escolar

        list.add("" + between(100, 9999));// estudantes femeninos
        list.add("" + between(100, 9999)); // estudantes masculinos
        list.add("" + between(100, 9999));// estudantes dependentes
        list.add("" + between(100, 9999)); // estudantes veteranos
        list.add("" + between(100, 9999)); // estudantes primeira geração

        String head = "INSERT INTO Escola VALUES (";
        String tail = ")";

        String body = list.get(0);
        for (int i = 1; i < list.size(); i++) {
            body += "," + list.get(i);
        }

        String stmt = head + body + tail;
        if (oracle) {
            try {
                con.prepareStatement(stmt);
            } catch (SQLException ex) {
                System.out.println("Falhou no statement");
            }
        } else {

            writeFile("escola.txt", stmt);
        }
    }

    public void genarate_inst(int cod_instituicao, boolean oracle) {
        ArrayList<String> list = new ArrayList<>();

        list.add("" + cod_instituicao);

        list.add("" + between(-1000, 1000)); // latitude
        list.add("" + between(-1000, 1000)); // longitude

        int num_campus = between(1, 5);
        list.add("" + num_campus); // numero de campus

        String first = readFile("nomes.txt", random.nextInt(1219));
        String last = readFile("nomes.txt", random.nextInt(1219));

        String nome = "www.Schl" + first + last + ".us";

        list.add("'" + nome + "/site" + "'"); // site da inst
        list.add("'" + nome + "/precos" + "'"); // site com preços

        list.add(Integer.toString(1 + random.nextInt(9999))); // codigo da instituição

        first = readFile("nomes.txt", random.nextInt(1219));
        last = readFile("nomes.txt", random.nextInt(1219));
        list.add("'" + "Ang. " + first + " " + last + "'");

        String head = "INSERT INTO Instituicao VALUES (";
        String tail = ")";

        String body = list.get(0);
        for (int i = 1; i < list.size(); i++) {
            body += "," + list.get(i);
        }

        String stmt = head + body + tail;
        if (oracle) {
            try {
                con.prepareStatement(stmt);
            } catch (SQLException ex) {
                System.out.println("Falhou no statement");
            }
        } else {

            writeFile("inst.txt", stmt);
        }

        for (int cod = 0; cod < num_campus; cod++) {
            first = readFile("nomes.txt", random.nextInt(1219));
            last = readFile("nomes.txt", random.nextInt(1219));

            String school_name = "School " + first + last;
            genarate_escola(cod, school_name, first, cod_instituicao, oracle);
        }

    }

}
