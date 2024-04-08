package com.banllproject.controller;

import java.sql.SQLException;

public interface Controller {

    public void getById() throws SQLException;
    public void getAll() throws SQLException;
    public void create() throws SQLException;
    public void update() throws SQLException;
    public void delete() throws SQLException;
    
}
