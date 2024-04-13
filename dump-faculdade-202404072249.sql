--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-07 22:49:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4947 (class 1262 OID 16530)
-- Name: faculdade; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE faculdade WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE faculdade OWNER TO postgres;

\connect faculdade

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16579)
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id_aluno integer NOT NULL,
    nome character varying(50),
    sobrenome character varying(100),
    dt_nascimento date,
    cpf character varying(14),
    sexo_biologico character varying(1),
    dt_ingresso date,
    fk_curso integer
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16578)
-- Name: alunos_id_aluno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alunos_id_aluno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_aluno_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 225
-- Name: alunos_id_aluno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_aluno_seq OWNED BY public.alunos.id_aluno;


--
-- TOC entry 232 (class 1259 OID 16666)
-- Name: atividade_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atividade_aluno (
    id_atividade integer NOT NULL,
    id_aluno integer NOT NULL,
    nota numeric
);


ALTER TABLE public.atividade_aluno OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16593)
-- Name: atividades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atividades (
    id_atividade integer NOT NULL,
    tipo_atividade character varying(50),
    descricao_atividade character varying(255),
    dt_entrega date,
    fk_professor integer NOT NULL,
    fk_turma integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.atividades OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16592)
-- Name: atividades_id_atividade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.atividades_id_atividade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.atividades_id_atividade_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 227
-- Name: atividades_id_atividade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.atividades_id_atividade_seq OWNED BY public.atividades.id_atividade;


--
-- TOC entry 216 (class 1259 OID 16532)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    id_curso integer NOT NULL,
    nome character varying(100),
    duracao_minima integer,
    duracao_maxima integer,
    sigla character varying(10)
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16604)
-- Name: cursos_disciplinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos_disciplinas (
    id_curso integer NOT NULL,
    id_disciplina integer NOT NULL
);


ALTER TABLE public.cursos_disciplinas OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16531)
-- Name: cursos_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_curso_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 215
-- Name: cursos_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_curso_seq OWNED BY public.cursos.id_curso;


--
-- TOC entry 222 (class 1259 OID 16558)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id_departamento integer NOT NULL,
    departamento character varying(100),
    sigla character varying(10)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16557)
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_id_departamento_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 221
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_id_departamento_seq OWNED BY public.departamentos.id_departamento;


--
-- TOC entry 218 (class 1259 OID 16539)
-- Name: disciplinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplinas (
    id_disciplina integer NOT NULL,
    nome character varying(100),
    carga_horaria integer
);


ALTER TABLE public.disciplinas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16538)
-- Name: disciplinas_id_disciplina_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplinas_id_disciplina_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.disciplinas_id_disciplina_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 217
-- Name: disciplinas_id_disciplina_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplinas_id_disciplina_seq OWNED BY public.disciplinas.id_disciplina;


--
-- TOC entry 224 (class 1259 OID 16565)
-- Name: professores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professores (
    id_professor integer NOT NULL,
    nome character varying(50),
    sobrenome character varying(100),
    dt_nascimento date,
    cpf character varying(14),
    sexo_biologico character varying(1),
    fk_departamento integer
);


ALTER TABLE public.professores OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16564)
-- Name: professores_id_professor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professores_id_professor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professores_id_professor_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 223
-- Name: professores_id_professor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professores_id_professor_seq OWNED BY public.professores.id_professor;


--
-- TOC entry 230 (class 1259 OID 16619)
-- Name: turma_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turma_aluno (
    id_turma integer NOT NULL,
    id_aluno integer NOT NULL
);


ALTER TABLE public.turma_aluno OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16634)
-- Name: turma_professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turma_professor (
    id_turma integer NOT NULL,
    id_professor integer NOT NULL
);


ALTER TABLE public.turma_professor OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16546)
-- Name: turmas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turmas (
    id_turma integer NOT NULL,
    ano_semestre character varying(6),
    local_aula character varying(100),
    fk_disciplina integer
);


ALTER TABLE public.turmas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16545)
-- Name: turmas_id_turma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.turmas_id_turma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turmas_id_turma_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 219
-- Name: turmas_id_turma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.turmas_id_turma_seq OWNED BY public.turmas.id_turma;


--
-- TOC entry 4739 (class 2604 OID 16582)
-- Name: alunos id_aluno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id_aluno SET DEFAULT nextval('public.alunos_id_aluno_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16596)
-- Name: atividades id_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades ALTER COLUMN id_atividade SET DEFAULT nextval('public.atividades_id_atividade_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16535)
-- Name: cursos id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id_curso SET DEFAULT nextval('public.cursos_id_curso_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16561)
-- Name: departamentos id_departamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamentos_id_departamento_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16542)
-- Name: disciplinas id_disciplina; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas ALTER COLUMN id_disciplina SET DEFAULT nextval('public.disciplinas_id_disciplina_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 16568)
-- Name: professores id_professor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores ALTER COLUMN id_professor SET DEFAULT nextval('public.professores_id_professor_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 16549)
-- Name: turmas id_turma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas ALTER COLUMN id_turma SET DEFAULT nextval('public.turmas_id_turma_seq'::regclass);


--
-- TOC entry 4935 (class 0 OID 16579)
-- Dependencies: 226
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alunos VALUES (3, 'Lucas', 'Silva', '2003-05-10', '11111111111', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (4, 'Ana', 'Santos', '2002-08-15', '22222222222', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (5, 'Pedro', 'Oliveira', '2002-04-20', '33333333333', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (6, 'Mariana', 'Rodrigues', '2003-02-28', '44444444444', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (7, 'Rafael', 'Almeida', '2002-07-05', '55555555555', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (8, 'Julia', 'Costa', '2003-01-15', '66666666666', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (9, 'Gustavo', 'Gomes', '2002-06-20', '77777777777', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (10, 'Carolina', 'Pereira', '2003-03-25', '88888888888', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (11, 'Mateus', 'Martins', '2002-10-31', '99999999999', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (12, 'Isabela', 'Ferreira', '2003-04-15', '10101010101', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (13, 'Gabriel', 'Lima', '2002-09-22', '11111111112', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (14, 'Leticia', 'Cunha', '2003-05-01', '12121212121', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (15, 'Nathan', 'Rocha', '2002-11-10', '13131313131', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (16, 'Ana', 'Mendes', '2003-06-20', '14141414141', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (17, 'Pedro', 'Pinto', '2002-12-30', '15151515151', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (18, 'Luana', 'Sousa', '2003-05-12', '02277885024', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (19, 'Guilherme', 'Fernandes', '2002-08-18', '28898792077', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (20, 'Carolina', 'Cavalcanti', '2002-04-22', '67721145302', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (21, 'Leonardo', 'Melo', '2003-03-01', '72052961770', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (22, 'Larissa', 'Lima', '2002-07-07', '78328511338', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (23, 'Rodrigo', 'Rocha', '2003-01-17', '42719121083', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (24, 'Natália', 'Gonçalves', '2002-06-21', '69093328009', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (25, 'Vinícius', 'Alves', '2003-04-01', '03233643044', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (26, 'Amanda', 'Nunes', '2002-10-30', '20295601091', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (27, 'Matheus', 'Barbosa', '2003-05-15', '44085015044', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (28, 'Laura', 'Correia', '2002-09-20', '64376143073', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (29, 'José', 'Campos', '2003-05-01', '27391827009', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (30, 'Bianca', 'Santana', '2002-11-10', '58488225055', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (31, 'Diego', 'Cruz', '2003-06-20', '30114988003', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (33, 'Gabriela', 'Pereira', '2003-07-05', '14573646000', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (34, 'Rafael', 'Cardoso', '2002-11-22', '86779146042', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (35, 'Mariana', 'Gomes', '2003-08-01', '90418756055', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (36, 'Bruno', 'Moraes', '2002-12-10', '09273488045', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (37, 'Juliana', 'Barros', '2003-09-15', '56582017008', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (38, 'Fernando', 'Ferreira', '2003-01-25', '48849830093', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (39, 'Camila', 'Costa', '2002-07-01', '95706403006', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (40, 'Marcos', 'Sousa', '2003-02-12', '03328068082', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (41, 'Letícia', 'Silva', '2002-08-22', '71320908005', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (42, 'Thiago', 'Gonçalves', '2003-03-03', '18542138069', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (43, 'Ana', 'Melo', '2002-09-05', '36622053050', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (44, 'Gustavo', 'Carvalho', '2003-04-20', '69386113020', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (45, 'Luiza', 'Almeida', '2002-10-10', '04687642095', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (46, 'Cristian', 'Oliveira', '2003-05-01', '95487893095', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (47, 'Bárbara', 'Nascimento', '2002-11-15', '54702827083', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (48, 'Eduardo', 'Barbosa', '2003-06-30', '21747958077', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (49, 'Alice', 'Silveira', '2003-01-05', '35092440049', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (50, 'Marcia', 'Pinto', '2002-07-20', '81916188060', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (51, 'Lucas', 'Fernandes', '2003-02-25', '00385681033', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (52, 'Beatriz', 'Rodrigues', '2002-08-12', '51052887005', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (53, 'Ricardo', 'Santos', '2003-03-18', '88973802071', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (54, 'Vanessa', 'Lima', '2002-09-20', '18963508080', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (55, 'Felipe', 'Oliveira', '2003-04-05', '46394624066', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (56, 'Laura', 'Silva', '2002-10-01', '74293829040', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (57, 'Thiago', 'Sousa', '2003-05-22', '01759209096', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (58, 'Caroline', 'Ferreira', '2002-11-12', '27496586009', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (59, 'Guilherme', 'Melo', '2003-06-25', '73950331066', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (60, 'Mariana', 'Gomes', '2003-01-10', '45783248080', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (61, 'Renato', 'Barros', '2002-07-15', '92086422085', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (62, 'Juliana', 'Santos', '2003-02-28', '10432701006', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (32, 'Tatiane', 'Oliveira', '2002-12-30', '82598901001', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (71, 'Maria', 'Silva', '2003-07-12', '88022885024', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (72, 'Ricardo', 'Fernandes', '2003-08-18', '15898792077', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (73, 'Isabela', 'Cavalcanti', '2003-04-22', '67721148302', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (74, 'Lucas', 'Melo', '2003-03-01', '72052962770', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (75, 'Mariana', 'Lima', '2003-07-07', '78328512338', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (76, 'Matheus', 'Rocha', '2003-01-17', '42719121383', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (77, 'Camila', 'Gonçalves', '2003-06-21', '69093328309', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (78, 'Thiago', 'Alves', '2003-04-01', '03233643404', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (79, 'Amanda', 'Nunes', '2003-10-30', '20295601391', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (80, 'Bruno', 'Barbosa', '2003-05-15', '44085015404', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (81, 'Laura', 'Correia', '2003-09-20', '64376143473', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (82, 'José', 'Campos', '2003-05-01', '27391827409', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (83, 'Bianca', 'Santana', '2003-11-10', '58488225305', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (84, 'Diego', 'Cruz', '2003-06-20', '30114988303', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (85, 'Tatiane', 'Oliveira', '2003-12-30', '82598901301', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (86, 'Gabriela', 'Pereira', '2004-07-05', '14573646300', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (87, 'Rafael', 'Cardoso', '2003-11-22', '86779146342', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (88, 'Mariana', 'Gomes', '2004-08-01', '90418756305', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (89, 'Bruno', 'Moraes', '2003-12-10', '09273488345', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (90, 'Juliana', 'Barros', '2004-09-15', '56582017308', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (91, 'Fernando', 'Ferreira', '2004-01-25', '48849830393', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (92, 'Camila', 'Costa', '2003-07-01', '95706403308', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (93, 'Marcos', 'Sousa', '2004-02-12', '03328068382', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (94, 'Letícia', 'Silva', '2003-08-22', '71320908305', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (95, 'Thiago', 'Gonçalves', '2004-03-03', '18542138309', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (96, 'Ana', 'Melo', '2003-09-05', '36622053350', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (97, 'Gustavo', 'Carvalho', '2004-04-20', '69386113300', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (98, 'Luiza', 'Almeida', '2003-10-10', '04687642345', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (99, 'Cristian', 'Oliveira', '2004-05-01', '95487893300', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (100, 'Bárbara', 'Nascimento', '2004-01-12', '54702827305', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (101, 'Eduardo', 'Barbosa', '2003-06-30', '21747958377', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (102, 'Alice', 'Silveira', '2003-01-05', '35092440349', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (103, 'Marcia', 'Pinto', '2002-07-20', '81916188360', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (104, 'Lucas', 'Fernandes', '2003-02-25', '00385681333', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (105, 'Beatriz', 'Rodrigues', '2002-08-12', '51052887305', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (106, 'Ricardo', 'Santos', '2003-03-18', '88973802371', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (107, 'Vanessa', 'Lima', '2002-09-20', '18963508380', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (108, 'Felipe', 'Oliveira', '2003-04-05', '46394624366', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (109, 'Laura', 'Silva', '2002-10-01', '74293829340', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (110, 'Thiago', 'Sousa', '2003-05-22', '01759209396', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (111, 'Caroline', 'Ferreira', '2002-11-12', '27496586309', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (112, 'Guilherme', 'Melo', '2003-06-25', '73950331366', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (113, 'Mariana', 'Gomes', '2003-01-10', '45783248380', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (114, 'Renato', 'Barros', '2002-07-15', '92086422385', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (115, 'Juliana', 'Santos', '2003-02-28', '10432701306', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (116, 'Lucas', 'Oliveira', '2002-08-10', '87632989382', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (117, 'Isabella', 'Silva', '2003-03-05', '40378978347', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (118, 'Thiago', 'Pereira', '2002-09-20', '12768207392', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (119, 'Julia', 'Santos', '2003-04-15', '68507236306', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (120, 'Gabriel', 'Ferreira', '2002-10-30', '23092730393', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (121, 'Carolina', 'Gonçalves', '2003-05-01', '95024603306', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (122, 'Rafael', 'Moraes', '2002-11-10', '70062017308', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (123, 'Mariana', 'Barbosa', '2003-06-20', '08839830393', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (128, 'Carlos', 'Silva', '2003-05-12', '05277885024', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (130, 'Patricia', 'Fernandes', '2002-08-18', '28898792071', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (131, 'Raul', 'Cavalcanti', '2002-04-22', '62721145302', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (132, 'Luciana', 'Melo', '2003-02-28', '72054961770', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (133, 'Marcelo', 'Lima', '2002-07-07', '78325511338', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (134, 'Patrícia', 'Rocha', '2003-01-17', '42619121083', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (135, 'Ricardo', 'Gonçalves', '2002-06-21', '67093328009', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (136, 'Beatriz', 'Alves', '2003-04-01', '03233843044', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (137, 'Felipe', 'Nunes', '2002-10-30', '20295691091', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (138, 'Camila', 'Barbosa', '2003-05-15', '44080015044', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (139, 'Renan', 'Correia', '2002-09-20', '64371143073', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (140, 'Nathalia', 'Campos', '2003-05-01', '27291827009', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (141, 'Luiz', 'Santana', '2002-11-10', '58488325055', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (142, 'Cristina', 'Cruz', '2003-06-20', '30115988003', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (143, 'Bruno', 'Oliveira', '2002-12-30', '82568901001', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (144, 'Mariana', 'Pereira', '2003-07-05', '14773646000', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (145, 'Thiago', 'Cardoso', '2002-11-22', '86789146042', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (146, 'Laura', 'Gomes', '2003-08-01', '90418796055', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (147, 'Pedro', 'Moraes', '2002-12-10', '09273088045', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (148, 'Ana', 'Barros', '2003-09-15', '56582011008', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (149, 'Rafaela', 'Ferreira', '2003-01-25', '42849830093', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (150, 'Giovanni', 'Costa', '2002-07-01', '95736403006', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (151, 'Vanessa', 'Sousa', '2003-02-12', '03324068082', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (152, 'Thiago', 'Silva', '2002-08-22', '71320508005', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (153, 'Gabriela', 'Gonçalves', '2003-03-03', '68542138069', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (154, 'Raul', 'Melo', '2002-09-05', '36622053070', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (155, 'Bruna', 'Carvalho', '2003-04-20', '69388113020', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (156, 'Diego', 'Almeida', '2002-10-10', '04687942095', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (157, 'Carla', 'Oliveira', '2003-05-01', '95480893095', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (177, 'André', 'Nascimento', '2003-01-12', '54762827083', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (178, 'Carolina', 'Barbosa', '2002-06-30', '21777958077', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (179, 'Ricardo', 'Silveira', '2003-02-05', '35082440049', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (180, 'Viviane', 'Pinto', '2002-07-20', '81916128060', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (181, 'Felipe', 'Fernandes', '2003-02-25', '00345681033', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (182, 'Bruna', 'Rodrigues', '2002-08-12', '51055887005', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (183, 'Daniel', 'Santos', '2003-03-18', '88973862071', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (184, 'Isabela', 'Lima', '2002-09-20', '18963507080', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (185, 'Gabriel', 'Oliveira', '2003-04-05', '46384624066', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (186, 'Aline', 'Silva', '2002-10-01', '74293829940', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (187, 'Rodrigo', 'Sousa', '2003-05-22', '01759219096', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (188, 'Laura', 'Ferreira', '2002-11-12', '27496386009', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (189, 'Vinicius', 'Melo', '2003-06-25', '73950341066', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (190, 'Mariana', 'Gomes', '2003-01-10', '45783258080', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (191, 'Renato', 'Barros', '2002-07-15', '92086462085', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (192, 'Juliana', 'Santos', '2003-02-28', '10432701606', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (193, 'Lucas', 'Oliveira', '2002-08-10', '87632889082', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (194, 'Isabella', 'Silva', '2003-03-05', '40378978047', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (195, 'Thiago', 'Pereira', '2002-09-20', '12768107092', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (196, 'Julia', 'Santos', '2003-04-15', '68507232006', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (197, 'Gabriel', 'Ferreira', '2002-10-30', '23032730093', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (198, 'Carolina', 'Gonçalves', '2003-05-01', '94024603006', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (199, 'Rafael', 'Moraes', '2002-11-10', '70062057008', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (200, 'Mariana', 'Barbosa', '2003-06-20', '08836830093', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (209, 'João', 'Silva', '2003-07-12', '88022885724', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (210, 'Mariana', 'Fernandes', '2003-08-18', '18898792077', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (211, 'Carlos', 'Cavalcanti', '2003-04-22', '64721148302', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (212, 'Patricia', 'Melo', '2003-03-01', '72052362770', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (213, 'Raul', 'Lima', '2003-07-07', '78328512328', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (214, 'Ana', 'Rocha', '2003-01-17', '42719121313', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (215, 'Lucas', 'Gonçalves', '2003-06-21', '69073328309', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (216, 'Marina', 'Alves', '2003-04-01', '03233683404', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (217, 'Vitor', 'Nunes', '2003-10-30', '20295607391', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (218, 'Cristina', 'Barbosa', '2003-05-15', '44685015404', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (219, 'Rodrigo', 'Correia', '2003-09-20', '64356143473', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (220, 'Nathalia', 'Campos', '2003-05-01', '27341827409', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (221, 'Luiz', 'Santana', '2003-11-10', '58488235305', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (222, 'Cristina', 'Cruz', '2003-06-20', '30114288303', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (223, 'Bruno', 'Oliveira', '2003-12-30', '82591901301', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (224, 'Aline', 'Pereira', '2004-07-05', '14573946300', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (225, 'Gabriel', 'Cardoso', '2003-11-22', '86789146342', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (226, 'Amanda', 'Gomes', '2004-08-01', '90418776305', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (227, 'Pedro', 'Moraes', '2003-12-10', '09273468345', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (228, 'Ana', 'Barros', '2004-09-15', '56582017508', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (229, 'Rafael', 'Ferreira', '2004-01-25', '48859830393', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (230, 'Giovanna', 'Costa', '2003-07-01', '95703403308', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (231, 'Vinicius', 'Sousa', '2004-02-12', '03324068382', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (232, 'Tatiane', 'Silva', '2003-08-22', '71320508305', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (233, 'Renato', 'Gonçalves', '2004-03-03', '18842138309', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (234, 'Luiza', 'Melo', '2003-09-05', '36622053750', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (235, 'Bruno', 'Carvalho', '2004-04-20', '69386163300', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (236, 'Fernanda', 'Almeida', '2003-10-10', '04685642345', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (262, 'João', 'Nascimento', '2004-01-12', '56702827305', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (263, 'Mariana', 'Barbosa', '2003-06-30', '23747958377', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (264, 'Carlos', 'Silveira', '2003-02-05', '34092440349', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (265, 'Patricia', 'Pinto', '2002-07-20', '81516188360', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (266, 'Ricardo', 'Fernandes', '2003-02-25', '60385681333', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (267, 'Viviane', 'Rodrigues', '2002-08-12', '71052887305', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (268, 'Felipe', 'Santos', '2003-03-18', '88978802371', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (269, 'Bruna', 'Lima', '2002-09-20', '18963509380', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (270, 'Gabriel', 'Oliveira', '2003-04-05', '44394624366', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (271, 'Aline', 'Silva', '2002-10-01', '74293859340', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (272, 'Rodrigo', 'Sousa', '2003-05-22', '01757209396', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (273, 'Laura', 'Ferreira', '2002-11-12', '27486586309', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (274, 'Vinicius', 'Melo', '2003-06-25', '73959331366', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (275, 'Mariana', 'Gomes', '2003-01-10', '45780248380', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (276, 'Renato', 'Barros', '2002-07-15', '92083422385', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (277, 'Juliana', 'Santos', '2003-02-28', '10442701306', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (278, 'Lucas', 'Oliveira', '2002-08-10', '87652989382', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (279, 'Isabella', 'Silva', '2003-03-05', '40368978347', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (280, 'Thiago', 'Pereira', '2002-09-20', '12778207392', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (281, 'Julia', 'Santos', '2003-04-15', '68507836306', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (282, 'Gabriel', 'Ferreira', '2002-10-30', '29092730393', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (283, 'Carolina', 'Gonçalves', '2003-05-01', '15024603306', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (284, 'Rafael', 'Moraes', '2002-11-10', '70062217308', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (285, 'Mariana', 'Barbosa', '2003-06-20', '08859830393', 'F', '2023-07-01', 2);


--
-- TOC entry 4941 (class 0 OID 16666)
-- Dependencies: 232
-- Data for Name: atividade_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atividade_aluno VALUES (5, 209, 7.0);
INSERT INTO public.atividade_aluno VALUES (5, 210, 6.5);
INSERT INTO public.atividade_aluno VALUES (5, 211, 8.0);
INSERT INTO public.atividade_aluno VALUES (5, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (5, 213, 9.0);
INSERT INTO public.atividade_aluno VALUES (5, 214, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (5, 216, 7.0);
INSERT INTO public.atividade_aluno VALUES (5, 217, 8.0);
INSERT INTO public.atividade_aluno VALUES (5, 218, 7.5);
INSERT INTO public.atividade_aluno VALUES (5, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (5, 220, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 221, 9.0);
INSERT INTO public.atividade_aluno VALUES (5, 222, 7.0);
INSERT INTO public.atividade_aluno VALUES (5, 223, 6.0);
INSERT INTO public.atividade_aluno VALUES (5, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (5, 225, 9.0);
INSERT INTO public.atividade_aluno VALUES (5, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (5, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (5, 229, 8.0);
INSERT INTO public.atividade_aluno VALUES (5, 230, 7.0);
INSERT INTO public.atividade_aluno VALUES (5, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (5, 232, 6.0);
INSERT INTO public.atividade_aluno VALUES (5, 233, 7.5);
INSERT INTO public.atividade_aluno VALUES (5, 234, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 235, 9.0);
INSERT INTO public.atividade_aluno VALUES (5, 236, 7.0);
INSERT INTO public.atividade_aluno VALUES (1, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 210, 7.0);
INSERT INTO public.atividade_aluno VALUES (1, 211, 9.0);
INSERT INTO public.atividade_aluno VALUES (1, 212, 6.5);
INSERT INTO public.atividade_aluno VALUES (1, 213, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (1, 215, 9.5);
INSERT INTO public.atividade_aluno VALUES (1, 216, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (1, 218, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 219, 9.0);
INSERT INTO public.atividade_aluno VALUES (1, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (1, 221, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 222, 6.0);
INSERT INTO public.atividade_aluno VALUES (1, 223, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 224, 7.0);
INSERT INTO public.atividade_aluno VALUES (1, 225, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (1, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (1, 229, 9.0);
INSERT INTO public.atividade_aluno VALUES (1, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 231, 7.0);
INSERT INTO public.atividade_aluno VALUES (1, 232, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 233, 9.5);
INSERT INTO public.atividade_aluno VALUES (1, 234, 7.5);
INSERT INTO public.atividade_aluno VALUES (1, 235, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 236, 6.5);
INSERT INTO public.atividade_aluno VALUES (2, 209, 7.0);
INSERT INTO public.atividade_aluno VALUES (2, 210, 6.5);
INSERT INTO public.atividade_aluno VALUES (2, 211, 8.0);
INSERT INTO public.atividade_aluno VALUES (2, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (2, 213, 9.0);
INSERT INTO public.atividade_aluno VALUES (2, 214, 8.5);
INSERT INTO public.atividade_aluno VALUES (2, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (2, 216, 7.0);
INSERT INTO public.atividade_aluno VALUES (2, 217, 8.0);
INSERT INTO public.atividade_aluno VALUES (2, 218, 7.5);
INSERT INTO public.atividade_aluno VALUES (2, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (2, 220, 8.5);
INSERT INTO public.atividade_aluno VALUES (2, 221, 9.0);
INSERT INTO public.atividade_aluno VALUES (2, 222, 7.0);
INSERT INTO public.atividade_aluno VALUES (2, 223, 6.0);
INSERT INTO public.atividade_aluno VALUES (2, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (2, 225, 9.0);
INSERT INTO public.atividade_aluno VALUES (2, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (2, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (2, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (2, 229, 8.0);
INSERT INTO public.atividade_aluno VALUES (2, 230, 7.0);
INSERT INTO public.atividade_aluno VALUES (2, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (2, 232, 6.0);
INSERT INTO public.atividade_aluno VALUES (2, 233, 7.5);
INSERT INTO public.atividade_aluno VALUES (2, 234, 8.5);
INSERT INTO public.atividade_aluno VALUES (2, 235, 9.0);
INSERT INTO public.atividade_aluno VALUES (2, 236, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 210, 9.0);
INSERT INTO public.atividade_aluno VALUES (3, 211, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 212, 8.0);
INSERT INTO public.atividade_aluno VALUES (3, 213, 9.5);
INSERT INTO public.atividade_aluno VALUES (3, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (3, 215, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 216, 9.0);
INSERT INTO public.atividade_aluno VALUES (3, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 218, 8.0);
INSERT INTO public.atividade_aluno VALUES (3, 219, 9.5);
INSERT INTO public.atividade_aluno VALUES (3, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (3, 221, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 222, 9.0);
INSERT INTO public.atividade_aluno VALUES (3, 223, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (3, 225, 9.5);
INSERT INTO public.atividade_aluno VALUES (3, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (3, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 228, 9.0);
INSERT INTO public.atividade_aluno VALUES (3, 229, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (3, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (3, 232, 7.5);
INSERT INTO public.atividade_aluno VALUES (3, 233, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 234, 9.0);
INSERT INTO public.atividade_aluno VALUES (3, 235, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 236, 8.0);
INSERT INTO public.atividade_aluno VALUES (6, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (6, 210, 9.0);
INSERT INTO public.atividade_aluno VALUES (6, 211, 7.0);
INSERT INTO public.atividade_aluno VALUES (6, 212, 8.0);
INSERT INTO public.atividade_aluno VALUES (6, 213, 9.5);
INSERT INTO public.atividade_aluno VALUES (6, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (6, 215, 8.5);
INSERT INTO public.atividade_aluno VALUES (6, 216, 9.0);
INSERT INTO public.atividade_aluno VALUES (6, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (6, 218, 8.0);
INSERT INTO public.atividade_aluno VALUES (6, 219, 9.5);
INSERT INTO public.atividade_aluno VALUES (6, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (6, 221, 8.5);
INSERT INTO public.atividade_aluno VALUES (6, 222, 9.0);
INSERT INTO public.atividade_aluno VALUES (6, 223, 7.0);
INSERT INTO public.atividade_aluno VALUES (6, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (6, 225, 9.5);
INSERT INTO public.atividade_aluno VALUES (6, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (6, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (6, 228, 9.0);
INSERT INTO public.atividade_aluno VALUES (6, 229, 7.0);
INSERT INTO public.atividade_aluno VALUES (6, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (6, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (6, 232, 7.5);
INSERT INTO public.atividade_aluno VALUES (6, 233, 8.5);
INSERT INTO public.atividade_aluno VALUES (6, 234, 9.0);
INSERT INTO public.atividade_aluno VALUES (6, 235, 7.0);
INSERT INTO public.atividade_aluno VALUES (6, 236, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (4, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (4, 210, 7.0);
INSERT INTO public.atividade_aluno VALUES (4, 211, 9.0);
INSERT INTO public.atividade_aluno VALUES (7, 210, 7.0);
INSERT INTO public.atividade_aluno VALUES (7, 211, 9.0);
INSERT INTO public.atividade_aluno VALUES (7, 212, 6.5);
INSERT INTO public.atividade_aluno VALUES (7, 213, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (7, 215, 9.5);
INSERT INTO public.atividade_aluno VALUES (7, 216, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (7, 218, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 219, 9.0);
INSERT INTO public.atividade_aluno VALUES (7, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (7, 221, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 222, 6.0);
INSERT INTO public.atividade_aluno VALUES (7, 223, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 224, 7.0);
INSERT INTO public.atividade_aluno VALUES (7, 225, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (7, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (7, 229, 9.0);
INSERT INTO public.atividade_aluno VALUES (7, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 231, 7.0);
INSERT INTO public.atividade_aluno VALUES (7, 232, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 233, 9.5);
INSERT INTO public.atividade_aluno VALUES (7, 234, 7.5);
INSERT INTO public.atividade_aluno VALUES (7, 235, 8.0);
INSERT INTO public.atividade_aluno VALUES (4, 236, 6.5);
INSERT INTO public.atividade_aluno VALUES (7, 236, 6.5);
INSERT INTO public.atividade_aluno VALUES (8, 209, 7.0);
INSERT INTO public.atividade_aluno VALUES (8, 210, 6.5);
INSERT INTO public.atividade_aluno VALUES (8, 211, 8.0);
INSERT INTO public.atividade_aluno VALUES (8, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (8, 213, 9.0);
INSERT INTO public.atividade_aluno VALUES (8, 214, 8.5);
INSERT INTO public.atividade_aluno VALUES (8, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (8, 216, 7.0);
INSERT INTO public.atividade_aluno VALUES (8, 217, 8.0);
INSERT INTO public.atividade_aluno VALUES (8, 218, 7.5);
INSERT INTO public.atividade_aluno VALUES (8, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (8, 220, 8.5);
INSERT INTO public.atividade_aluno VALUES (8, 221, 9.0);
INSERT INTO public.atividade_aluno VALUES (8, 222, 7.0);
INSERT INTO public.atividade_aluno VALUES (8, 223, 6.0);
INSERT INTO public.atividade_aluno VALUES (8, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (8, 225, 9.0);
INSERT INTO public.atividade_aluno VALUES (8, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (8, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (8, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (8, 229, 8.0);
INSERT INTO public.atividade_aluno VALUES (8, 230, 7.0);
INSERT INTO public.atividade_aluno VALUES (8, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (8, 232, 6.0);
INSERT INTO public.atividade_aluno VALUES (8, 233, 7.5);
INSERT INTO public.atividade_aluno VALUES (8, 234, 8.5);
INSERT INTO public.atividade_aluno VALUES (8, 235, 9.0);
INSERT INTO public.atividade_aluno VALUES (8, 236, 7.0);
INSERT INTO public.atividade_aluno VALUES (9, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (9, 210, 9.0);
INSERT INTO public.atividade_aluno VALUES (9, 211, 7.0);
INSERT INTO public.atividade_aluno VALUES (9, 212, 8.0);
INSERT INTO public.atividade_aluno VALUES (9, 213, 9.5);
INSERT INTO public.atividade_aluno VALUES (9, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (9, 215, 8.5);
INSERT INTO public.atividade_aluno VALUES (9, 216, 9.0);
INSERT INTO public.atividade_aluno VALUES (9, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (9, 218, 8.0);
INSERT INTO public.atividade_aluno VALUES (9, 219, 9.5);
INSERT INTO public.atividade_aluno VALUES (9, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (9, 221, 8.5);
INSERT INTO public.atividade_aluno VALUES (9, 222, 9.0);
INSERT INTO public.atividade_aluno VALUES (9, 223, 7.0);
INSERT INTO public.atividade_aluno VALUES (9, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (9, 225, 9.5);
INSERT INTO public.atividade_aluno VALUES (9, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (9, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (9, 228, 9.0);
INSERT INTO public.atividade_aluno VALUES (9, 229, 7.0);
INSERT INTO public.atividade_aluno VALUES (9, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (9, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (9, 232, 7.5);
INSERT INTO public.atividade_aluno VALUES (9, 233, 8.5);
INSERT INTO public.atividade_aluno VALUES (9, 234, 9.0);
INSERT INTO public.atividade_aluno VALUES (9, 235, 7.0);
INSERT INTO public.atividade_aluno VALUES (9, 236, 8.0);
INSERT INTO public.atividade_aluno VALUES (10, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (10, 210, 7.0);
INSERT INTO public.atividade_aluno VALUES (10, 211, 9.0);
INSERT INTO public.atividade_aluno VALUES (10, 212, 6.5);
INSERT INTO public.atividade_aluno VALUES (10, 213, 8.0);
INSERT INTO public.atividade_aluno VALUES (10, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (10, 215, 9.5);
INSERT INTO public.atividade_aluno VALUES (10, 216, 8.0);
INSERT INTO public.atividade_aluno VALUES (10, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (10, 218, 8.5);
INSERT INTO public.atividade_aluno VALUES (10, 219, 9.0);
INSERT INTO public.atividade_aluno VALUES (10, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (10, 221, 8.0);
INSERT INTO public.atividade_aluno VALUES (10, 222, 6.0);
INSERT INTO public.atividade_aluno VALUES (10, 223, 8.5);
INSERT INTO public.atividade_aluno VALUES (10, 224, 7.0);
INSERT INTO public.atividade_aluno VALUES (10, 225, 8.0);
INSERT INTO public.atividade_aluno VALUES (10, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (10, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (10, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (10, 229, 9.0);
INSERT INTO public.atividade_aluno VALUES (10, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (10, 231, 7.0);
INSERT INTO public.atividade_aluno VALUES (10, 232, 8.5);
INSERT INTO public.atividade_aluno VALUES (10, 233, 9.5);
INSERT INTO public.atividade_aluno VALUES (10, 234, 7.5);
INSERT INTO public.atividade_aluno VALUES (10, 235, 8.0);
INSERT INTO public.atividade_aluno VALUES (10, 236, 6.5);
INSERT INTO public.atividade_aluno VALUES (11, 209, 7.0);
INSERT INTO public.atividade_aluno VALUES (11, 210, 6.5);
INSERT INTO public.atividade_aluno VALUES (11, 211, 8.0);
INSERT INTO public.atividade_aluno VALUES (11, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (11, 213, 9.0);
INSERT INTO public.atividade_aluno VALUES (11, 214, 8.5);
INSERT INTO public.atividade_aluno VALUES (11, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (11, 216, 7.0);
INSERT INTO public.atividade_aluno VALUES (11, 217, 8.0);
INSERT INTO public.atividade_aluno VALUES (11, 218, 7.5);
INSERT INTO public.atividade_aluno VALUES (11, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (11, 220, 8.5);
INSERT INTO public.atividade_aluno VALUES (11, 221, 9.0);
INSERT INTO public.atividade_aluno VALUES (11, 222, 7.0);
INSERT INTO public.atividade_aluno VALUES (11, 223, 6.0);
INSERT INTO public.atividade_aluno VALUES (11, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (11, 225, 9.0);
INSERT INTO public.atividade_aluno VALUES (11, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (11, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (11, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (11, 229, 8.0);
INSERT INTO public.atividade_aluno VALUES (11, 230, 7.0);
INSERT INTO public.atividade_aluno VALUES (11, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (11, 232, 6.0);
INSERT INTO public.atividade_aluno VALUES (11, 233, 7.5);
INSERT INTO public.atividade_aluno VALUES (11, 234, 8.5);
INSERT INTO public.atividade_aluno VALUES (11, 235, 9.0);
INSERT INTO public.atividade_aluno VALUES (11, 236, 7.0);
INSERT INTO public.atividade_aluno VALUES (12, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (12, 210, 9.0);
INSERT INTO public.atividade_aluno VALUES (12, 211, 7.0);
INSERT INTO public.atividade_aluno VALUES (12, 212, 8.0);
INSERT INTO public.atividade_aluno VALUES (12, 213, 9.5);
INSERT INTO public.atividade_aluno VALUES (12, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (12, 215, 8.5);
INSERT INTO public.atividade_aluno VALUES (12, 216, 9.0);
INSERT INTO public.atividade_aluno VALUES (12, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (12, 218, 8.0);
INSERT INTO public.atividade_aluno VALUES (12, 219, 9.5);
INSERT INTO public.atividade_aluno VALUES (12, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (12, 221, 8.5);
INSERT INTO public.atividade_aluno VALUES (12, 222, 9.0);
INSERT INTO public.atividade_aluno VALUES (12, 223, 7.0);
INSERT INTO public.atividade_aluno VALUES (12, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (12, 225, 9.5);
INSERT INTO public.atividade_aluno VALUES (12, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (12, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (12, 228, 9.0);
INSERT INTO public.atividade_aluno VALUES (12, 229, 7.0);
INSERT INTO public.atividade_aluno VALUES (12, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (12, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (12, 232, 7.5);
INSERT INTO public.atividade_aluno VALUES (12, 233, 8.5);
INSERT INTO public.atividade_aluno VALUES (12, 234, 9.0);
INSERT INTO public.atividade_aluno VALUES (12, 235, 7.0);
INSERT INTO public.atividade_aluno VALUES (12, 236, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (13, 210, 7.0);
INSERT INTO public.atividade_aluno VALUES (13, 211, 9.0);
INSERT INTO public.atividade_aluno VALUES (13, 212, 6.5);
INSERT INTO public.atividade_aluno VALUES (13, 213, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (13, 215, 9.5);
INSERT INTO public.atividade_aluno VALUES (13, 216, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (13, 218, 8.5);
INSERT INTO public.atividade_aluno VALUES (13, 219, 9.0);
INSERT INTO public.atividade_aluno VALUES (13, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (13, 221, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 222, 6.0);
INSERT INTO public.atividade_aluno VALUES (13, 223, 8.5);
INSERT INTO public.atividade_aluno VALUES (13, 224, 7.0);
INSERT INTO public.atividade_aluno VALUES (13, 225, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (13, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (13, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (13, 229, 9.0);
INSERT INTO public.atividade_aluno VALUES (13, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 231, 7.0);
INSERT INTO public.atividade_aluno VALUES (13, 232, 8.5);
INSERT INTO public.atividade_aluno VALUES (13, 233, 9.5);
INSERT INTO public.atividade_aluno VALUES (13, 234, 7.5);
INSERT INTO public.atividade_aluno VALUES (13, 235, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 236, 6.5);
INSERT INTO public.atividade_aluno VALUES (14, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (14, 210, 9.0);
INSERT INTO public.atividade_aluno VALUES (14, 211, 7.0);
INSERT INTO public.atividade_aluno VALUES (14, 212, 8.0);
INSERT INTO public.atividade_aluno VALUES (14, 213, 9.5);
INSERT INTO public.atividade_aluno VALUES (14, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (14, 215, 8.5);
INSERT INTO public.atividade_aluno VALUES (14, 216, 9.0);
INSERT INTO public.atividade_aluno VALUES (14, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (14, 218, 8.0);
INSERT INTO public.atividade_aluno VALUES (14, 219, 9.5);
INSERT INTO public.atividade_aluno VALUES (14, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (14, 221, 8.5);
INSERT INTO public.atividade_aluno VALUES (14, 222, 9.0);
INSERT INTO public.atividade_aluno VALUES (14, 223, 7.0);
INSERT INTO public.atividade_aluno VALUES (14, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (14, 225, 9.5);
INSERT INTO public.atividade_aluno VALUES (14, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (14, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (14, 228, 9.0);
INSERT INTO public.atividade_aluno VALUES (14, 229, 7.0);
INSERT INTO public.atividade_aluno VALUES (14, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (14, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (14, 232, 7.5);
INSERT INTO public.atividade_aluno VALUES (14, 233, 8.5);
INSERT INTO public.atividade_aluno VALUES (14, 234, 9.0);
INSERT INTO public.atividade_aluno VALUES (14, 235, 7.0);
INSERT INTO public.atividade_aluno VALUES (14, 236, 8.0);
INSERT INTO public.atividade_aluno VALUES (15, 209, 7.0);
INSERT INTO public.atividade_aluno VALUES (15, 210, 6.5);
INSERT INTO public.atividade_aluno VALUES (15, 211, 8.0);
INSERT INTO public.atividade_aluno VALUES (15, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (15, 213, 9.0);
INSERT INTO public.atividade_aluno VALUES (15, 214, 8.5);
INSERT INTO public.atividade_aluno VALUES (15, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (15, 216, 7.0);
INSERT INTO public.atividade_aluno VALUES (15, 217, 8.0);
INSERT INTO public.atividade_aluno VALUES (15, 218, 7.5);
INSERT INTO public.atividade_aluno VALUES (15, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (15, 220, 8.5);
INSERT INTO public.atividade_aluno VALUES (15, 221, 9.0);
INSERT INTO public.atividade_aluno VALUES (15, 222, 7.0);
INSERT INTO public.atividade_aluno VALUES (15, 223, 6.0);
INSERT INTO public.atividade_aluno VALUES (15, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (15, 225, 9.0);
INSERT INTO public.atividade_aluno VALUES (15, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (15, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (15, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (15, 229, 8.0);
INSERT INTO public.atividade_aluno VALUES (15, 230, 7.0);
INSERT INTO public.atividade_aluno VALUES (15, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (15, 232, 6.0);
INSERT INTO public.atividade_aluno VALUES (15, 233, 7.5);
INSERT INTO public.atividade_aluno VALUES (15, 234, 8.5);
INSERT INTO public.atividade_aluno VALUES (15, 235, 9.0);
INSERT INTO public.atividade_aluno VALUES (15, 236, 7.0);


--
-- TOC entry 4937 (class 0 OID 16593)
-- Dependencies: 228
-- Data for Name: atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atividades VALUES (1, 'Trabalho', 'Trabalho de pesquisa sobre a história da computação', '2023-04-15', 15, 3);
INSERT INTO public.atividades VALUES (2, 'Prova', 'Prova teórica sobre conceitos básicos de computação', '2023-05-10', 15, 3);
INSERT INTO public.atividades VALUES (3, 'Trabalho', 'Desenvolvimento de um trabalho prático utilizando algoritmos simples', '2023-06-05', 15, 3);
INSERT INTO public.atividades VALUES (4, 'Trabalho', 'Desenvolvimento de um site estático utilizando HTML, CSS e JavaScrip', '2023-04-20', 13, 2);
INSERT INTO public.atividades VALUES (6, 'Trabalho', 'Desenvolvimento de um blog dinâmico com CRUD em PHP e MySQL', '2023-06-10', 13, 2);
INSERT INTO public.atividades VALUES (5, 'Trabalho', 'Implementação de um sistema de login utilizando Node.js e Express', '2023-05-15', 13, 2);
INSERT INTO public.atividades VALUES (7, 'Prova', 'TProva sobre conjuntos, relações e funções', '2023-05-01', 2, 4);
INSERT INTO public.atividades VALUES (8, 'Trabalho', 'Trabalho sobre álgebra booleana e circuitos lógico', '2023-05-25', 2, 4);
INSERT INTO public.atividades VALUES (9, 'Trabalho', 'Apresentação sobre grafos e suas aplicações', '2023-06-20', 2, 4);
INSERT INTO public.atividades VALUES (10, 'Prova', 'Prova sobre limites e derivadas', '2023-05-05', 8, 5);
INSERT INTO public.atividades VALUES (11, 'Prova', 'Prova sobre integrais definidas', '2023-05-30', 8, 5);
INSERT INTO public.atividades VALUES (12, 'Prova', 'Apresentação sobre aplicações da derivada', '2023-06-25', 8, 5);
INSERT INTO public.atividades VALUES (13, 'Prova', 'Prova sobre estruturas de controle', '2023-04-05', 2, 1);
INSERT INTO public.atividades VALUES (14, 'Prova', 'Prova sobre arrays e funções', '2023-05-30', 2, 1);
INSERT INTO public.atividades VALUES (15, 'Trabalho', 'Trabalho prático de desenvolvimento de algoritmos', '2023-06-25', 2, 1);


--
-- TOC entry 4925 (class 0 OID 16532)
-- Dependencies: 216
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos VALUES (1, 'Bacharelado em Ciência da Computação', 9, 14, 'BCC');
INSERT INTO public.cursos VALUES (2, 'Tecnologia em Análise e Desenvolvimento de Sistemas', 6, 10, 'TADS');


--
-- TOC entry 4938 (class 0 OID 16604)
-- Dependencies: 229
-- Data for Name: cursos_disciplinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos_disciplinas VALUES (1, 1);
INSERT INTO public.cursos_disciplinas VALUES (1, 2);
INSERT INTO public.cursos_disciplinas VALUES (1, 3);
INSERT INTO public.cursos_disciplinas VALUES (1, 4);
INSERT INTO public.cursos_disciplinas VALUES (1, 5);
INSERT INTO public.cursos_disciplinas VALUES (1, 6);
INSERT INTO public.cursos_disciplinas VALUES (1, 7);
INSERT INTO public.cursos_disciplinas VALUES (1, 8);
INSERT INTO public.cursos_disciplinas VALUES (1, 9);
INSERT INTO public.cursos_disciplinas VALUES (1, 10);
INSERT INTO public.cursos_disciplinas VALUES (1, 11);
INSERT INTO public.cursos_disciplinas VALUES (1, 12);
INSERT INTO public.cursos_disciplinas VALUES (1, 13);
INSERT INTO public.cursos_disciplinas VALUES (1, 14);
INSERT INTO public.cursos_disciplinas VALUES (1, 15);
INSERT INTO public.cursos_disciplinas VALUES (1, 16);
INSERT INTO public.cursos_disciplinas VALUES (1, 17);
INSERT INTO public.cursos_disciplinas VALUES (1, 18);
INSERT INTO public.cursos_disciplinas VALUES (1, 19);
INSERT INTO public.cursos_disciplinas VALUES (1, 20);
INSERT INTO public.cursos_disciplinas VALUES (1, 21);
INSERT INTO public.cursos_disciplinas VALUES (1, 22);
INSERT INTO public.cursos_disciplinas VALUES (1, 23);
INSERT INTO public.cursos_disciplinas VALUES (1, 24);
INSERT INTO public.cursos_disciplinas VALUES (1, 25);
INSERT INTO public.cursos_disciplinas VALUES (1, 26);
INSERT INTO public.cursos_disciplinas VALUES (1, 27);
INSERT INTO public.cursos_disciplinas VALUES (1, 28);
INSERT INTO public.cursos_disciplinas VALUES (1, 29);
INSERT INTO public.cursos_disciplinas VALUES (1, 30);
INSERT INTO public.cursos_disciplinas VALUES (1, 31);
INSERT INTO public.cursos_disciplinas VALUES (1, 32);
INSERT INTO public.cursos_disciplinas VALUES (1, 33);
INSERT INTO public.cursos_disciplinas VALUES (1, 34);
INSERT INTO public.cursos_disciplinas VALUES (1, 35);
INSERT INTO public.cursos_disciplinas VALUES (1, 36);
INSERT INTO public.cursos_disciplinas VALUES (1, 37);
INSERT INTO public.cursos_disciplinas VALUES (1, 38);
INSERT INTO public.cursos_disciplinas VALUES (1, 39);
INSERT INTO public.cursos_disciplinas VALUES (1, 40);
INSERT INTO public.cursos_disciplinas VALUES (2, 20);
INSERT INTO public.cursos_disciplinas VALUES (2, 21);
INSERT INTO public.cursos_disciplinas VALUES (2, 4);
INSERT INTO public.cursos_disciplinas VALUES (2, 5);
INSERT INTO public.cursos_disciplinas VALUES (2, 8);
INSERT INTO public.cursos_disciplinas VALUES (2, 10);
INSERT INTO public.cursos_disciplinas VALUES (2, 11);
INSERT INTO public.cursos_disciplinas VALUES (2, 12);
INSERT INTO public.cursos_disciplinas VALUES (2, 13);
INSERT INTO public.cursos_disciplinas VALUES (2, 22);
INSERT INTO public.cursos_disciplinas VALUES (2, 23);
INSERT INTO public.cursos_disciplinas VALUES (2, 24);
INSERT INTO public.cursos_disciplinas VALUES (2, 31);
INSERT INTO public.cursos_disciplinas VALUES (2, 32);
INSERT INTO public.cursos_disciplinas VALUES (2, 33);
INSERT INTO public.cursos_disciplinas VALUES (2, 2);
INSERT INTO public.cursos_disciplinas VALUES (2, 3);
INSERT INTO public.cursos_disciplinas VALUES (2, 6);


--
-- TOC entry 4931 (class 0 OID 16558)
-- Dependencies: 222
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos VALUES (2, 'Departamento de Matemática', 'DMAT');
INSERT INTO public.departamentos VALUES (1, 'Departamento de Ciência da Computação', 'DCC');


--
-- TOC entry 4927 (class 0 OID 16539)
-- Dependencies: 218
-- Data for Name: disciplinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.disciplinas VALUES (1, 'Matemática Discreta', 60);
INSERT INTO public.disciplinas VALUES (2, 'Algoritmos e Estruturas de Dados I', 80);
INSERT INTO public.disciplinas VALUES (3, 'Algoritmos e Estruturas de Dados II', 80);
INSERT INTO public.disciplinas VALUES (4, 'Banco de Dados I', 60);
INSERT INTO public.disciplinas VALUES (5, 'Banco de Dados II', 60);
INSERT INTO public.disciplinas VALUES (6, 'Programação Orientada a Objetos I', 80);
INSERT INTO public.disciplinas VALUES (7, 'Programação Orientada a Objetos II', 80);
INSERT INTO public.disciplinas VALUES (8, 'Redes de Computadores I', 60);
INSERT INTO public.disciplinas VALUES (9, 'Redes de Computadores II', 60);
INSERT INTO public.disciplinas VALUES (10, 'Engenharia de Software I', 60);
INSERT INTO public.disciplinas VALUES (11, 'Engenharia de Software II', 60);
INSERT INTO public.disciplinas VALUES (12, 'Sistemas Operacionais', 60);
INSERT INTO public.disciplinas VALUES (13, 'Introdução à Computação', 60);
INSERT INTO public.disciplinas VALUES (14, 'Cálculo I', 60);
INSERT INTO public.disciplinas VALUES (15, 'Cálculo II', 60);
INSERT INTO public.disciplinas VALUES (16, 'Álgebra Linear', 60);
INSERT INTO public.disciplinas VALUES (17, 'Física I', 60);
INSERT INTO public.disciplinas VALUES (18, 'Física II', 60);
INSERT INTO public.disciplinas VALUES (19, 'Estatística', 60);
INSERT INTO public.disciplinas VALUES (20, 'Lógica de Programação', 60);
INSERT INTO public.disciplinas VALUES (21, 'Desenvolvimento Web', 80);
INSERT INTO public.disciplinas VALUES (22, 'Inteligência Artificial', 60);
INSERT INTO public.disciplinas VALUES (23, 'Sistemas Distribuídos', 60);
INSERT INTO public.disciplinas VALUES (24, 'Segurança da Informação', 60);
INSERT INTO public.disciplinas VALUES (25, 'Análise e Projeto de Sistemas', 60);
INSERT INTO public.disciplinas VALUES (26, 'Gestão de Projetos', 60);
INSERT INTO public.disciplinas VALUES (27, 'Computação Gráfica', 60);
INSERT INTO public.disciplinas VALUES (28, 'Mineração de Dados', 60);
INSERT INTO public.disciplinas VALUES (29, 'Programação Funcional', 60);
INSERT INTO public.disciplinas VALUES (30, 'Compiladores', 60);
INSERT INTO public.disciplinas VALUES (31, 'Realidade Virtual', 60);
INSERT INTO public.disciplinas VALUES (32, 'Big Data', 60);
INSERT INTO public.disciplinas VALUES (33, 'Computação em Nuvem', 60);
INSERT INTO public.disciplinas VALUES (34, 'Arquitetura de Computadores', 60);
INSERT INTO public.disciplinas VALUES (35, 'Tópicos Avançados em Computação', 60);
INSERT INTO public.disciplinas VALUES (36, 'Empreendedorismo', 60);
INSERT INTO public.disciplinas VALUES (37, 'Inglês Técnico', 60);
INSERT INTO public.disciplinas VALUES (38, 'Tecnologias Emergentes', 60);
INSERT INTO public.disciplinas VALUES (39, 'Ética na Computação', 60);
INSERT INTO public.disciplinas VALUES (40, 'Seminários em Computação', 60);


--
-- TOC entry 4933 (class 0 OID 16565)
-- Dependencies: 224
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professores VALUES (1, 'João', 'Silva', '1970-05-15', '123.456.789-10', 'M', 1);
INSERT INTO public.professores VALUES (2, 'Maria', 'Santos', '1982-09-20', '987.654.321-10', 'F', 1);
INSERT INTO public.professores VALUES (3, 'Carlos', 'Oliveira', '1975-03-10', '456.789.123-10', 'M', 1);
INSERT INTO public.professores VALUES (4, 'Ana', 'Rodrigues', '1988-07-25', '321.654.987-10', 'F', 1);
INSERT INTO public.professores VALUES (5, 'Pedro', 'Costa', '1980-11-08', '789.123.456-10', 'M', 1);
INSERT INTO public.professores VALUES (6, 'Marta', 'Pereira', '1973-12-12', '456.789.123-11', 'F', 2);
INSERT INTO public.professores VALUES (7, 'Paulo', 'Gomes', '1978-02-28', '987.654.321-11', 'M', 2);
INSERT INTO public.professores VALUES (8, 'Fernanda', 'Martins', '1985-06-17', '123.456.789-11', 'F', 2);
INSERT INTO public.professores VALUES (9, 'Rafael', 'Almeida', '1972-08-03', '789.123.456-11', 'M', 2);
INSERT INTO public.professores VALUES (10, 'Aline', 'Ferreira', '1983-04-09', '321.654.987-11', 'F', 2);
INSERT INTO public.professores VALUES (11, 'Lucas', 'Souza', '1977-10-22', '159.753.852-10', 'M', 1);
INSERT INTO public.professores VALUES (12, 'Gabriela', 'Cunha', '1981-01-30', '357.951.468-10', 'F', 1);
INSERT INTO public.professores VALUES (13, 'Eduardo', 'Mendes', '1976-11-05', '951.753.159-10', 'M', 1);
INSERT INTO public.professores VALUES (14, 'Patricia', 'Rocha', '1989-03-14', '753.159.357-10', 'F', 1);
INSERT INTO public.professores VALUES (15, 'Marcelo', 'Lima', '1974-09-18', '468.357.951-10', 'M', 1);


--
-- TOC entry 4939 (class 0 OID 16619)
-- Dependencies: 230
-- Data for Name: turma_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turma_aluno VALUES (1, 209);
INSERT INTO public.turma_aluno VALUES (1, 210);
INSERT INTO public.turma_aluno VALUES (1, 211);
INSERT INTO public.turma_aluno VALUES (1, 212);
INSERT INTO public.turma_aluno VALUES (1, 213);
INSERT INTO public.turma_aluno VALUES (1, 214);
INSERT INTO public.turma_aluno VALUES (1, 215);
INSERT INTO public.turma_aluno VALUES (1, 216);
INSERT INTO public.turma_aluno VALUES (1, 217);
INSERT INTO public.turma_aluno VALUES (1, 218);
INSERT INTO public.turma_aluno VALUES (1, 219);
INSERT INTO public.turma_aluno VALUES (1, 220);
INSERT INTO public.turma_aluno VALUES (1, 221);
INSERT INTO public.turma_aluno VALUES (1, 222);
INSERT INTO public.turma_aluno VALUES (1, 223);
INSERT INTO public.turma_aluno VALUES (1, 224);
INSERT INTO public.turma_aluno VALUES (1, 225);
INSERT INTO public.turma_aluno VALUES (1, 226);
INSERT INTO public.turma_aluno VALUES (1, 227);
INSERT INTO public.turma_aluno VALUES (1, 228);
INSERT INTO public.turma_aluno VALUES (1, 229);
INSERT INTO public.turma_aluno VALUES (1, 230);
INSERT INTO public.turma_aluno VALUES (1, 231);
INSERT INTO public.turma_aluno VALUES (1, 232);
INSERT INTO public.turma_aluno VALUES (1, 233);
INSERT INTO public.turma_aluno VALUES (1, 234);
INSERT INTO public.turma_aluno VALUES (1, 235);
INSERT INTO public.turma_aluno VALUES (1, 236);
INSERT INTO public.turma_aluno VALUES (2, 209);
INSERT INTO public.turma_aluno VALUES (2, 210);
INSERT INTO public.turma_aluno VALUES (2, 211);
INSERT INTO public.turma_aluno VALUES (2, 212);
INSERT INTO public.turma_aluno VALUES (2, 213);
INSERT INTO public.turma_aluno VALUES (2, 214);
INSERT INTO public.turma_aluno VALUES (2, 215);
INSERT INTO public.turma_aluno VALUES (2, 216);
INSERT INTO public.turma_aluno VALUES (2, 217);
INSERT INTO public.turma_aluno VALUES (2, 218);
INSERT INTO public.turma_aluno VALUES (2, 219);
INSERT INTO public.turma_aluno VALUES (2, 220);
INSERT INTO public.turma_aluno VALUES (2, 221);
INSERT INTO public.turma_aluno VALUES (2, 222);
INSERT INTO public.turma_aluno VALUES (2, 223);
INSERT INTO public.turma_aluno VALUES (2, 224);
INSERT INTO public.turma_aluno VALUES (2, 225);
INSERT INTO public.turma_aluno VALUES (2, 226);
INSERT INTO public.turma_aluno VALUES (2, 227);
INSERT INTO public.turma_aluno VALUES (2, 228);
INSERT INTO public.turma_aluno VALUES (2, 229);
INSERT INTO public.turma_aluno VALUES (2, 230);
INSERT INTO public.turma_aluno VALUES (2, 231);
INSERT INTO public.turma_aluno VALUES (2, 232);
INSERT INTO public.turma_aluno VALUES (2, 233);
INSERT INTO public.turma_aluno VALUES (2, 234);
INSERT INTO public.turma_aluno VALUES (2, 235);
INSERT INTO public.turma_aluno VALUES (2, 236);
INSERT INTO public.turma_aluno VALUES (3, 209);
INSERT INTO public.turma_aluno VALUES (3, 210);
INSERT INTO public.turma_aluno VALUES (3, 211);
INSERT INTO public.turma_aluno VALUES (3, 212);
INSERT INTO public.turma_aluno VALUES (3, 213);
INSERT INTO public.turma_aluno VALUES (3, 214);
INSERT INTO public.turma_aluno VALUES (3, 215);
INSERT INTO public.turma_aluno VALUES (3, 216);
INSERT INTO public.turma_aluno VALUES (3, 217);
INSERT INTO public.turma_aluno VALUES (3, 218);
INSERT INTO public.turma_aluno VALUES (3, 219);
INSERT INTO public.turma_aluno VALUES (3, 220);
INSERT INTO public.turma_aluno VALUES (3, 221);
INSERT INTO public.turma_aluno VALUES (3, 222);
INSERT INTO public.turma_aluno VALUES (3, 223);
INSERT INTO public.turma_aluno VALUES (3, 224);
INSERT INTO public.turma_aluno VALUES (3, 225);
INSERT INTO public.turma_aluno VALUES (3, 226);
INSERT INTO public.turma_aluno VALUES (3, 227);
INSERT INTO public.turma_aluno VALUES (3, 228);
INSERT INTO public.turma_aluno VALUES (3, 229);
INSERT INTO public.turma_aluno VALUES (3, 230);
INSERT INTO public.turma_aluno VALUES (3, 231);
INSERT INTO public.turma_aluno VALUES (3, 232);
INSERT INTO public.turma_aluno VALUES (3, 233);
INSERT INTO public.turma_aluno VALUES (3, 234);
INSERT INTO public.turma_aluno VALUES (3, 235);
INSERT INTO public.turma_aluno VALUES (3, 236);
INSERT INTO public.turma_aluno VALUES (4, 209);
INSERT INTO public.turma_aluno VALUES (4, 210);
INSERT INTO public.turma_aluno VALUES (4, 211);
INSERT INTO public.turma_aluno VALUES (4, 212);
INSERT INTO public.turma_aluno VALUES (4, 213);
INSERT INTO public.turma_aluno VALUES (4, 214);
INSERT INTO public.turma_aluno VALUES (4, 215);
INSERT INTO public.turma_aluno VALUES (4, 216);
INSERT INTO public.turma_aluno VALUES (4, 217);
INSERT INTO public.turma_aluno VALUES (4, 218);
INSERT INTO public.turma_aluno VALUES (4, 219);
INSERT INTO public.turma_aluno VALUES (4, 220);
INSERT INTO public.turma_aluno VALUES (4, 221);
INSERT INTO public.turma_aluno VALUES (4, 222);
INSERT INTO public.turma_aluno VALUES (4, 223);
INSERT INTO public.turma_aluno VALUES (4, 224);
INSERT INTO public.turma_aluno VALUES (4, 225);
INSERT INTO public.turma_aluno VALUES (4, 226);
INSERT INTO public.turma_aluno VALUES (4, 227);
INSERT INTO public.turma_aluno VALUES (4, 228);
INSERT INTO public.turma_aluno VALUES (4, 229);
INSERT INTO public.turma_aluno VALUES (4, 230);
INSERT INTO public.turma_aluno VALUES (4, 231);
INSERT INTO public.turma_aluno VALUES (4, 232);
INSERT INTO public.turma_aluno VALUES (4, 233);
INSERT INTO public.turma_aluno VALUES (4, 234);
INSERT INTO public.turma_aluno VALUES (4, 235);
INSERT INTO public.turma_aluno VALUES (4, 236);
INSERT INTO public.turma_aluno VALUES (5, 209);
INSERT INTO public.turma_aluno VALUES (5, 210);
INSERT INTO public.turma_aluno VALUES (5, 211);
INSERT INTO public.turma_aluno VALUES (5, 212);
INSERT INTO public.turma_aluno VALUES (5, 213);
INSERT INTO public.turma_aluno VALUES (5, 214);
INSERT INTO public.turma_aluno VALUES (5, 215);
INSERT INTO public.turma_aluno VALUES (5, 216);
INSERT INTO public.turma_aluno VALUES (5, 217);
INSERT INTO public.turma_aluno VALUES (5, 218);
INSERT INTO public.turma_aluno VALUES (5, 219);
INSERT INTO public.turma_aluno VALUES (5, 220);
INSERT INTO public.turma_aluno VALUES (5, 221);
INSERT INTO public.turma_aluno VALUES (5, 222);
INSERT INTO public.turma_aluno VALUES (5, 223);
INSERT INTO public.turma_aluno VALUES (5, 224);
INSERT INTO public.turma_aluno VALUES (5, 225);
INSERT INTO public.turma_aluno VALUES (5, 226);
INSERT INTO public.turma_aluno VALUES (5, 227);
INSERT INTO public.turma_aluno VALUES (5, 228);
INSERT INTO public.turma_aluno VALUES (5, 229);
INSERT INTO public.turma_aluno VALUES (5, 230);
INSERT INTO public.turma_aluno VALUES (5, 231);
INSERT INTO public.turma_aluno VALUES (5, 232);
INSERT INTO public.turma_aluno VALUES (5, 233);
INSERT INTO public.turma_aluno VALUES (5, 234);
INSERT INTO public.turma_aluno VALUES (5, 235);
INSERT INTO public.turma_aluno VALUES (5, 236);


--
-- TOC entry 4940 (class 0 OID 16634)
-- Dependencies: 231
-- Data for Name: turma_professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turma_professor VALUES (1, 2);
INSERT INTO public.turma_professor VALUES (2, 13);
INSERT INTO public.turma_professor VALUES (3, 15);
INSERT INTO public.turma_professor VALUES (4, 2);
INSERT INTO public.turma_professor VALUES (5, 8);


--
-- TOC entry 4929 (class 0 OID 16546)
-- Dependencies: 220
-- Data for Name: turmas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turmas VALUES (1, '2023/1', 'F301', 20);
INSERT INTO public.turmas VALUES (2, '2023/1', 'F305', 21);
INSERT INTO public.turmas VALUES (3, '2023/1', 'F204', 13);
INSERT INTO public.turmas VALUES (4, '2023/1', 'F101', 1);
INSERT INTO public.turmas VALUES (5, '2023/1', 'F201', 14);


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 225
-- Name: alunos_id_aluno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_aluno_seq', 285, true);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 227
-- Name: atividades_id_atividade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atividades_id_atividade_seq', 15, true);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 215
-- Name: cursos_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_curso_seq', 2, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 221
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_departamento_seq', 2, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 217
-- Name: disciplinas_id_disciplina_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplinas_id_disciplina_seq', 40, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 223
-- Name: professores_id_professor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professores_id_professor_seq', 15, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 219
-- Name: turmas_id_turma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turmas_id_turma_seq', 5, true);


--
-- TOC entry 4755 (class 2606 OID 16586)
-- Name: alunos alunos_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_cpf_key UNIQUE (cpf);


--
-- TOC entry 4757 (class 2606 OID 16584)
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id_aluno);


--
-- TOC entry 4767 (class 2606 OID 16672)
-- Name: atividade_aluno atividade_aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade_aluno
    ADD CONSTRAINT atividade_aluno_pkey PRIMARY KEY (id_atividade, id_aluno);


--
-- TOC entry 4759 (class 2606 OID 16598)
-- Name: atividades atividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY (id_atividade);


--
-- TOC entry 4761 (class 2606 OID 16608)
-- Name: cursos_disciplinas cursos_disciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_disciplinas
    ADD CONSTRAINT cursos_disciplinas_pkey PRIMARY KEY (id_curso, id_disciplina);


--
-- TOC entry 4743 (class 2606 OID 16537)
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 4749 (class 2606 OID 16563)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento);


--
-- TOC entry 4745 (class 2606 OID 16544)
-- Name: disciplinas disciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT disciplinas_pkey PRIMARY KEY (id_disciplina);


--
-- TOC entry 4751 (class 2606 OID 16572)
-- Name: professores professores_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_cpf_key UNIQUE (cpf);


--
-- TOC entry 4753 (class 2606 OID 16570)
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id_professor);


--
-- TOC entry 4763 (class 2606 OID 16623)
-- Name: turma_aluno turma_aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_aluno
    ADD CONSTRAINT turma_aluno_pkey PRIMARY KEY (id_turma, id_aluno);


--
-- TOC entry 4765 (class 2606 OID 16638)
-- Name: turma_professor turma_professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_professor
    ADD CONSTRAINT turma_professor_pkey PRIMARY KEY (id_turma, id_professor);


--
-- TOC entry 4747 (class 2606 OID 16551)
-- Name: turmas turmas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_pkey PRIMARY KEY (id_turma);


--
-- TOC entry 4770 (class 2606 OID 16587)
-- Name: alunos alunos_fk_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_fk_curso_fkey FOREIGN KEY (fk_curso) REFERENCES public.cursos(id_curso);


--
-- TOC entry 4779 (class 2606 OID 16678)
-- Name: atividade_aluno atividade_aluno_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade_aluno
    ADD CONSTRAINT atividade_aluno_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.alunos(id_aluno);


--
-- TOC entry 4780 (class 2606 OID 16673)
-- Name: atividade_aluno atividade_aluno_id_atividade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade_aluno
    ADD CONSTRAINT atividade_aluno_id_atividade_fkey FOREIGN KEY (id_atividade) REFERENCES public.atividades(id_atividade);


--
-- TOC entry 4771 (class 2606 OID 16599)
-- Name: atividades atividades_fk_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_fk_professor_fkey FOREIGN KEY (fk_professor) REFERENCES public.professores(id_professor);


--
-- TOC entry 4772 (class 2606 OID 16694)
-- Name: atividades atividades_turmas_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_turmas_fk FOREIGN KEY (fk_turma) REFERENCES public.turmas(id_turma);


--
-- TOC entry 4773 (class 2606 OID 16609)
-- Name: cursos_disciplinas cursos_disciplinas_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_disciplinas
    ADD CONSTRAINT cursos_disciplinas_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- TOC entry 4774 (class 2606 OID 16614)
-- Name: cursos_disciplinas cursos_disciplinas_id_disciplina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_disciplinas
    ADD CONSTRAINT cursos_disciplinas_id_disciplina_fkey FOREIGN KEY (id_disciplina) REFERENCES public.disciplinas(id_disciplina);


--
-- TOC entry 4769 (class 2606 OID 16573)
-- Name: professores professores_fk_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_fk_departamento_fkey FOREIGN KEY (fk_departamento) REFERENCES public.departamentos(id_departamento);


--
-- TOC entry 4775 (class 2606 OID 16629)
-- Name: turma_aluno turma_aluno_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_aluno
    ADD CONSTRAINT turma_aluno_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.alunos(id_aluno);


--
-- TOC entry 4776 (class 2606 OID 16624)
-- Name: turma_aluno turma_aluno_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_aluno
    ADD CONSTRAINT turma_aluno_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id_turma);


--
-- TOC entry 4777 (class 2606 OID 16644)
-- Name: turma_professor turma_professor_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_professor
    ADD CONSTRAINT turma_professor_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.professores(id_professor);


--
-- TOC entry 4778 (class 2606 OID 16639)
-- Name: turma_professor turma_professor_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_professor
    ADD CONSTRAINT turma_professor_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id_turma);


--
-- TOC entry 4768 (class 2606 OID 16552)
-- Name: turmas turmas_fk_disciplina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_fk_disciplina_fkey FOREIGN KEY (fk_disciplina) REFERENCES public.disciplinas(id_disciplina);


-- Completed on 2024-04-07 22:49:55

--
-- PostgreSQL database dump complete
--

