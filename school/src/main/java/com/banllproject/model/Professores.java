package com.banllproject.model;

import java.sql.Date;

public class Professores {

    private int idProfessor;
    private String nome;
    private String sobrenome;
    private String sexoBiologico;
    private Date dtNascimento;
    private Departamentos fkDepartamento;

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
    public Departamentos getFkDepartamento() {
        return fkDepartamento;
    }
    public void setFkDepartamento(Departamentos fkDepartamento) {
        this.fkDepartamento = fkDepartamento;
    }

}
