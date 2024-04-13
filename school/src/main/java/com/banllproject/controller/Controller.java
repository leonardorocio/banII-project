package com.banllproject.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;

public abstract class Controller {

    protected Date convertStringToSQLDate(String date) {

        try {
            java.util.Date dateFormat = DateFormat.getDateInstance().parse(date);
            long toMilliseconds = dateFormat.getTime();
            return new java.sql.Date(toMilliseconds);
        } catch (ParseException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public void getById() throws SQLException {};
    public void getAll() throws SQLException {};
    public void create() throws SQLException {};
    public void update() throws SQLException {};
    public void delete() throws SQLException {};
    
}
