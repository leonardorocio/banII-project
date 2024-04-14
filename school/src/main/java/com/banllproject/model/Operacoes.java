package com.banllproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.banllproject.Conexao;
import com.banllproject.view.Menu;

public class Operacoes {

    private static Connection conexao = Conexao.getInstance().getConnection();

    public static void buscaDisciplinaPorCurso(int idCurso) throws SQLException {
        String sql = "select d.id_disciplina, d.nome, d.carga_horaria from cursos_disciplinas cd " +
                "join disciplinas d on cd.id_disciplina = d.id_disciplina " +
                "where id_curso = ? or ? = -1 order by 2;";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idCurso);
        statement.setInt(2, idCurso);
        ResultSet result = statement.executeQuery();
        Disciplinas disciplinas = new Disciplinas();
        while (result.next()) {
            if (result.isFirst()) {
                Cursos.getById(idCurso).imprimeCurso();
            }
            disciplinas = new Disciplinas(
                    result.getInt("id_disciplina"),
                    result.getString("nome"),
                    result.getInt("carga_horaria"));
            disciplinas.imprimeDisciplina();
        }
    }

    public static void buscaProfessoresPorDepartamento(int idDepartamento) throws SQLException {
        String sql = "select p.id_professor, p.nome, p.sobrenome, p.cpf, p.sexo_biologico, p.dt_nascimento, p.fk_departamento from professores p "
                +
                "where p.fk_departamento = ? or ? = -1 order by 2";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idDepartamento);
        statement.setInt(2, idDepartamento);
        ResultSet resultList = statement.executeQuery();
        Professores professores = new Professores();
        while (resultList.next()) {
            int fk = resultList.getInt("fk_departamento");
            Departamentos departamentos = new Departamentos();
            if (fk != 0) {
                departamentos = Departamentos.getById(fk);
            }
            professores = new Professores(
                    resultList.getInt("id_professor"),
                    resultList.getString("nome"),
                    resultList.getString("sobrenome"),
                    resultList.getString("sexo_biologico"),
                    resultList.getString("cpf"),
                    resultList.getDate("dt_nascimento"),
                    fk,
                    departamentos);
            professores.imprimeProfessor();
        }
    }

    public static void buscaAlunosPorCurso(int idCurso) throws SQLException {
        String sql = "select a.id_aluno, a.nome, a.sobrenome, a.cpf, a.fk_curso, a.dt_nascimento, a.dt_ingresso, a.sexo_biologico from alunos a "
                +
                "where a.fk_curso = ? or ? = -1 order by 2";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idCurso);
        statement.setInt(2, idCurso);
        ResultSet result = statement.executeQuery();
        Alunos aluno = new Alunos();
        while (result.next()) {
            int fk = result.getInt("fk_curso");
            Cursos cursos = new Cursos();
            if (fk != 0) {
                cursos = Cursos.getById(fk);
            }
            aluno = new Alunos(
                    result.getInt("id_aluno"),
                    result.getString("nome"),
                    result.getString("sobrenome"),
                    result.getDate("dt_nascimento"),
                    result.getString("cpf"),
                    result.getString("sexo_biologico"),
                    result.getDate("dt_ingresso"),
                    fk,
                    cursos);
            aluno.imprimeAluno();
        }
    }

    public static void buscaTurmasPorSemestre(String anoSemestre) throws SQLException {
        String sql = "select t.id_turma, t.ano_semestre, t.local_aula, t.fk_disciplina, d.nome from turmas t " +
                "join disciplinas d on d.id_disciplina = t.fk_disciplina " +
                "where t.ano_semestre = ? or ? = '' order by 3";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setString(1, anoSemestre);
        statement.setString(2, anoSemestre);
        ResultSet resultSet = statement.executeQuery();
        Turmas turma = new Turmas();
        while (resultSet.next()) {
            int fk = resultSet.getInt("fk_disciplina");
            Disciplinas disciplinas = new Disciplinas();
            if (fk != 0) {
                disciplinas = Disciplinas.getById(fk);
            }
            turma = new Turmas(
                    resultSet.getInt("id_turma"),
                    resultSet.getString("ano_semestre"),
                    resultSet.getString("local_aula"),
                    fk,
                    disciplinas);
            turma.imprimeTurma();
        }
    }

    private static void mostraTaxaDeReprovacao(int idTurma, String anoSemestre, int idDisciplina, String disciplina,
            double aprovacao, double reprovacao) {
        System.out.println(
                String.format("""

                        ID da turma: %d
                        Ano e semestre: %s
                        ID da disciplina: %d
                        Disciplina: %s
                        Taxa de Aprovação: %.2f%%
                        Taxa de Reprovação: %.2f%%
                        """, idTurma, anoSemestre, idDisciplina, disciplina, aprovacao, reprovacao));
    }

    public static void buscaTaxaDeReprovacaoDeDisciplinaPorSemestre(int idDisciplina) throws SQLException {
        String sql = """
                    select
                    n.id_turma,
                    n.ano_semestre,
                    n.nome_disciplina as nome_disciplina,
                    n.id_disciplina,
                    (count(
                        case
                            when n.media >= 7 then 1
                        end
                    )/count(*)::decimal) * 100 as aprovados,
                    (count(
                        case
                            when n.media <= 7 then 1
                        end
                    )/ count(*)::decimal) * 100 as reprovados
                from (
                    select
                        aa.id_aluno,
                        t.id_turma,
                        d.id_disciplina,
                        d.nome as nome_disciplina,
                        t.ano_semestre,
                        avg(aa.nota) as media
                    from atividade_aluno aa
                        join atividades a on a.id_atividade = aa.id_atividade
                        join turmas t on t.id_turma = a.fk_turma
                        join disciplinas d on d.id_disciplina = t.fk_disciplina
                        and d.id_disciplina = ?
                    group by aa.id_aluno, t.id_turma, d.id_disciplina
                    order by 1
                ) n
                where n.id_disciplina = ?
                group by n.id_turma, n.ano_semestre, n.nome_disciplina, n.id_disciplina
                        """;
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idDisciplina);
        statement.setInt(2, idDisciplina);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            if (resultSet.isFirst()) {
                Disciplinas.getById(idDisciplina).imprimeDisciplina();
            }
            Operacoes.mostraTaxaDeReprovacao(
                    resultSet.getInt("id_turma"),
                    resultSet.getString("ano_semestre"),
                    resultSet.getInt("id_disciplina"),
                    resultSet.getString("nome_disciplina"),
                    resultSet.getDouble("aprovados"),
                    resultSet.getDouble("reprovados"));
        }
    }

    private static void mostraAlunoComMedia(int idAluno, String nomeCompleto, double media) {
        System.out.println(
                String.format("""
                        ID do aluno: %d
                        Nome completo: %s
                        Média: %.2f
                        """, idAluno, nomeCompleto, media));
    }

    public static void buscaAlunoPorTurma(int idTurma) throws SQLException {
        String sql = """
                    select
                    a.id_aluno,
                    a.nome, a.sobrenome,
                    avg(aa.nota) as nota
                from turma_aluno ta
                    join alunos a on ta.id_aluno = a.id_aluno
                    join atividades at on at.fk_turma = 1
                    join atividade_aluno aa on aa.id_atividade = at.id_atividade
                        and aa.id_aluno = a.id_aluno
                where ta.id_turma = ?
                group by 1
                order by 2
                        """;
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idTurma);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            if (resultSet.isFirst()) {
                Turmas.getById(idTurma).imprimeTurma();
            }
            mostraAlunoComMedia(
                    resultSet.getInt("id_aluno"),
                    resultSet.getString("nome") + " " + resultSet.getString("sobrenome"),
                    resultSet.getDouble("nota"));
            Menu.pausaMenu();
        }
    }

    public static void buscaPercentualGeneroAlunosPorTurma(int idTurma) throws SQLException {
        String sql = """
                    select
                    case
                        when count(*) = 0 then null
                        else (count(
                        case
                            when a.sexo_biologico = 'M' then 1
                        end
                    ) / count(*)::decimal) * 100
                    end as percentual_meninos,
                    case
                        when count(*) = 0 then null
                        else (count(
                        case
                            when a.sexo_biologico = 'F' then 1
                        end
                    ) / count(*)::decimal) * 100
                    end as percentual_meninas
                from turma_aluno ta
                    join alunos a on a.id_aluno = ta.id_aluno
                where ta.id_turma = ?
                        """;
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idTurma);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            Turmas.getById(idTurma).imprimeTurma();
            System.out.println(
                    String.format(
                            "Meninos: %.2f%%\nMeninas: %.2f%%",
                            resultSet.getDouble("percentual_meninos"), resultSet.getDouble("percentual_meninos")));
        } else {
            System.out.println("Não foi possível buscar os dados para a turma informada!");
        }
    }

    private static void mostraDisciplinaParticipada(int idTurma, String nome, int cargaHoraria, String anoSemestre) {
        System.out.println(
                String.format(
                        """
                                ID da turma: %d
                                Disciplina: %s
                                Carga horária: %d
                                Ano e semestre: %s
                                """, idTurma, nome, cargaHoraria, anoSemestre));
    }

    public static void buscaDisciplinasCursadasPorAluno(int idAluno) throws SQLException {
        String sql = """
                    select
                    t.id_turma,
                    d.nome,
                    d.carga_horaria,
                    t.ano_semestre
                from turma_aluno ta
                    join turmas t on t.id_turma = ta.id_turma
                    join disciplinas d on d.id_disciplina = t.fk_disciplina
                where ta.id_aluno = ?
                        """;
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setInt(1, idAluno);
        ResultSet resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            if (resultSet.isFirst()) {
                Alunos.getById(idAluno).imprimeAluno();
            }
            mostraDisciplinaParticipada(
                    resultSet.getInt("id_turma"),
                    resultSet.getString("nome"),
                    resultSet.getInt("carga_horaria"),
                    resultSet.getString("ano_semestre"));
        }
    }

    public static void buscaDisciplinasLecionadasPorProfessorNoSemestre(int idProfessor, String anoSemestre) throws SQLException {
        String sql = """
                    select
                    t.id_turma,
                    d.nome,
                    d.carga_horaria,
                    t.ano_semestre
                from turma_professor tp
                    join turmas t on t.id_turma = tp.id_turma and t.ano_semestre = ?
                    join disciplinas d on d.id_disciplina = t.fk_disciplina
                where tp.id_professor = ?
                        """;
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setString(1, anoSemestre);
        statement.setInt(2, idProfessor);
        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()) {
            if (resultSet.isFirst()) {
                Professores.getById(idProfessor).imprimeProfessor();
            }
            mostraDisciplinaParticipada(
                    resultSet.getInt("id_turma"),
                    resultSet.getString("nome"),
                    resultSet.getInt("carga_horaria"),
                    resultSet.getString("ano_semestre"));
        }
    }

    public static void buscaAtividadesAplicadasPorProfessor(int idProfessor) throws SQLException {
        // TODO: refazer consulta devido a criação de tabela tipo_atividade
    }

    public static void buscaAtividadePorTurmaEProfessor(int idTurma, int idProfessor) {
    }

    public static void buscaAtividadePorAlunoPorDisciplina(int idAluno, int idDisciplina) {
    }

    public static void buscaMediaDeNotasDaAtividade(int idAtividade) {
        // TODO: Alterar a consulta para sair a média de uma atividade apenas 
    }

}
