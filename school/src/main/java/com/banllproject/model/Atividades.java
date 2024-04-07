package com.banllproject.model;

import java.sql.Date;

public class Atividades {
    
    private int idAtividade;
    private String tipoAtividade;
    private String descricaoAtividade;
    private Date dtEntrega;
    private Professores fkProfessores;
    
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
    public Professores getFkProfessores() {
        return fkProfessores;
    }
    public void setFkProfessores(Professores fkProfessores) {
        this.fkProfessores = fkProfessores;
    }
}
