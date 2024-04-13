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

public class Atividades {

    private static Connection conexao = Conexao.getInstance().getConnection();
    private int idAtividade;
    private String tipoAtividade;
    private String descricaoAtividade;
    private Date dtEntrega;
    private int fkProfessores;
    private Professores fkProfessoresObject;

    // N:N
    private int idAlunoAtividade;

    public Atividades(int idAtividade, String tipoAtividade, String descricaoAtividade, Date dtEntrega) {
        this.idAtividade = idAtividade;
        this.tipoAtividade = tipoAtividade;
        this.descricaoAtividade = descricaoAtividade;
        this.dtEntrega = dtEntrega;
    }

    public Atividades(String tipoAtividade, String descricaoAtividade, Date dtEntrega, int fkProfessores) {
        this.tipoAtividade = tipoAtividade;
        this.descricaoAtividade = descricaoAtividade;
        this.dtEntrega = dtEntrega;
        this.fkProfessores = fkProfessores;
    }

    public Atividades(int idAtividade, String tipoAtividade, String descricaoAtividade, Date dtEntrega,
            int fkProfessores, Professores fkProfessoresObject) {
        this.idAtividade = idAtividade;
        this.tipoAtividade = tipoAtividade;
        this.descricaoAtividade = descricaoAtividade;
        this.dtEntrega = dtEntrega;
        this.fkProfessores = fkProfessores;
        this.fkProfessoresObject = fkProfessoresObject;
    }

    public int getIdAtividade() {
        return idAtividade;
    }

    public void setIdAtividade(int idAtividade) {
        this.idAtividade = idAtividade;
    }

    public String getTipoAtividade() {
        return tipoAtividade;
    }

    public void setTipoAtividade(String tipoAtividade) {
        this.tipoAtividade = tipoAtividade;
    }

    public String getDescricaoAtividade() {
        return descricaoAtividade;
    }

    public void setDescricaoAtividade(String descricaoAtividade) {
        this.descricaoAtividade = descricaoAtividade;
    }

    public Date getDtEntrega() {
        return dtEntrega;
    }

    public void setDtEntrega(Date dtEntrega) {
        this.dtEntrega = dtEntrega;
    }

    public int getFkProfessores() {
        return fkProfessores;
    }

    public void setFkProfessores(int fkProfessores) {
        this.fkProfessores = fkProfessores;
    }

    public Professores getFkProfessoresObject() {
        return fkProfessoresObject;
    }

    public void setFkProfessoresObject(Professores fkProfessoresObject) {
        this.fkProfessoresObject = fkProfessoresObject;
    }

    public int getIdAlunoAtividade() {
        return idAlunoAtividade;
    }

    public void setIdAlunoAtividade(int idAlunoAtividade) {
        this.idAlunoAtividade = idAlunoAtividade;
    }

    public void imprimeAtividade() {
        System.out.println(
                String.format(
                        "Informações da atividade:\nID: %d\nTipo: %s\nDescrição: %s\nData de Entrega: %s",
                        this.getIdAtividade(), this.getTipoAtividade(), this.getDescricaoAtividade(),
                        this.getDtEntrega().toString()));
        if (this.getFkProfessoresObject() != null) {
            this.getFkProfessoresObject().imprimeProfessor();
        }
    }

    public static Atividades getById(int idAtividade) throws SQLException {
        String sql = "SELECT * FROM atividades WHERE id_aluno = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idAtividade);
        ResultSet result = statement.executeQuery();
        int fk = result.getInt("fk_professor");
        Professores professores = new Professores();
        if (fk != 0) {
            professores = Professores.getById(fk);
        }
        return new Atividades(
                result.getInt("id_atividade"),
                result.getString("tipo_atividade"),
                result.getString("descricao_atividade"),
                result.getDate("dt_entrega"),
                fk,
                professores);
    }

    private static void createManyToManyRelation(Atividades atividades) throws SQLException {
        String sql = "INSERT INTO alunos_atividades (id_turma, id_aluno) VALUES (?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, atividades.getIdAtividade());
        preparedStatement.setInt(2, atividades.getIdAlunoAtividade());
        preparedStatement.execute();
        preparedStatement.close();
    }

    public static void create(Atividades atividade) throws SQLException {
        String sql = "INSERT INTO atividades (tipo_atividade, descricao_atividade, dt_entrega, fk_professor) VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setString(1, atividade.getTipoAtividade());
        preparedStatement.setString(2, atividade.getDescricaoAtividade());
        preparedStatement.setDate(3, atividade.getDtEntrega());
        preparedStatement.setInt(4, atividade.getFkProfessores());
        preparedStatement.execute();
        preparedStatement.close();

        Atividades.createManyToManyRelation(atividade);
    }

    public static void update(List<String> updatedFields, Atividades atividade) throws SQLException {
        String setFields = "SET ";
        for (int i = 0; i < updatedFields.size(); i++) {
            if (i < updatedFields.size() - 1)
                setFields += updatedFields.get(i) + " = ?";
            else
                setFields += updatedFields.get(i) + " = ?,";
        }
        String sql = "UPDATE atividades " + setFields + " WHERE id_atividade = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        int i;
        for (i = 1; i <= updatedFields.size(); i++) {
            if (updatedFields.get(i).equals("tipo_atividade")) {
                preparedStatement.setString(i, atividade.getTipoAtividade());
            }
            if (updatedFields.get(i).equals("descricao_atividade")) {
                preparedStatement.setString(i, atividade.getDescricaoAtividade());
            }
            if (updatedFields.get(i).equals("dt_entrega")) {
                preparedStatement.setDate(i, atividade.getDtEntrega());
            }
        }
        preparedStatement.setInt(i, atividade.getIdAtividade());
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static void delete(int idAtividade) throws SQLException {
        String sql = "DELETE FROM atividades WHERE id_atividade = ?";
        PreparedStatement preparedStatement = conexao.prepareStatement(sql);
        preparedStatement.setInt(1, idAtividade);
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public static List<Atividades> getAll() throws SQLException {
        String sql = "SELECT * FROM atividades";
        Statement statement = conexao.createStatement();
        ResultSet resultList = statement.executeQuery(sql);
        List<Atividades> atividades = new ArrayList<>();
        while (resultList.next()) {
            int fk = resultList.getInt("fk_curso");
            Professores professores = new Professores();
            if (fk != 0) {
                professores = Professores.getById(fk);
            }
            atividades.add(
                new Atividades(
                    resultList.getInt("id_atividade"),
                    resultList.getString("tipo_atividade"),
                    resultList.getString("descricao_atividade"),
                    resultList.getDate("dt_entrega"),
                    fk,
                    professores)
            );
        }
        return atividades;
    }
}
