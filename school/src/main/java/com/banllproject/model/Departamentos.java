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
    private String sigla;

    public Departamentos() {
    }

    public Departamentos(String nome, String sigla) {
        this.nome = nome;
        this.sigla = sigla;
    }

    public Departamentos(int idDepartamento, String nome, String sigla) {
        this.idDepartamento = idDepartamento;
        this.nome = nome;
        this.sigla = sigla;
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

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public void imprimeDepartamento() {
        System.out.println(
                String.format("\nInformações do departamento:\nID: %d\nNome: %s\nSigla: %s", this.getIdDepartamento(),
                        this.getNome(), this.getSigla()));
        Menu.pausaMenu();
    }

    public static Departamentos getById(int idDepartamento) throws SQLException {
        String sql = "SELECT * FROM departamentos WHERE id_Departamento = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idDepartamento);
        ResultSet result = statement.executeQuery();
        if (result.next()) {
            return new Departamentos(result.getInt("id_departamento"),
                    result.getString("nome"),
                    result.getString("sigla"));
        } else {
            System.out.println("Departamento não encontrado com esse ID!");
            return null;
        }
    }

    public static void create(Departamentos departamento) throws SQLException {
        String sql = "INSERT INTO departamentos (nome, sigla) VALUES (?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, departamento.getNome());
        preparedStatement.setString(2, departamento.getSigla());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void update(List<String> updatedFields, Departamentos departamento) throws SQLException {
        String setFields = "SET ";
        for (int i = 0; i < updatedFields.size(); i++) {
            if (i < updatedFields.size() - 1)
                setFields += updatedFields.get(i) + " = ?";
            else
                setFields += updatedFields.get(i) + " = ?,";
        }
        String sql = "UPDATE departamentos " + setFields + " WHERE id_departamento = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        int i;
        for (i = 1; i <= updatedFields.size(); i++) {
            if (updatedFields.get(i).equals("nome")) {
                preparedStatement.setString(i, departamento.getNome());
            }
            if (updatedFields.get(i).equals("duracao_minima")) {
                preparedStatement.setString(i, departamento.getSigla());
            }
        }
        preparedStatement.setInt(i, departamento.getIdDepartamento());
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
                    new Departamentos(resultList.getInt("id_departamento"),
                            resultList.getString("nome"),
                            resultList.getString("sigla")));
        }
        return departamentos;
    }

    public static Connection getConexao() {
        return conexao;
    }

    public static void setConexao(Connection conexao) {
        Departamentos.conexao = conexao;
    }

}
