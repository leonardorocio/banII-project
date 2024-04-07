package com.banllproject.view;

import java.util.Scanner;

public class Menu {

    private static Scanner scanner = new Scanner(System.in);

    public static int buscaOpcaoInteira() {
        System.out.println("Escolha sua opção: ");
        return Menu.scanner.nextInt();
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
                    System.out.println("Mostra crud cursos");
                    break;
                case 2:
                    System.out.println("Mostra crud disciplinas");
                    break;
                case 3:
                    System.out.println("Mostra crud turmas");
                    break;
                case 4:
                    System.out.println("Mostra crud alunos");
                    break;
                case 5:
                    System.out.println("Mostra crud professores");
                    break;
                case 6:
                    System.out.println("Mostra crud atividades avaliativas");
                    break;
                case 7:
                    System.out.println("Mostra crud departamentos");
                    break;
                case 8:
                    break;
            }
        } while (option != 8);
    }

    public static void menuOutrasConsultas() {
        
        int option;
        do {
            System.out.println("Escolha a consulta que deseja realizar:");
            System.out.println(
                    "1 -outra consulta 1\n2 -  outra consulta 2\n3 - Turmas\n4 - Alunos\n5- Professores\n6 - Atividades Avaliativas\n7 - Departamentos\n8 - Sair");
            option = Menu.buscaOpcaoInteira();
            switch (option) {
                case 1:
                    System.out.println("Mostra outra consulta 1");
                    break;
                case 2:
                    System.out.println("Mostra outra consulta 2");
                    break;
                case 3:
                    System.out.println("Mostra outra consulta 3");
                    break;
                case 4:
                    System.out.println("Mostra outra consulta 4");
                    break;
                case 5:
                    System.out.println("Mostra outra consulta 5");
                    break;
                case 6:
                    System.out.println("Mostra outra consulta 6");
                    break;
                case 7:
                    System.out.println("Mostra outra consulta 7");
                    break;
                case 8:
                    break;
            }
        } while (option != 8);
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
