package com.banllproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.Conexao;

public class Disciplinas {
    
    private static Connection conexao = Conexao.getInstance().getConnection();
    private int idDisciplina;
    private String nome;
    private int cargaHoraria;

    // Atributo para criação de tabela N:N
    private int idCursoDaDisciplina;

    public Disciplinas(String nome, int cargaHoraria) {
        this.nome = nome;
        this.cargaHoraria = cargaHoraria;
    }

    public Disciplinas(String nome, int cargaHoraria, int idCursoDaDisciplina) {
        this.nome = nome;
        this.cargaHoraria = cargaHoraria;
        this.idCursoDaDisciplina = idCursoDaDisciplina;
    }
    
    public Disciplinas(int idDisciplina, String nome, int cargaHoraria) {
        this(nome, cargaHoraria);
        this.idDisciplina = idDisciplina;
    }
    
    public int getIdDisciplina() {
        return idDisciplina;
    }
    public void setIdDisciplina(int idDisciplina) {
        this.idDisciplina = idDisciplina;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public int getCargaHoraria() {
        return cargaHoraria;
    }
    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    public void imprimeDisciplina() {
        System.out.println(
            String.format("Informações da disciplina:\nID: %d\nNome: %s\nCarga Horária: %d", this.getIdDisciplina(), this.getNome(), this.getCargaHoraria())
        );
    }

    public int getIdCursoDaDisciplina() {
        return idCursoDaDisciplina;
    }

    public void setIdCursoDaDisciplina(int idCursoDaDisciplina) {
        this.idCursoDaDisciplina = idCursoDaDisciplina;
    }

    public static Disciplinas getById(int idDisciplina) throws SQLException {
        String sql = "SELECT * FROM disciplinas WHERE id_disciplina = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idDisciplina);
        ResultSet result = statement.executeQuery();
        return new Disciplinas(
            result.getInt("id_disciplina"), 
            result.getString("nome"),
            result.getInt("carga_horaria")
        );
    }

    private static void createManyToManyRelation(Disciplinas disciplina) throws SQLException {
        String sql = "INSERT INTO cursos_disciplinas (id_disciplina, id_curso) VALUES (?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, disciplina.getIdDisciplina());
        preparedStatement.setInt(2, disciplina.getIdCursoDaDisciplina());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void create(Disciplinas disciplina) throws SQLException {
        String sql = "INSERT INTO disciplinas (nome) VALUES (?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, disciplina.getNome());
        preparedStatement.setInt(2, disciplina.getCargaHoraria());
        preparedStatement.execute();
        preparedStatement.close();
        
        Disciplinas.createManyToManyRelation(disciplina);
    }

    public static void update(List<String> updatedFields, Disciplinas disciplina) throws SQLException {
        String setFields = "SET ";
        for (int i = 0; i < updatedFields.size(); i++) {
            if (i < updatedFields.size() - 1) 
                setFields += updatedFields.get(i) + " = ?";
            else
                setFields += updatedFields.get(i) + " = ?,";
        }
        String sql = "UPDATE disciplinas " + setFields + " WHERE id_disciplina = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, disciplina.nome);
        preparedStatement.setInt(2, disciplina.idDisciplina);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }
    
    public static void delete(int idDisciplina) throws SQLException {
        String sql = "DELETE FROM disciplinas WHERE id_disciplina = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, idDisciplina);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static List<Disciplinas> getAll() throws SQLException {
        String sql = "SELECT * FROM disciplinas";
        Statement statement = conexao.createStatement();
        ResultSet resultList = statement.executeQuery(sql);
        List<Disciplinas> disciplinas = new ArrayList<>();
        while (resultList.next()) {
            disciplinas.add(
                new Disciplinas(
                    resultList.getInt("id_disciplina"),
                    resultList.getString("nome"),
                    resultList.getInt("carga_horaria")
                )
            );
        }
        return disciplinas;
    }

}
