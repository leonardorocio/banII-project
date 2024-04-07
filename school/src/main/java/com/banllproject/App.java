package com.banllproject;

import java.sql.Connection;
import java.sql.SQLException;

import com.banllproject.view.Menu;

public class App {
    public static void main( String[] args ) throws SQLException {
        Connection connection = Conexao.getInstance().getConnection();
        Menu.criaMenu();
        
        connection.close();
        Menu.closeScanner();
    }
}
