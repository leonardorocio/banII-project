package com.banllproject;

import java.sql.Connection;
import java.sql.SQLException;

public class App {
    public static void main( String[] args ) throws SQLException {
        Connection connection = Conexao.getInstance().getConnection();
        System.out.println("Hello World");
        connection.close();
    }
}
