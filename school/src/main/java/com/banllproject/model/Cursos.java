package com.banllproject.model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.Conexao;

public class Cursos {

    private int idCurso;
    private String nome;

    private static Connection conexao = Conexao.getInstance().getConnection();

    public Cursos() {
    }

    public Cursos(String nome) throws SQLException {
        this.nome = nome;
    }

    public Cursos(int idCurso, String nome) throws SQLException {
        this.idCurso = idCurso;
        this.nome = nome;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void imprimeCurso() {
        System.out.println(
                String.format("Informações do curso:\nID: %d\nNome: %s", this.getIdCurso(), this.getNome()));
    }

    public static Cursos getById(int idCurso) throws SQLException {
        String sql = "SELECT * FROM cursos WHERE id_curso = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idCurso);
        ResultSet result = statement.executeQuery();
        return new Cursos(result.getInt("id_curso"), result.getString("nome"));
    }

    public static void create(Cursos curso) throws SQLException {
        String sql = "INSERT INTO cursos (nome) VALUES (?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, curso.getNome());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void update(Cursos curso) throws SQLException {
        String sql = "UPDATE cursos SET nome = ? WHERE id_curso = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, curso.nome);
        preparedStatement.setInt(2, curso.idCurso);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static void delete(int idCurso) throws SQLException {
        String sql = "DELETE FROM cursos WHERE id_curso = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, idCurso);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static List<Cursos> getAll() throws SQLException {
        String sql = "SELECT * FROM cursos";
        Statement statement = conexao.createStatement();
        ResultSet resultList = statement.executeQuery(sql);
        List<Cursos> cursos = new ArrayList<>();
        while (resultList.next()) {
            cursos.add(
                    new Cursos(
                            resultList.getInt("id_curso"),
                            resultList.getString("nome")));
        }
        return cursos;
    }

}
