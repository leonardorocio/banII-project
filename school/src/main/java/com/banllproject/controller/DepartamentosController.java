package com.banllproject.controller;

import java.sql.SQLException;

import com.banllproject.model.Departamentos;
import com.banllproject.view.Menu;

public class DepartamentosController implements Controller {

    @Override
    public void getById() throws SQLException {
        int idDepartamento = Menu.buscaOpcaoInteira("Digite o id do departamento: ");
        Departamentos.getById(idDepartamento).imprimeDepartamento();
    }

    @Override
    public void getAll() throws SQLException {
        Departamentos.getAll().forEach(Departamentos::imprimeDepartamento);
    }

    @Override
    public void create() throws SQLException {
        Departamentos novoDepartamento = new Departamentos(
            Menu.buscaDadoString("Digite o nome do departamento: ")
        );
        Departamentos.create(novoDepartamento);
        System.out.println("Departamento criado com sucesso!");
    }

    @Override
    public void update() throws SQLException {
        int idDepartamento = Menu.buscaOpcaoInteira("Digite o id do departamento");
        Departamentos departamentoAtualizado = new Departamentos(
            idDepartamento,
            Menu.buscaDadoString("Digite o novo nome do departamento: ")
        );
        Departamentos.update(departamentoAtualizado);
        System.out.println("Departamento atualizado com sucesso!");
    }

    @Override
    public void delete() throws SQLException {
        int idDepartamento = Menu.buscaOpcaoInteira("Digite o id do departamento");
        Departamentos.delete(idDepartamento);
        System.out.println("Departamento deletado com sucesso!");
    }
    
}
