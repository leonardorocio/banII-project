package com.banllproject.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.Conexao;

public class Professores {

    private static Connection conexao = Conexao.getInstance().getConnection();
    private int idProfessor;
    private String nome;
    private String sobrenome;
    private String sexoBiologico;
    private String cpf;
    private Date dtNascimento;
    private int fkDepartamento;
    private Departamentos fkDepartamentoObject;

    public Professores(int idProfessor, String nome, String sobrenome, String sexoBiologico, Date dtNascimento) {
        this.idProfessor = idProfessor;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.sexoBiologico = sexoBiologico;
        this.dtNascimento = dtNascimento;
    }

    public Professores(int idProfessor, String nome, String sobrenome, String sexoBiologico, String cpf,
            Date dtNascimento, int fkDepartamento) {
        this.idProfessor = idProfessor;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.sexoBiologico = sexoBiologico;
        this.cpf = cpf;
        this.dtNascimento = dtNascimento;
        this.fkDepartamento = fkDepartamento;
    }

    public Professores(int idProfessor, String nome, String sobrenome, String sexoBiologico, String cpf,
            Date dtNascimento, int fkDepartamento, Departamentos fkDepartamentoObject) {
        this.idProfessor = idProfessor;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.sexoBiologico = sexoBiologico;
        this.cpf = cpf;
        this.dtNascimento = dtNascimento;
        this.fkDepartamento = fkDepartamento;
        this.fkDepartamentoObject = fkDepartamentoObject;
    }

    public String getSexoBiologico() {
        return sexoBiologico;
    }

    public void setSexoBiologico(String sexoBiologico) {
        this.sexoBiologico = sexoBiologico;
    }

    public int getIdProfessor() {
        return idProfessor;
    }

    public void setIdProfessor(int idProfessor) {
        this.idProfessor = idProfessor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public Date getDtNascimento() {
        return dtNascimento;
    }

    public void setDtNascimento(Date dtNascimento) {
        this.dtNascimento = dtNascimento;
    }

    public int getFkDepartamento() {
        return fkDepartamento;
    }

    public void setFkDepartamento(int fkDepartamento) {
        this.fkDepartamento = fkDepartamento;
    }

    public Departamentos getFkDepartamentoObject() {
        return fkDepartamentoObject;
    }

    public void setFkDepartamentoObject(Departamentos fkDepartamentoObject) {
        this.fkDepartamentoObject = fkDepartamentoObject;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void imprimeProfessor() {
        System.out.println(
                String.format(
                        "Informações do professor:\nID: %d\nNome: %s\nSobrenome: %s\nCPF: %s\nData de nascimento: %s",
                        this.getIdProfessor(), this.getNome(), this.getSobrenome(), this.getCpf(),
                        this.getDtNascimento().toString()));
        this.getFkDepartamentoObject().imprimeDepartamento();
    }

    public static Professores getById(int idProfessor) throws SQLException {
        String sql = "SELECT * FROM professores WHERE id_professor = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idProfessor);
        ResultSet result = statement.executeQuery();
        int fk = result.getInt("fk_disciplina");
        Departamentos departamentos = new Departamentos();
        if (fk != 0) {
            departamentos = Departamentos.getById(fk);
        }
        return new Professores(
                result.getInt("id_professor"),
                result.getString("nome"),
                result.getString("sobrenome"),
                result.getString("sexo_biologico"),
                result.getString("cpf"),
                result.getDate("dt_nascimento"),
                fk,
                departamentos);
    }

    // private static void createManyToManyRelation(Disciplinas disciplina) throws
    // SQLException {
    // String sql = "INSERT INTO cursos_disciplinas (id_disciplina, id_curso) VALUES
    // (?, ?)";
    // PreparedStatement preparedStatement = conexao.prepareStatement(sql);
    // preparedStatement.setInt(1, disciplina.getIdDisciplina());
    // preparedStatement.setInt(2, disciplina.getIdCursoDaDisciplina());
    // preparedStatement.execute();
    // preparedStatement.close();
    // }

    public static void create(Professores professores) throws SQLException {
        String sql = "INSERT INTO professores (nome, sobrenome, sexo_biologico, cpf, dt_nascimento, fk_departamento) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, professores.getNome());
        preparedStatement.setString(2, professores.getSobrenome());
        preparedStatement.setString(3, professores.getSexoBiologico());
        preparedStatement.setString(4, professores.getCpf());
        preparedStatement.setDate(5, professores.getDtNascimento());
        preparedStatement.setInt(6, professores.getFkDepartamento());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void update(List<String> updatedFields, Professores professores) throws SQLException {
        String setFields = "SET ";
        for (int i = 0; i < updatedFields.size(); i++) {
            if (i < updatedFields.size() - 1)
                setFields += updatedFields.get(i) + " = ?";
            else
                setFields += updatedFields.get(i) + " = ?,";
        }
        String sql = "UPDATE professores " + setFields + " WHERE id_professor = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        int i;
        for (i = 1; i <= updatedFields.size(); i++) {
            if (updatedFields.get(i).equals("nome")) {
                preparedStatement.setString(i, professores.getNome());
            }
            if (updatedFields.get(i).equals("sobrenome")) {
                preparedStatement.setString(i, professores.getSobrenome());
            }
            if (updatedFields.get(i).equals("sexo_biologico")) {
                preparedStatement.setString(i, professores.getSobrenome());
            }
            if (updatedFields.get(i).equals("dt_nascimento")) {
                preparedStatement.setDate(i, professores.getDtNascimento());
            }
        }
        preparedStatement.setInt(i, professores.getIdProfessor());
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static void delete(int idProfessor) throws SQLException {
        String sql = "DELETE FROM professores WHERE id_professor = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, idProfessor);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static List<Professores> getAll() throws SQLException {
        String sql = "SELECT * FROM professores";
        Statement statement = conexao.createStatement();
        ResultSet resultList = statement.executeQuery(sql);
        List<Professores> professores = new ArrayList<>();
        while (resultList.next()) {
            int fk = resultList.getInt("fk_disciplina");
            Departamentos departamentos = new Departamentos();
            if (fk != 0) {
                departamentos = Departamentos.getById(fk);
            }
            professores.add(
                new Professores(
                    resultList.getInt("id_professor"),
                    resultList.getString("nome"),
                    resultList.getString("sobrenome"),
                    resultList.getString("sexo_biologico"),
                    resultList.getString("cpf"),
                    resultList.getDate("dt_nascimento"),
                    fk,
                    departamentos)
            );
        }
        return professores;
    }

}
