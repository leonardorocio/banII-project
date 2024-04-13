package com.banllproject.model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.Conexao;
import com.banllproject.view.Menu;

public class Cursos {

    private int idCurso;
    private String nome;
    private int duracaoMinima;
    private int duracaoMaxima;
    private String sigla;

    private static Connection conexao = Conexao.getInstance().getConnection();

    public Cursos(String nome, int duracaoMinima, int duracaoMaxima, String sigla) {
        this.nome = nome;
        this.duracaoMinima = duracaoMinima;
        this.duracaoMaxima = duracaoMaxima;
        this.sigla = sigla;
    }

    public Cursos(int idCurso, String nome, int duracaoMinima, int duracaoMaxima, String sigla) {
        this.idCurso = idCurso;
        this.nome = nome;
        this.duracaoMinima = duracaoMinima;
        this.duracaoMaxima = duracaoMaxima;
        this.sigla = sigla;
    }

    public Cursos() {
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

    public int getDuracaoMinima() {
        return duracaoMinima;
    }

    public void setDuracaoMinima(int duracaoMinima) {
        this.duracaoMinima = duracaoMinima;
    }

    public int getDuracaoMaxima() {
        return duracaoMaxima;
    }

    public void setDuracaoMaxima(int duracaoMaxima) {
        this.duracaoMaxima = duracaoMaxima;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public void imprimeCurso() {
        System.out.println(
                String.format(
                        "\nInformações do curso:\nID: %d\nNome: %s\nSigla: %s\nDuração Mínima: %d semestres\nDuração máxima: %d semestres",
                        this.getIdCurso(), this.getNome(), this.getSigla(), this.getDuracaoMinima(),
                        this.getDuracaoMaxima()));
        Menu.pausaMenu();
    }

    public static Cursos getById(int idCurso) throws SQLException {
        String sql = "SELECT * FROM cursos WHERE id_curso = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idCurso);
        ResultSet result = statement.executeQuery();
        if (result.next()) {
            return new Cursos(result.getInt("id_curso"),
                    result.getString("nome"),
                    result.getInt("duracao_minima"),
                    result.getInt("duracao_maxima"),
                    result.getString("nome"));
        } else {
            System.out.println("Curso não encontrado com esse ID!");
            return null;
        }
    }

    public static void create(Cursos curso) throws SQLException {
        String sql = "INSERT INTO cursos (nome, duracao_minima, duracao_maxima, sigla) VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, curso.getNome());
        preparedStatement.setInt(2, curso.getDuracaoMinima());
        preparedStatement.setInt(3, curso.getDuracaoMaxima());
        preparedStatement.setString(4, curso.getSigla());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void update(List<String> updatedFields, Cursos curso) throws SQLException {
        String setFields = "SET ";
        for (int i = 0; i < updatedFields.size(); i++) {
            if (i < updatedFields.size() - 1)
                setFields += updatedFields.get(i) + " = ?";
            else
                setFields += updatedFields.get(i) + " = ?,";
        }
        String sql = "UPDATE cursos " + setFields + " WHERE id_curso = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        int i;
        for (i = 1; i <= updatedFields.size(); i++) {
            if (updatedFields.get(i).equals("nome")) {
                preparedStatement.setString(i, curso.getNome());
            }
            if (updatedFields.get(i).equals("duracao_minima")) {
                preparedStatement.setInt(i, curso.getDuracaoMinima());
            }
            if (updatedFields.get(i).equals("duracao_maxima")) {
                preparedStatement.setInt(i, curso.getDuracaoMaxima());
            }
            if (updatedFields.get(i).equals("sigla")) {
                preparedStatement.setString(i, curso.getSigla());
            }
        }
        preparedStatement.setInt(i, curso.getIdCurso());
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
                    new Cursos(resultList.getInt("id_curso"),
                            resultList.getString("nome"),
                            resultList.getInt("duracao_minima"),
                            resultList.getInt("duracao_maxima"),
                            resultList.getString("nome")));
        }
        return cursos;
    }

}
