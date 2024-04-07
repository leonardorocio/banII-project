package com.banllproject.model;

public class Turmas {
    
    private int idTurma;
    private String anoSemestre;
    private String localAula;
    private Disciplinas fkDisciplina;
    
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
    public Disciplinas getFkDisciplina() {
        return fkDisciplina;
    }
    public void setFkDisciplina(Disciplinas fkDisciplina) {
        this.fkDisciplina = fkDisciplina;
    }

    
}
