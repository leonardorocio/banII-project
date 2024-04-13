package com.banllproject.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.banllproject.model.Alunos;
import com.banllproject.view.Menu;

public class AlunosController extends Controller {

    @Override
    public void getById() throws SQLException {
        int idAluno = Menu.buscaOpcaoInteira("Digite o id do aluno: ");
        Alunos.getById(idAluno).imprimeAluno();
    }

    @Override
    public void getAll() throws SQLException {
        Alunos.getAll().forEach(Alunos::imprimeAluno);
    }

    @Override
    public void create() throws SQLException {
        Alunos novoAluno = new Alunos(
                Menu.buscaDadoString("Digite o nome do novo aluno: "),
                Menu.buscaDadoString("Digite o sobrenome do novo aluno: "),
                convertStringToSQLDate(Menu.buscaDadoString("Digite a data de nascimento do novo aluno: ")),
                Menu.buscaDadoString("Digite o sexo biológico do novo aluno: "),
                Menu.buscaDadoString("Digite o cpf do novo aluno: "),
                convertStringToSQLDate(Menu.buscaDadoString("Digite a data de ingresso do novo aluno: ")),
                Menu.buscaOpcaoInteira("Digite o id do curso do aluno: "));
        Alunos.create(novoAluno);
        System.out.println("Aluno criado com sucesso!");
    }

    @Override
    public void update() throws SQLException {
        int idAluno = Menu.buscaOpcaoInteira("Digite o id do aluno: ");
        Alunos alunoAtualizado = new Alunos(
                idAluno,
                Menu.buscaDadoString("Digite o nome do aluno (Digite . para manter o atual): "),
                Menu.buscaDadoString("Digite o sobrenome do aluno (Digite . para manter o atual): "),
                convertStringToSQLDate(Menu.buscaDadoString("Digite a data de nascimento do aluno (Digite . para manter o atual): ")),
                Menu.buscaDadoString("Digite o sexo biológico do aluno (Digite . para manter o atual): "),
                convertStringToSQLDate(Menu.buscaDadoString("Digite a data de ingresso do aluno (Digite . para manter o atual): ")));
        List<String> updatedFieldNames = new ArrayList<>();

        if (alunoAtualizado.getNome().equals(".")) {
            updatedFieldNames.add("nome");
        }
        if (alunoAtualizado.getSobrenome().equals(".")) {
            updatedFieldNames.add("sobrenome");
        }
        if (alunoAtualizado.getSexoBiologico().equals(".")) {
            updatedFieldNames.add("sexo_biologico");
        }
        if (alunoAtualizado.getDtNascimento().toString().equals(".")) {
            updatedFieldNames.add("dt_nascimento");
        }
        if (alunoAtualizado.getDtIngresso().toString().equals(".")) {
            updatedFieldNames.add("dt_ingresso");
        }

        Alunos.update(updatedFieldNames, alunoAtualizado);
        System.out.println("Aluno atualizado com sucesso!");
    }

    @Override
    public void delete() throws SQLException {
        int idAluno = Menu.buscaOpcaoInteira("Digite o id do aluno: ");
        Alunos.delete(idAluno);
        System.out.println("Aluno deletado com sucesso!");
    }

}
