package com.banllproject.model;

import java.sql.Date;

public class Alunos {
    
    private int idAluno;
    private String nome;
    private String sobrenome;
    private Date dtNascimento;
    private String cpf;
    private String sexoBiologico;
    private Date dtIngresso;
    private Cursos fkCurso;
    
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
    public Cursos getFkCurso() {
        return fkCurso;
    }
    public void setFkCurso(Cursos fkCurso) {
        this.fkCurso = fkCurso;
    }

}
