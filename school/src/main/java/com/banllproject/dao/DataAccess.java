package com.banllproject.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.banllproject.Conexao;

public class DataAccess<T> {
    
    private Connection connection;

    private void getConnection() {
        try {
            this.connection = Conexao.getInstance().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
