package com.banllproject.controller;

import java.sql.SQLException;

import com.banllproject.model.Cursos;
import com.banllproject.view.Menu;

public class CursosController implements Controller {
    
    public void getById() throws SQLException {
        int idCurso = Menu.buscaOpcaoInteira("Digite o id do curso:");
        Cursos.getById(idCurso).imprimeCurso();
    }

    public void getAll() throws SQLException {
        Cursos.getAll().forEach(Cursos::imprimeCurso);
    } 

    public void create() throws SQLException {
        Cursos novoCurso = new Cursos(
            Menu.buscaDadoString("Digite o nome do curso: ")
        );
        Cursos.create(novoCurso);
        System.out.println("Curso criado com sucesso!");
    }
    
    public void update() throws SQLException {
        int idCurso = Menu.buscaOpcaoInteira("Digite o id do curso: ");
        Cursos cursoAtualizado = new Cursos(
            idCurso,
            Menu.buscaDadoString("Digite o nome do curso: ")
        );
        Cursos.update(cursoAtualizado);
        System.out.println("Curso atualizado com sucesso!");
    }

    public void delete() throws SQLException {
        int idCurso = Menu.buscaOpcaoInteira("Digite o id do curso:");
        Cursos.delete(idCurso);
        System.out.println("Curso deletado com sucesso!");
    }
}
