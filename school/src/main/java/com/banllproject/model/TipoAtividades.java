package com.banllproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.Conexao;

public class TipoAtividades {

    private static Connection conexao = Conexao.getInstance().getConnection();
    private int idTipoAtividade;
    private String descricaoTipoAtividade;

    public TipoAtividades(int idTipoAtividade, String descricaoTipoAtividade) {
        this.idTipoAtividade = idTipoAtividade;
        this.descricaoTipoAtividade = descricaoTipoAtividade;
    }
    
    public TipoAtividades(String descricaoTipoAtividade) {
        this.descricaoTipoAtividade = descricaoTipoAtividade;
    }

    public int getIdTipoAtividade() {
        return idTipoAtividade;
    }

    public void setIdTipoAtividade(int idTipoAtividade) {
        this.idTipoAtividade = idTipoAtividade;
    }

    public String getDescricaoTipoAtividade() {
        return descricaoTipoAtividade;
    }

    public void setDescricaoTipoAtividade(String descricaoTipoAtividade) {
        this.descricaoTipoAtividade = descricaoTipoAtividade;
    }

    public void imprimeTipoAtividade() {
        System.out.println(
                String.format("ID: %d\nDescrição: %s", this.getIdTipoAtividade(), this.getDescricaoTipoAtividade()));
    }

    public static TipoAtividades getById(int idTipoAtividade) throws SQLException {
        String sql = "SELECT * FROM tipo_atividade WHERE id_tipo_atividade = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idTipoAtividade);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            return new TipoAtividades(
                    resultSet.getInt("id_tipo_atividade"),
                    resultSet.getString("descricao"));
        } else {
            System.out.println("Tipo de atividade não encontrado com esse ID");
            return null;
        }
    }

    public static List<TipoAtividades> getAll() throws SQLException {
        String sql = "SELECT * FROM tipo_atividade";
        Statement statement = conexao.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<TipoAtividades> tipoAtividades = new ArrayList<>();
        while (resultSet.next()) {
            tipoAtividades.add(new TipoAtividades(
                    resultSet.getInt("id_tipo_atividade"),
                    resultSet.getString("descricao")));
        }
        return tipoAtividades;
    }

    public static void create(TipoAtividades tipoAtividades) throws SQLException {
        String sql = "INSERT INTO tipo_atividade (descricao) VALUES (?)";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setString(1, tipoAtividades.getDescricaoTipoAtividade());
        statement.execute();
        statement.close();
    }

    public static void update(TipoAtividades tipoAtividades) throws SQLException {
        String sql = "UPDATE tipo_atividade SET descricao = ? WHERE id_tipo_atividade = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setString(1, tipoAtividades.getDescricaoTipoAtividade());
        statement.setInt(2, tipoAtividades.getIdTipoAtividade());
        statement.executeUpdate();
        statement.close();
    }

    public static void delete(int idTipoAtividade) throws SQLException {
        String sql = "DELETE FROM tipo_atividade WHERE id_tipo_atividade = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idTipoAtividade);
        statement.executeQuery();
        statement.close();
    }
}