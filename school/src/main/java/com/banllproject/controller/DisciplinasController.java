package com.banllproject.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.model.Disciplinas;
import com.banllproject.view.Menu;

public class DisciplinasController extends Controller {

    @Override
    public void getById() throws SQLException {
        int idDisciplina = Menu.buscaOpcaoInteira("Digite o id da disciplina: ");
        Disciplinas.getById(idDisciplina).imprimeDisciplina();
    }

    @Override
    public void getAll() throws SQLException {
        Disciplinas.getAll().forEach(Disciplinas::imprimeDisciplina);
    }

    @Override
    public void create() throws SQLException {
        Disciplinas novaDisciplina = new Disciplinas(
                Menu.buscaDadoString("Digite o nome da disciplina: "),
                Menu.buscaOpcaoInteira("Digite a carga horária da disciplina: "),
                Menu.buscaOpcaoInteira("Digite o curso que será inserida a disciplina: "));
        int tableKey = Disciplinas.create(novaDisciplina);
        System.out.println("Disciplina " + tableKey + " criada com sucesso!");
    }

    @Override
    public void update() throws SQLException {
        int idDisciplina = Menu.buscaOpcaoInteira("Digite o id da disciplina: ");
        Disciplinas disciplinaAtualizada = new Disciplinas(
                idDisciplina,
                Menu.buscaDadoString("Digite o novo nome da disciplina (Digite . para manter o atual): "),
                Menu.buscaOpcaoInteira("Digite a nova carga horaria da disciplina (Digite 0 para manter o atual): "));
        List<String> updatedFieldNames = new ArrayList<>();

        if (!disciplinaAtualizada.getNome().equals(".")) {
            updatedFieldNames.add("nome");
        }

        if (disciplinaAtualizada.getCargaHoraria() != 0) {
            updatedFieldNames.add("carga_horaria");
        }

        Disciplinas.update(updatedFieldNames, disciplinaAtualizada);
        System.out.println("Disciplina atualizada com sucesso!");
    }

    @Override
    public void delete() throws SQLException {
        int idDisciplina = Menu.buscaOpcaoInteira("Digite o id da disciplina: ");
        Disciplinas.delete(idDisciplina);
        System.out.println("Disciplina deletada com sucesso!");
    }

}
