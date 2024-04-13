package com.banllproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.Conexao;
import com.banllproject.view.Menu;

public class Departamentos {

    private static Connection conexao = Conexao.getInstance().getConnection();
    private int idDepartamento;
    private String nome;

    public Departamentos() {
    }

    public Departamentos(String nome) {
        this.nome = nome;
    }

    public Departamentos(int idDepartamento, String nome) {
        this.idDepartamento = idDepartamento;
        this.nome = nome;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void imprimeDepartamento() {
        System.out.println(
                String.format("\nInformações do departamento:\nID: %d\nNome: %s", this.getIdDepartamento(),
                        this.getNome()));
        Menu.pausaMenu();
    }

    public static Departamentos getById(int idDepartamento) throws SQLException {
        String sql = "SELECT * FROM departamentos WHERE id_Departamento = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idDepartamento);
        ResultSet result = statement.executeQuery();
        if (result.next()) {
            return new Departamentos(result.getInt("id_departamento"), result.getString("nome"));
        } else {
            System.out.println("Departamento não encontrado com esse ID!");
            return null;
        }
    }

    public static void create(Departamentos departamento) throws SQLException {
        String sql = "INSERT INTO departamentos (nome) VALUES (?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, departamento.getNome());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void update(Departamentos departamento) throws SQLException {
        String sql = "UPDATE departamentos SET nome = ? WHERE id_departamento = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, departamento.nome);
        preparedStatement.setInt(2, departamento.idDepartamento);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static void delete(int idDepartamento) throws SQLException {
        String sql = "DELETE FROM departamentos WHERE id_departamento = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, idDepartamento);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static List<Departamentos> getAll() throws SQLException {
        String sql = "SELECT * FROM departamentos";
        Statement statement = conexao.createStatement();
        ResultSet resultList = statement.executeQuery(sql);
        List<Departamentos> departamentos = new ArrayList<>();
        while (resultList.next()) {
            departamentos.add(
                    new Departamentos(
                            resultList.getInt("id_departamento"),
                            resultList.getString("nome")));
        }
        return departamentos;
    }
}
