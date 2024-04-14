package com.banllproject;

import java.sql.SQLException;

import com.banllproject.view.Menu;

public class App {
    public static void main( String[] args ) {
        try {
            Conexao.getInstance();
            Menu.criaMenu();
            Conexao.closeConnection();
            Menu.closeScanner();
        } catch (SQLException e) {
            System.out.println("Erro de conexão! Verifique os parâmetros de conexão no arquivo project.properties!");
        }
    }
}
