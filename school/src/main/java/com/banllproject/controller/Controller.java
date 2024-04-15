package com.banllproject.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

public abstract class Controller {

    protected Date convertStringToSQLDate(String date) {
        if (!date.equals(".")) {
            try {
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy", new Locale("pt", "BR"));
                long toMilliseconds = dateFormat.parse(date).getTime();
                return new Date(toMilliseconds);
            } catch (ParseException e) {
                System.out.println(e.getMessage());
                return new Date(0);
            }
        }
        return new Date(0);
    }

    public void getById() throws SQLException {
    };

    public void getAll() throws SQLException {
    };

    public void create() throws SQLException {
    };

    public void update() throws SQLException {
    };

    public void delete() throws SQLException {
    };

}
