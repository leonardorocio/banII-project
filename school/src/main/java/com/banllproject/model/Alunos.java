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
import com.banllproject.view.Menu;

public class Alunos {

    private static Connection conexao = Conexao.getInstance().getConnection();
    private int idAluno;
    private String nome;
    private String sobrenome;
    private Date dtNascimento;
    private String cpf;
    private String sexoBiologico;
    private Date dtIngresso;
    private int fkCurso;
    private Cursos fkCursoObject;

    // N:N
    private int idTurmaDoAluno;

    public Alunos(int idAluno, String nome, String sobrenome, Date dtNascimento, String sexoBiologico,
            Date dtIngresso) {
        this.idAluno = idAluno;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dtNascimento = dtNascimento;
        this.sexoBiologico = sexoBiologico;
        this.dtIngresso = dtIngresso;
    }

    public Alunos(String nome, String sobrenome, Date dtNascimento, String cpf, String sexoBiologico, Date dtIngresso,
            int fkCurso) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dtNascimento = dtNascimento;
        this.cpf = cpf;
        this.sexoBiologico = sexoBiologico;
        this.dtIngresso = dtIngresso;
        this.fkCurso = fkCurso;
    }

    public Alunos(int idAluno, String nome, String sobrenome, Date dtNascimento, String cpf, String sexoBiologico,
            Date dtIngresso, int fkCurso, Cursos fkCursoObject) {
        this.idAluno = idAluno;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dtNascimento = dtNascimento;
        this.cpf = cpf;
        this.sexoBiologico = sexoBiologico;
        this.dtIngresso = dtIngresso;
        this.fkCurso = fkCurso;
        this.fkCursoObject = fkCursoObject;
    }

    public Alunos() {
    }

    public int getIdTurmaDoAluno() {
        return idTurmaDoAluno;
    }

    public void setIdTurmaDoAluno(int idTurmaDoAluno) {
        this.idTurmaDoAluno = idTurmaDoAluno;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
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

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSexoBiologico() {
        return sexoBiologico;
    }

    public void setSexoBiologico(String sexoBiologico) {
        this.sexoBiologico = sexoBiologico;
    }

    public Date getDtIngresso() {
        return dtIngresso;
    }

    public void setDtIngresso(Date dtIngresso) {
        this.dtIngresso = dtIngresso;
    }

    public void imprimeAluno() {
        if (this.getIdAluno() == 0) {
            return;
        }
        System.out.println(
                String.format(
                        "\nInformações do aluno:\nID: %d\nNome: %s %s\nSexo: %s\nCPF: %s\nData de nascimento: %s\nData de Ingresso: %s",
                        this.getIdAluno(), this.getNome(), this.getSobrenome(), this.getSexoBiologico(), this.getCpf(),
                        this.getDtNascimento().toString(), this.getDtIngresso().toString()));
        if (this.getFkCursoObject() != null) {
            this.getFkCursoObject().imprimeCurso();
        } else {
            Menu.pausaMenu();
        }
    }

    public int getFkCurso() {
        return fkCurso;
    }

    public void setFkCurso(int fkCurso) {
        this.fkCurso = fkCurso;
    }

    public Cursos getFkCursoObject() {
        return fkCursoObject;
    }

    public void setFkCursoObject(Cursos fkCursoObject) {
        this.fkCursoObject = fkCursoObject;
    }

    public static Alunos getById(int idAluno) throws SQLException {
        String sql = "SELECT * FROM alunos WHERE id_aluno = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idAluno);
        ResultSet result = statement.executeQuery();
        if (result.next()) {
            int fk = result.getInt("fk_curso");
            Cursos cursos = new Cursos();
            if (fk != 0) {
                cursos = Cursos.getById(fk);
            }
            return new Alunos(
                    result.getInt("id_aluno"),
                    result.getString("nome"),
                    result.getString("sobrenome"),
                    result.getDate("dt_nascimento"),
                    result.getString("cpf"),
                    result.getString("sexo_biologico"),
                    result.getDate("dt_ingresso"),
                    fk,
                    cursos);
        } else {
            System.out.println("Aluno não encontrado com esse ID!");
            return new Alunos();
        }
    }

    private static void createManyToManyRelation(Alunos aluno) throws SQLException {
        String sql = "INSERT INTO turma_aluno (id_turma, id_aluno) VALUES (?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, aluno.getIdTurmaDoAluno());
        preparedStatement.setInt(2, aluno.getIdAluno());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static int create(Alunos aluno) throws SQLException {
        String sql = "INSERT INTO alunos (nome, sobrenome, sexo_biologico, cpf, dt_nascimento, dt_ingresso, fk_curso) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, aluno.getNome());
        preparedStatement.setString(2, aluno.getSobrenome());
        preparedStatement.setString(3, aluno.getSexoBiologico());
        preparedStatement.setString(4, aluno.getCpf());
        preparedStatement.setDate(5, aluno.getDtNascimento());
        preparedStatement.setDate(6, aluno.getDtIngresso());
        preparedStatement.setInt(7, aluno.getFkCurso());
        preparedStatement.execute();
        ResultSet keys = preparedStatement.getGeneratedKeys();
        int keyValue = -1;
        if (keys.next()) {
            keyValue = keys.getInt(1);
            aluno.setIdAluno(keyValue);
            return keyValue;
        }
        preparedStatement.close();
        Alunos.createManyToManyRelation(aluno);
        return keyValue;

    }

    public static void update(List<String> updatedFields, Alunos aluno) throws SQLException {
        String setFields = "SET ";
        for (int i = 0; i < updatedFields.size(); i++) {
            if (i < updatedFields.size() - 1)
                setFields += updatedFields.get(i) + " = ?,";
            else
                setFields += updatedFields.get(i) + " = ?";
        }
        String sql = "UPDATE alunos " + setFields + " WHERE id_aluno = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        int i;
        for (i = 1; i <= updatedFields.size(); i++) {
            if (updatedFields.get(i - 1).equals("nome")) {
                preparedStatement.setString(i, aluno.getNome());
            }
            if (updatedFields.get(i - 1).equals("sobrenome")) {
                preparedStatement.setString(i, aluno.getSobrenome());
            }
            if (updatedFields.get(i - 1).equals("sexo_biologico")) {
                preparedStatement.setString(i, aluno.getSexoBiologico());
            }
            if (updatedFields.get(i - 1).equals("dt_nascimento")) {
                preparedStatement.setDate(i, aluno.getDtNascimento());
            }
            if (updatedFields.get(i - 1).equals("dt_ingresso")) {
                preparedStatement.setDate(i, aluno.getDtIngresso());
            }

        }
        preparedStatement.setInt(i, aluno.getIdAluno());
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static void delete(int idAluno) throws SQLException {
        String sql = "DELETE FROM alunos WHERE id_aluno = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, idAluno);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static List<Alunos> getAll() throws SQLException {
        String sql = "SELECT * FROM alunos";
        Statement statement = conexao.createStatement();
        ResultSet resultList = statement.executeQuery(sql);
        List<Alunos> alunos = new ArrayList<>();
        while (resultList.next()) {
            int fk = resultList.getInt("fk_curso");
            Cursos cursos = new Cursos();
            if (fk != 0) {
                cursos = Cursos.getById(fk);
            }
            alunos.add(
                    new Alunos(
                            resultList.getInt("id_aluno"),
                            resultList.getString("nome"),
                            resultList.getString("sobrenome"),
                            resultList.getDate("dt_nascimento"),
                            resultList.getString("cpf"),
                            resultList.getString("sexo_biologico"),
                            resultList.getDate("dt_ingresso"),
                            fk,
                            cursos));
        }
        return alunos;
    }
}
