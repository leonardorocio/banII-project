/* -------------- Consulta de cursos -------------- */
select 
	c.id_curso,
	concat(c.nome, ' - ', c.sigla) as curso
from cursos c
order by 2

/* -------------- Consulta de disciplinas em cada curso -------------- */
select 
	d.id_disciplina,
 	d.nome,
 	d.carga_horaria
from cursos_disciplinas cd
	join disciplinas d on cd.id_disciplina = d.id_disciplina
where id_curso = $1
order by 2
	
/* -------------- Consulta de departamentos -------------- */
select
	d.id_departamento,
	concat(d.departamento, ' - ', d.sigla) as nome
from departamentos d
order by 2

/* -------------- Consulta de professores com ou sem filtro por departamento -------------- */

select
	p.id_professor,
	concat(p.nome , ' ', p.sobrenome) as nome_completo,
	p.cpf
from professores p 
where p.fk_departamento = $1 or $1 = -1
order by 2


/* -------------- Consulta de alunos com ou sem filtro por curso -------------- */

select
	a.id_aluno,
	concat(a.nome, ' ', a.sobrenome) as nome_completo,
	a.cpf
from alunos a
where a.fk_curso = $1
	or $1 = -1
order by 2
	
/* -------------- Distribuição Percentual de gênero dos alunos por turma -------------- */
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
where ta.id_turma = $1


/* -------------- Consulta de turmas filtradas ou não por semestre -------------- */

select 
	t.id_turma,
	t.ano_semestre,
	d.nome
from turmas t
	join disciplinas d on d.id_disciplina = t.fk_disciplina
where t.ano_semestre = $1 or $1 = ''
order by 3




/* -------------- Média de notas das atividades -------------- */

select 
	a.id_atividade,
	a.descricao_atividade,
	ta.descricao,
	a.descricao_atividade,
	avg(aa.nota) media
from atividade_aluno aa
	join atividades a on a.id_atividade = aa.id_atividade
	join tipo_atividade ta on ta.id_tipo_atividade = a.fk_tipo_atividade 
group by 1, 3
order by 1

/* -------------- taxa de reprovacao em um disciplina por semestre -------------- */

select 
	n.id_turma,
	n.ano_semestre,
	n.nome_disciplina,
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
from(
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
			and d.id_disciplina = $1
	group by aa.id_aluno, t.id_turma, d.id_disciplina
	order by 1
) n 
where n.id_disciplina = $1
group by n.id_turma, n.ano_semestre, n.nome_disciplina, n.id_disciplina


/* -------------- consulta de alunos em uma determinada turma com média -------------- */

select
	a.id_aluno,
	concat(a.nome, ' ', a.sobrenome) as nome_completo,
	avg(aa.nota) as nota
from turma_aluno ta
	join alunos a on ta.id_aluno = a.id_aluno
	join atividades at on at.fk_turma = 1
	join atividade_aluno aa on aa.id_atividade = at.id_atividade 
		and aa.id_aluno = a.id_aluno
where ta.id_turma = 1
group by 1
order by 2

/* -------------- consulta de disciplina em curso ou já cursadas por aluno -------------- */
select 
	t.id_turma,
	d.nome,
	d.carga_horaria,
	t.ano_semestre
from turma_aluno ta 
	join turmas t on t.id_turma = ta.id_turma
	join disciplinas d on d.id_disciplina = t.fk_disciplina
where ta.id_aluno = $1


/* -------------- Consulta de disciplinas lecionadas por um professor em determinado semestre -------------- */
select
	t.id_turma,
	d.nome,
	d.carga_horaria,
	t.ano_semestre
from turma_professor tp
	join turmas t on t.id_turma = tp.id_turma and t.ano_semestre = $2
	join disciplinas d on d.id_disciplina = t.fk_disciplina
where tp.id_professor = $1

/* -------------- Consulta de atividades aplicadas por determinado professor -------------- */
select
	a.id_atividade,
	ta.descricao,
	a.descricao_atividade ,
	a.dt_entrega
from atividades a
	join tipo_atividade ta on ta.id_tipo_atividade = a.fk_tipo_atividade 
where a.fk_professor = 2

/* -------------- Consulta de atividades por turma com ou sem filtro por professor  -------------- */
select 
	t.id_turma,
	d.nome,
	t.ano_semestre,
	t.local_aula,
	array_agg(
		jsonb_build_object(
			'Id', a.id_atividade,
			'Tipo de Atividade', ta.descricao,
			'Descrição', a.descricao_atividade,
			'Data de entrega', a.dt_entrega
		) 
	) as atividades
from atividades a
	join turmas t on t.id_turma = a.fk_turma
	join disciplinas d on t.fk_disciplina = d.id_disciplina
	join tipo_atividade ta on ta.id_tipo_atividade = a.fk_tipo_atividade
where a.fk_professor = $1 or $1 = -1
group by t.id_turma, d.nome

/* -------------- Consulta de atividades por aluno -------------- */

select
	a2.id_aluno,
	concat(a2.nome, ' ', a2.sobrenome) as nome_completo,
	array_agg(
		jsonb_build_object(
			'Id', a.id_atividade,
			'Tipo', ta.descricao,
			'Descrição', a.descricao_atividade,
			'Data de entrega', a.dt_entrega,
			'Nota', aa.nota
		) 
	) as atividades
from atividade_aluno aa 
	join atividades a on a.id_atividade = aa.id_atividade
	join turmas t on t.id_turma = a.fk_turma
		and t.fk_disciplina = $2
	join alunos a2 on a2.id_aluno = aa.id_aluno
	join tipo_atividade ta on ta.id_tipo_atividade = a.fk_tipo_atividade
where a2.id_aluno = $1
group by 1