package com.banllproject.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.model.Turmas;
import com.banllproject.view.Menu;

public class TurmasController implements Controller {

    @Override
    public void getById() throws SQLException {
        int idTurma = Menu.buscaOpcaoInteira("Digite o id da turma: ");
        Turmas.getById(idTurma).imprimeTurma();
    }

    @Override
    public void getAll() throws SQLException {
        Turmas.getAll().forEach(Turmas::imprimeTurma);
    }

    @Override
    public void create() throws SQLException {
        Turmas novaTurma = new Turmas(
            Menu.buscaOpcaoInteira("Digite o id da nova turma: "),
            Menu.buscaDadoString("Digite o ano e semestre da turma (AAAA/SS): "),
            Menu.buscaDadoString("Digite o local de aula da turma: "),
            Menu.buscaOpcaoInteira("Digite o id da disciplina dessa turma: "),
            Menu.buscaOpcaoInteira("Digite o id do professor que dá aula nesta turma: ")
        );
        Turmas.create(novaTurma);
        System.out.println("Nova turma criada com sucesso!");
    }

    @Override
    public void update() throws SQLException {
        int idTurma = Menu.buscaOpcaoInteira("Digite o id da turma: ");
        Turmas turmaAtualizada = new Turmas(
            idTurma,
            Menu.buscaDadoString("Digite o novo ano e semestre da turma (AAAA/SS) (Digite . para manter o atual): "),
            Menu.buscaDadoString("Digite o novo local de aula da turma (Digite . para manter o atual): ")
        );

        List<String> updatedFieldNames = new ArrayList<>();
        
        if (turmaAtualizada.getAnoSemestre().equals(".")) {
            updatedFieldNames.add("ano_semestre");
        }
        
        if (turmaAtualizada.getLocalAula().equals(".")) {
            updatedFieldNames.add("local_aula");
        }

        Turmas.update(updatedFieldNames, turmaAtualizada);
        System.out.println("Turma atualizada com sucesso!");
    }

    @Override
    public void delete() throws SQLException {
        int idTurma = Menu.buscaOpcaoInteira("Digite o id da turma: ");
        Turmas.delete(idTurma);
        System.out.println("Turma deletada com sucesso!");
    }
    
}
