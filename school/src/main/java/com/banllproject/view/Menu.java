package com.banllproject.view;

import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;

import com.banllproject.controller.AlunosController;
import com.banllproject.controller.AtividadesController;
import com.banllproject.controller.Controller;
import com.banllproject.controller.CursosController;
import com.banllproject.controller.DepartamentosController;
import com.banllproject.controller.DisciplinasController;
import com.banllproject.controller.ProfessoresController;
import com.banllproject.controller.TurmasController;

public class Menu {

    private static Scanner scanner = new Scanner(System.in);

    public static int buscaOpcaoInteira() {
        System.out.println("Escolha sua opção: ");
        try {
            int returnValue = Menu.scanner.nextInt();
            Menu.scanner.nextLine();
            return returnValue;
        } catch (InputMismatchException e) {
            System.out.println("Erro! É necessário digitar um número");
            Menu.scanner.nextLine();
            return Menu.buscaOpcaoInteira();
        }
    }

    public static int buscaOpcaoInteira(String msg) {
        System.out.println(msg);
        try {
            int returnValue = Menu.scanner.nextInt();
            Menu.scanner.nextLine();
            return returnValue;
        } catch (InputMismatchException e) {
            System.out.println("Erro! É necessário digitar um número");
            Menu.scanner.nextLine();
            return Menu.buscaOpcaoInteira(msg);
        }
    }

    public static String buscaDadoString() {
        System.out.println("Digite sua opção: ");
        String returnValue = Menu.scanner.next();
        Menu.scanner.nextLine();
        return returnValue;
    }

    public static String buscaDadoString(String msg) {
        System.out.println(msg);
        String returnValue = Menu.scanner.next();
        Menu.scanner.nextLine();
        return returnValue;
    }

    public static void pausaMenu() {
        System.out.print("Aperte Enter para continuar...");
        Menu.scanner.nextLine();
    }

    public static void criaMenu() {
        int option;
        do {
            System.out.println("---------------------------------------------------");
            System.out.println("Bem vindo ao sistema da faculdade!\nO que gostaria de fazer?");
            System.out.println(
                    "1 - Criação, Edição e Remoção de Registros\n2 - Outras consultas\n3 - Geração de Relatórios\n4 - Sair");
            option = Menu.buscaOpcaoInteira();
            switch (option) {
                case 1:
                    Menu.menuCruds();
                    break;
                case 2:
                    Menu.menuOutrasConsultas();
                    break;
                case 3:
                    Menu.menuRelatórios();
                    break;
                case 4:
                    break;
            }
        } while (option != 4);
        System.out.println("Obrigado por usar nosso sistema!");
    }

    public static void closeScanner() {
        Menu.scanner.close();
    }

    public static void menuCruds() {
        int option;
        do {
            System.out.println("Escolha a entidade que deseja gerenciar:");
            System.out.println(
                    "1 - Cursos\n2 - Disciplinas\n3 - Turmas\n4 - Alunos\n5 - Professores\n6 - Atividades Avaliativas\n7 - Departamentos\n8 - Sair");
            option = Menu.buscaOpcaoInteira();
            switch (option) {
                case 1:
                    Menu.menuEntidade(new CursosController(), "Cursos");
                    break;
                case 2:
                    Menu.menuEntidade(new DisciplinasController(), "Disciplinas");
                    break;
                case 3:
                    Menu.menuEntidade(new TurmasController(), "Turmas");
                    break;
                case 4:
                    Menu.menuEntidade(new AlunosController(), "Alunos");
                    break;
                case 5:
                    Menu.menuEntidade(new ProfessoresController(), "Professores");
                    break;
                case 6:
                    Menu.menuEntidade(new AtividadesController(), "Atividades Avaliativas");
                    break;
                case 7:
                    Menu.menuEntidade(new DepartamentosController(), "Departamentos");
                    break;
                case 8:
                    break;
            }
        } while (option != 8);
    }

    public static void menuEntidade(Controller controller, String entidade) {
        int option;
        do {
            System.out.println("Escolha uma das ações na entidade " + entidade + ": ");
            System.out.println(
                    "1 - Criar registro\n2 - Editar registro\n3 - Consultar um registro\n4 - Listar todos os registros\n5 - Apagar um registro\n6 - Sair");
            option = Menu.buscaOpcaoInteira();
            try {
                switch (option) {
                    case 1:
                        controller.create();
                        break;
                    case 2:
                        controller.update();
                        break;
                    case 3:
                        controller.getById();
                        break;
                    case 4:
                        controller.getAll();
                        break;
                    case 5:
                        controller.delete();
                        break;
                    case 6:
                        break;
                }
            } catch (SQLException e) {
                System.out.println("Erro: " + e.getMessage());
            }
        } while (option != 6);
    }

    public static void menuOutrasConsultas() {

        int option;
        do {
            System.out.println("Escolha a consulta que deseja realizar:");
            System.out.println(
                "1 - Cadastrar nota na atividade de um aluno\n2 - Editar a nota na atividade de um aluno\n3 - Consultar a nota da atividade de um aluno"
            );
            option = Menu.buscaOpcaoInteira();
            switch (option) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
            }
        } while (option != 4);
    }

    public static void menuRelatórios() {
        int option;
        do {
            System.out.println("Bem vindo ao sistema da faculdade!\nO que gostaria de fazer?");
            System.out.println(
                    "1 - Mostra relatório 1\n2 - Mostra relatório 2\n3 - Mostra relatório 3\n4 - Sair");
            option = Menu.buscaOpcaoInteira();
            switch (option) {
                case 1:
                    System.out.println("Mostra relatório 1");
                    break;
                case 2:
                    System.out.println("Mostra relatório 2");
                    break;
                case 3:
                    System.out.println("Mostra relatório 3");
                    break;
                case 4:
                    break;
            }
        } while (option != 4);
    }

}
