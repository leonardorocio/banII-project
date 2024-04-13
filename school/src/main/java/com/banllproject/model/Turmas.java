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

public class Turmas {

    private static Connection conexao = Conexao.getInstance().getConnection();
    private int idTurma;
    private String anoSemestre;
    private String localAula;
    private int fkDisciplina;
    private Disciplinas fkDisciplinaObject;

    // N:N
    private int idProfessorDaTurma;

    public Turmas() {
    }

    public Turmas(int idTurma, String anoSemestre, String localAula) {
        this.idTurma = idTurma;
        this.anoSemestre = anoSemestre;
        this.localAula = localAula;
    }

    public Turmas(int idTurma, String anoSemestre, String localAula, int fkDisciplina, Disciplinas fkDisciplinaObject) {
        this.idTurma = idTurma;
        this.anoSemestre = anoSemestre;
        this.localAula = localAula;
        this.fkDisciplina = fkDisciplina;
        this.fkDisciplinaObject = fkDisciplinaObject;
    }

    public Turmas(String anoSemestre, String localAula, int fkDisciplina, int idProfessorDaTurma) {
        this.anoSemestre = anoSemestre;
        this.localAula = localAula;
        this.fkDisciplina = fkDisciplina;
        this.idProfessorDaTurma = idProfessorDaTurma;
    }

    public int getIdProfessorDaTurma() {
        return idProfessorDaTurma;
    }

    public void setIdProfessorDaTurma(int idProfessorDaTurma) {
        this.idProfessorDaTurma = idProfessorDaTurma;
    }

    public int getIdTurma() {
        return idTurma;
    }

    public void setIdTurma(int idTurma) {
        this.idTurma = idTurma;
    }

    public String getAnoSemestre() {
        return anoSemestre;
    }

    public void setAnoSemestre(String anoSemestre) {
        this.anoSemestre = anoSemestre;
    }

    public String getLocalAula() {
        return localAula;
    }

    public void setLocalAula(String localAula) {
        this.localAula = localAula;
    }

    public int getFkDisciplina() {
        return fkDisciplina;
    }

    public void setFkDisciplina(int fkDisciplina) {
        this.fkDisciplina = fkDisciplina;
    }

    public Disciplinas getFkDisciplinaObject() {
        return fkDisciplinaObject;
    }

    public void setFkDisciplinaObject(Disciplinas fkDisciplinaObject) {
        this.fkDisciplinaObject = fkDisciplinaObject;
    }

    public void imprimeTurma() {
        System.out.println(
                String.format("\nInformações da turma:\nID: %d\nAno/Semestre: %s\nLocal de aula: %s", this.getIdTurma(),
                        this.getAnoSemestre(), this.getLocalAula()));
        if (this.getFkDisciplinaObject() != null) {
            this.getFkDisciplinaObject().imprimeDisciplina();
        } else {
            Menu.pausaMenu();
        }
    }

    public static Turmas getById(int idTurma) throws SQLException {
        String sql = "SELECT * FROM turmas WHERE id_turma = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idTurma);
        ResultSet result = statement.executeQuery();
        if (result.next()) {
            int fk = result.getInt("fk_disciplina");
            Disciplinas disciplinas = new Disciplinas();
            if (fk != 0) {
                disciplinas = Disciplinas.getById(fk);
            }
            return new Turmas(
                    result.getInt("id_turma"),
                    result.getString("ano_semestre"),
                    result.getString("local_aula"),
                    fk,
                    disciplinas);
        } else {
            System.out.println("Turma não encontrada com esse ID!");
            return null;
        }
    }

    private static void createManyToManyRelation(Turmas turmas) throws SQLException {
        String sql = "INSERT INTO turma_professor (id_turma, id_professor) VALUES (?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, turmas.getIdTurma());
        preparedStatement.setInt(2, turmas.getIdProfessorDaTurma());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void create(Turmas turmas) throws SQLException {
        String sql = "INSERT INTO turmas (ano_semestre, local_aula, fk_disciplina) VALUES (?, ?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, turmas.getAnoSemestre());
        preparedStatement.setString(2, turmas.getLocalAula());
        preparedStatement.setInt(3, turmas.getFkDisciplina());
        preparedStatement.execute();
        preparedStatement.close();

        Turmas.createManyToManyRelation(turmas);
    }

    public static void update(List<String> updatedFields, Turmas turmas) throws SQLException {
        String setFields = "SET ";
        for (int i = 0; i < updatedFields.size(); i++) {
            if (i < updatedFields.size() - 1)
                setFields += updatedFields.get(i) + " = ?,";
            else
                setFields += updatedFields.get(i) + " = ?";
        }
        String sql = "UPDATE turmas " + setFields + " WHERE id_turma = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        int i;
        for (i = 1; i <= updatedFields.size(); i++) {
            if (updatedFields.get(i - 1).equals("ano_semestre")) {
                preparedStatement.setString(i, turmas.getAnoSemestre());
            }
            if (updatedFields.get(i - 1).equals("local_aula")) {
                preparedStatement.setString(i, turmas.getLocalAula());
            }

        }
        preparedStatement.setInt(i, turmas.getIdTurma());
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static void delete(int idTurma) throws SQLException {
        String sql = "DELETE FROM turmas WHERE id_turma = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, idTurma);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static List<Turmas> getAll() throws SQLException {
        String sql = "SELECT * FROM turmas";
        Statement statement = conexao.createStatement();
        ResultSet resultList = statement.executeQuery(sql);
        List<Turmas> turmas = new ArrayList<>();
        while (resultList.next()) {

            int fk = resultList.getInt("fk_disciplina");
            Disciplinas disciplinas = new Disciplinas();
            if (fk != 0) {
                disciplinas = Disciplinas.getById(fk);
            }
            turmas.add(
                    new Turmas(
                            resultList.getInt("id_turma"),
                            resultList.getString("ano_semestre"),
                            resultList.getString("local_aula"),
                            fk,
                            disciplinas));
        }
        return turmas;
    }

}
