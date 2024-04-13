package com.banllproject.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.model.Professores;
import com.banllproject.view.Menu;

public class ProfessoresController implements Controller {

    @Override
    public void getById() throws SQLException {
        int idProfessor = Menu.buscaOpcaoInteira("Digite o id do professor: ");
        Professores.getById(idProfessor);
    }

    @Override
    public void getAll() throws SQLException {
        Professores.getAll().forEach(Professores::imprimeProfessor);
    }

    private Date convertStringToSQLDate(String date) {
        
        try {
            java.util.Date dateFormat = DateFormat.getDateInstance().parse(date);
            long toMilliseconds = dateFormat.getTime();
            return new java.sql.Date(toMilliseconds);
        } catch (ParseException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public void create() throws SQLException {
        Professores novoProfessor = new Professores(
            Menu.buscaOpcaoInteira("Digite o id do novo professor: "),
            Menu.buscaDadoString("Digite o nome do novo professor: "),
            Menu.buscaDadoString("Digite o sobrenome do novo professor: "),
            Menu.buscaDadoString("Digite o sexo biológico do novo professor: "),
            Menu.buscaDadoString("Digite o CPF do novo professor: "),
            convertStringToSQLDate(Menu.buscaDadoString("Digite a data de nascimento do novo professor (dd/MM/aaaa): ")),
            Menu.buscaOpcaoInteira("Digite o departamento desse professor: ")
        );
        Professores.create(novoProfessor);
        System.out.println("Professor criado com sucesso!");
    }

    @Override
    public void update() throws SQLException {
        int idProfessor = Menu.buscaOpcaoInteira("Digite o id do professor: ");
        Professores professorAtualizado = new Professores(
            idProfessor,
            Menu.buscaDadoString("Digite o nome do novo professor (Digite . para manter o atual): "),
            Menu.buscaDadoString("Digite o sobrenome do novo professor (Digite . para manter o atual): "),
            Menu.buscaDadoString("Digite o sexo biológico do novo professor (Digite . para manter o atual): "),
            convertStringToSQLDate(Menu.buscaDadoString("Digite a data de nascimento do novo professor (dd/MM/aaaa) (Digite . para manter o atual): "))
        );
        List<String> updatedFieldNames = new ArrayList<>();
        
        if (professorAtualizado.getNome().equals(".")) {
            updatedFieldNames.add("nome");
        }
        if (professorAtualizado.getSobrenome().equals(".")) {
            updatedFieldNames.add("sobrenome");
        }
        if (professorAtualizado.getSexoBiologico().equals(".")) {
            updatedFieldNames.add("sexo_biologico");
        }
        if (professorAtualizado.getDtNascimento().toString().equals(".")) {
            updatedFieldNames.add("dt_nascimento");
        }

        Professores.update(updatedFieldNames, professorAtualizado);
        System.out.println("Professor atualizado com sucesso!");
    }

    @Override
    public void delete() throws SQLException {
        int idProfessor = Menu.buscaOpcaoInteira("Digite o id do professor: ");
        Professores.delete(idProfessor);
        System.out.println("Professor deletado com sucesso!");
    }
    
}
