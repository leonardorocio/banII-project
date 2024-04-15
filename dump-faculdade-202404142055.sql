--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-14 20:55:05

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
-- TOC entry 4958 (class 1262 OID 16530)
-- Name: faculdade; Type: DATABASE; Schema: -; Owner: postgres
--


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
-- TOC entry 4960 (class 0 OID 0)
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
    descricao_atividade character varying(255),
    dt_entrega date,
    fk_professor integer NOT NULL,
    fk_turma integer DEFAULT 1 NOT NULL,
    fk_tipo_atividade integer NOT NULL
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
-- TOC entry 4961 (class 0 OID 0)
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
-- TOC entry 4962 (class 0 OID 0)
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
-- TOC entry 4963 (class 0 OID 0)
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
-- TOC entry 4964 (class 0 OID 0)
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
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 223
-- Name: professores_id_professor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professores_id_professor_seq OWNED BY public.professores.id_professor;


--
-- TOC entry 234 (class 1259 OID 16922)
-- Name: tipo_atividade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_atividade (
    id_tipo_atividade integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE public.tipo_atividade OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16921)
-- Name: tipo_atividade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_atividade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_atividade_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_atividade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_atividade_id_seq OWNED BY public.tipo_atividade.id_tipo_atividade;


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
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 219
-- Name: turmas_id_turma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.turmas_id_turma_seq OWNED BY public.turmas.id_turma;


--
-- TOC entry 4744 (class 2604 OID 16582)
-- Name: alunos id_aluno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id_aluno SET DEFAULT nextval('public.alunos_id_aluno_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 16596)
-- Name: atividades id_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades ALTER COLUMN id_atividade SET DEFAULT nextval('public.atividades_id_atividade_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16535)
-- Name: cursos id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id_curso SET DEFAULT nextval('public.cursos_id_curso_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16561)
-- Name: departamentos id_departamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamentos_id_departamento_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16542)
-- Name: disciplinas id_disciplina; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas ALTER COLUMN id_disciplina SET DEFAULT nextval('public.disciplinas_id_disciplina_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 16568)
-- Name: professores id_professor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores ALTER COLUMN id_professor SET DEFAULT nextval('public.professores_id_professor_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16925)
-- Name: tipo_atividade id_tipo_atividade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_atividade ALTER COLUMN id_tipo_atividade SET DEFAULT nextval('public.tipo_atividade_id_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 16549)
-- Name: turmas id_turma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas ALTER COLUMN id_turma SET DEFAULT nextval('public.turmas_id_turma_seq'::regclass);


--
-- TOC entry 4944 (class 0 OID 16579)
-- Dependencies: 226
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alunos VALUES (14, 'Leticia', 'de Lima', '2003-05-01', '121.212.121-21', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (5, 'Raul', 'Oliveira', '2002-04-20', '333.333.333-33', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (17, 'Phil', 'Pinto', '2002-12-30', '151.515.151-51', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (7, 'Andreas', 'Iniesta', '2002-07-05', '555.555.555-55', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (26, 'Amanda', 'Nunes', '2002-10-30', '202.956.010-91', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (16, 'Ana', 'Mendes', '2003-06-20', '141.414.141-41', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (3, 'Lucas', 'Silva', '2003-05-10', '111.111.111-11', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (23, 'Alisson', 'Becker', '2003-01-17', '427.191.210-83', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (4, 'Ana', 'Santos', '2002-08-15', '222.222.222-22', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (48, 'Anthony', 'Silveira', '2003-06-30', '217.479.580-77', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (30, 'Viviana', 'Santana', '2002-11-10', '584.882.250-55', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (58, 'Antonella', 'Ferreira', '2002-11-12', '274.965.860-09', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (52, 'Bianca', 'Rodrigues', '2002-08-12', '510.528.870-05', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (47, 'Bárbara', 'Fagundes', '2002-11-15', '547.028.270-83', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (39, 'Camilli', 'Costa', '2002-07-01', '957.064.030-06', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (10, 'Carolina', 'Pereira', '2003-03-25', '888.888.888-88', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (20, 'Carolini', 'Cavalcanti', '2002-04-22', '677.211.453-02', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (55, 'Darwin', 'Oliveira', '2003-04-05', '463.946.240-66', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (6, 'Mariana', 'Rodrigues', '2003-02-28', '444.444.444-44', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (11, 'Mateus', 'Martins', '2002-10-31', '999.999.999-99', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (15, 'Nathan', 'Rocha', '2002-11-10', '131.313.131-31', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (18, 'Luana', 'Sousa', '2003-05-12', '022.778.850-24', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (21, 'Leonardo', 'Melo', '2003-03-01', '720.529.617-70', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (24, 'Natália', 'Gonçalves', '2002-06-21', '690.933.280-09', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (25, 'Vinícius', 'Alves', '2003-04-01', '032.336.430-44', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (27, 'Matheus', 'Barbosa', '2003-05-15', '440.850.150-44', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (31, 'Diego', 'Fernandez', '2003-06-20', '301.149.880-03', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (38, 'Rafaelo', 'Ferreira', '2003-01-25', '488.498.300-93', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (46, 'Pedro', 'Oliveira', '2003-05-01', '954.878.930-95', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (13, 'Gabriel', 'Lima', '2002-09-22', '111.111.111-12', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (33, 'Gabrielli', 'Pereira', '2003-07-05', '145.736.460-00', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (49, 'Giovana', 'Pereira', '2003-01-05', '350.924.400-49', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (19, 'Guilherme', 'Fernandes', '2002-08-18', '288.987.920-77', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (59, 'Adrian', 'Melo', '2003-06-25', '739.503.310-66', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (9, 'Jordan', 'Gomes', '2002-06-20', '777.777.777-77', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (44, 'Gustavo', 'Carvalho', '2003-04-20', '693.861.130-20', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (36, 'Isaac', 'Moraes', '2002-12-10', '092.734.880-45', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (8, 'Julia', 'Costa', '2003-01-15', '666.666.666-66', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (12, 'Lara', 'Ferreira', '2003-04-15', '101.010.101-01', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (37, 'Juliana', 'Alayo', '2003-09-15', '565.820.170-08', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (62, 'Aurora', 'Santos', '2003-02-28', '104.327.010-06', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (28, 'Ana Clara', 'Valentin', '2002-09-20', '643.761.430-73', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (56, 'Emanuely', 'Valentim', '2002-10-01', '742.938.290-40', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (45, 'Isabel', 'Almeida', '2002-10-10', '046.876.420-95', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (50, 'Pérola', 'Pinto', '2002-07-20', '819.161.880-60', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (40, 'Marcos Paulo', 'Sousa', '2003-02-12', '033.280.680-82', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (35, 'Hermione', 'Granger', '2003-08-01', '904.187.560-55', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (29, 'José', 'Campos', '2003-05-01', '273.918.270-09', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (43, 'Júlia', 'Barroso', '2002-09-05', '366.220.530-50', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (53, 'Gabriel', 'Jesus', '2003-03-18', '889.738.020-71', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (54, 'Serena', 'Willians', '2002-09-20', '189.635.080-80', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (22, 'Larissa', 'Lima', '2002-07-07', '783.285.113-38', 'F', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (34, 'Rafael', 'Cardoso', '2002-11-22', '867.791.460-42', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (41, 'Letícia', 'Silva', '2002-08-22', '713.209.080-05', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (42, 'Thiago', 'Gonçalves', '2003-03-03', '185.421.380-69', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (51, 'Lucas', 'Fernandes', '2003-02-25', '003.856.810-33', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (94, 'Ana Luiza', 'Silva', '2003-08-22', '713.209.083-05', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (104, 'Francisco', 'Fernandes', '2003-02-25', '003.856.813-33', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (116, 'Cauã', 'Oliveira', '2002-08-10', '876.329.893-82', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (74, 'Yan', 'Melo', '2003-03-01', '720.529.627-70', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (103, 'Elis', 'Pomposo', '2002-07-20', '819.161.883-60', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (61, 'Renato', 'Barros', '2002-07-15', '920.864.220-85', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (71, 'Maria', 'Silva', '2003-07-12', '880.228.850-24', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (72, 'Ricardo', 'Fernandes', '2003-08-18', '158.987.920-77', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (93, 'Marcos', 'Sousa Silva', '2004-02-12', '033.280.683-82', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (75, 'Mariana', 'Lima', '2003-07-07', '783.285.123-38', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (113, 'Mariana', 'Malfoy', '2003-01-10', '457.832.483-80', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (88, 'Lavínia', 'Gomes', '2004-08-01', '904.187.563-05', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (123, 'Mariana', 'Weasley', '2003-06-20', '088.398.303-93', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (76, 'Matheus', 'Rocha', '2003-01-17', '427.191.213-83', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (60, 'Alícia', 'Gomes', '2003-01-10', '457.832.480-80', 'F', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (78, 'Thiago', 'Alves', '2003-04-01', '032.336.434-04', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (87, 'Oliver', 'Giroud', '2003-11-22', '867.791.463-42', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (102, 'Alice', 'Silveira', '2003-01-05', '350.924.403-49', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (85, 'Tatiane', 'Oliveira', '2003-12-30', '825.989.013-01', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (122, 'Xabi', 'Alonso', '2002-11-10', '700.620.173-08', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (106, 'Ricardo', 'Busquest', '2003-03-18', '889.738.023-71', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (32, 'Josué', 'Hass', '2002-12-30', '825.989.010-01', 'M', '2022-01-01', 1);
INSERT INTO public.alunos VALUES (95, 'Frank', 'Ribbery', '2004-03-03', '185.421.383-09', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (57, 'Roberto ', 'Firmino', '2003-05-22', '017.592.090-96', 'M', '2022-07-01', 1);
INSERT INTO public.alunos VALUES (118, 'Mohamed', 'Salah', '2002-09-20', '127.682.073-92', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (98, 'Luiza', 'Almeida', '2003-10-10', '046.876.423-45', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (107, 'Vanessa', 'Lima', '2002-09-20', '189.635.083-80', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (110, 'Thiago', 'Sousa', '2003-05-22', '017.592.093-96', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (114, 'Renato', 'Barros', '2002-07-15', '920.864.223-85', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (96, 'Ana', 'Melo', '2003-09-05', '366.220.533-50', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (148, 'Ana', 'Barros', '2003-09-15', '565.820.110-08', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (105, 'Beatriz', 'Rodrigues', '2002-08-12', '510.528.873-05', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (186, 'Aline', 'Silva', '2002-10-01', '742.938.299-40', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (82, 'José', 'Hass', '2003-05-01', '273.918.274-09', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (136, 'Beatriz', 'Alves', '2003-04-01', '032.338.430-44', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (119, 'Júlia Gabriela', 'Santos', '2003-04-15', '685.072.363-06', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (83, 'Bianca', 'Santana', '2003-11-10', '584.882.253-05', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (130, 'Patricia', 'Fernandes', '2002-08-18', '288.987.920-71', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (131, 'Raul', 'Cavalcanti', '2002-04-22', '627.211.453-02', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (90, 'Esther', 'Barros', '2004-09-15', '565.820.173-08', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (115, 'Juliana', 'Rócio', '2003-02-28', '104.327.013-06', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (109, 'Jade', 'Silva', '2002-10-01', '742.938.293-40', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (132, 'Luciana', 'Melo', '2003-02-28', '720.549.617-70', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (133, 'Marcelo', 'Lima', '2002-07-07', '783.255.113-38', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (215, 'Otávio', 'Gonçalves', '2003-06-21', '690.733.283-09', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (193, 'Oliver', 'da Costa Silveira', '2002-08-10', '876.328.890-82', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (141, 'Kael', 'Santana', '2002-11-10', '584.883.250-55', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (144, 'Isadora', 'Pereira', '2003-07-05', '147.736.460-00', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (190, 'Gina', 'Gomes', '2003-01-10', '457.832.580-80', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (134, 'Patrícia', 'Rocha', '2003-01-17', '426.191.210-83', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (135, 'Ricardo', 'Gonçalves', '2002-06-21', '670.933.280-09', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (139, 'Renan', 'Correia', '2002-09-20', '643.711.430-73', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (147, 'Pedro', 'Moraes', '2002-12-10', '092.730.880-45', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (149, 'Rafaela', 'Ferreira', '2003-01-25', '428.498.300-93', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (152, 'Thiago', 'Silva', '2002-08-22', '713.205.080-05', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (155, 'Bruna', 'Carvalho', '2003-04-20', '693.881.130-20', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (80, 'Bruno', 'Barbosa', '2003-05-15', '440.850.154.04', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (100, 'Bárbara', 'Nascimento', '2004-01-12', '547.028.273-05', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (138, 'Camila', 'Dias', '2003-05-15', '440.800.150-44', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (92, 'Camila', 'Costa', '2003-07-01', '957.064.033-08', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (157, 'Carla', 'Vasconcellos', '2003-05-01', '954.808.930-95', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (128, 'Carlos', 'Silva', '2003-05-12', '052.778.850-24', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (121, 'Carolina', 'Gonçalves', '2003-05-01', '950.246.033-06', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (111, 'Caroline', 'Ferreira', '2002-11-12', '274.965.863-09', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (99, 'Cristian', 'Oliveira', '2004-05-01', '954.878.933-00', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (101, 'Eduardo', 'Barbosa', '2003-06-30', '217.479.583-77', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (142, 'Elisa', 'Cruz', '2003-06-20', '301.159.880-03', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (137, 'João Miguel', 'Nunes', '2002-10-30', '202.956.910-91', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (143, 'Felipo', 'Cardoso', '2002-12-30', '825.689.010-01', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (91, 'Fernando', 'Ferreira', '2004-01-25', '488.498.303-93', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (120, 'Gabriel', 'Ferreira', '2002-10-30', '230.927.303-93', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (89, 'Ravi', 'Moraes', '2003-12-10', '092.734.883-45', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (153, 'Vita', 'Gonçalves', '2003-03-03', '685.421.380-69', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (86, 'Gabriela', 'Gonçalves', '2004-07-05', '145.736.463-00', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (77, 'Maitê', 'Gonçalves', '2003-06-21', '690.933.283-09', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (150, 'Giovanni', 'Costa', '2002-07-01', '957.364.030-06', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (112, 'Bryan', 'Melo', '2003-06-25', '739.503.313-66', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (84, 'Théo', 'Cruz', '2003-06-20', '301.149.883-03', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (156, 'Noah', 'Almeida', '2002-10-10', '046.879.420-95', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (108, 'Samuel', 'Oliveira', '2003-04-05', '463.946.243-66', 'M', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (97, 'Gustavo', 'Torres', '2004-04-20', '693.861.133-00', 'M', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (73, 'Isabela', 'Cavalcanti', '2003-04-22', '677.211.483-02', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (117, 'Isabella', 'Silva', '2003-03-05', '403.789.783-47', 'F', '2023-07-01', 1);
INSERT INTO public.alunos VALUES (146, 'Laura', 'Gomes', '2003-08-01', '904.187.960-55', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (81, 'Laura', 'Correia', '2003-09-20', '643.761.434-73', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (224, 'Aline', 'Pereira', '2004-07-05', '145.739.463-00', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (226, 'Amanda', 'Gomes', '2004-08-01', '904.187.763-05', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (180, 'Viviane', 'Pinto', '2002-07-20', '819.161.280-60', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (187, 'Rodrigo', 'Sousa', '2003-05-22', '017.592.190-96', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (200, 'Mariana', 'Barbosa', '2003-06-20', '088.368.300-93', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (214, 'Ana', 'Rocha', '2003-01-17', '427.191.213-13', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (177, 'André', 'Nascimento', '2003-01-12', '547.628.270-83', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (235, 'Benjamin', 'Constant', '2004-04-20', '693.861.633-00', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (211, 'Bernardo', 'Cavalcanti', '2003-04-22', '647.211.483-02', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (271, 'Brenda', 'da Silva', '2002-10-01', '742.938.593-40', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (182, 'Bruna', 'Rodrigues', '2002-08-12', '510.558.870-05', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (223, 'Bruno', 'Oliveira', '2003-12-30', '825.919.013-01', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (228, 'Carol', 'Silveira', '2004-09-15', '565.820.175-08', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (210, 'Mariana', 'Fernandes', '2003-08-18', '188.987.920-77', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (213, 'Raul', 'Lima', '2003-07-07', '783.285.123-28', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (217, 'Vitor', 'Nunes', '2003-10-30', '202.956.073-91', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (219, 'Rodrigo', 'Correia', '2003-09-20', '643.561.434-73', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (220, 'Nathalia', 'Campos', '2003-05-01', '273.418.274-09', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (221, 'Luiz', 'Santana', '2003-11-10', '584.882.353-05', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (222, 'Cristina', 'Cruz', '2003-06-20', '301.142.883-03', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (233, 'Renato', 'Gonçalves', '2004-03-03', '188.421.383-09', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (234, 'Luiza', 'Melo', '2003-09-05', '366.220.537-50', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (216, 'Anna', 'Abbot', '2003-04-01', '032.336.834-04', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (140, 'Natasha', 'Romanoff', '2003-05-01', '272.918.270-09', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (212, 'Patricia', 'Rodrigo', '2003-03-01', '720.523.627-70', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (227, 'Ronaldo', 'Moraes', '2003-12-10', '092.734.683-45', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (229, 'Manuel', 'Neuer', '2004-01-25', '488.598.303-93', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (199, 'Alexandre', 'Francisco', '2002-11-10', '700.620.570-08', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (154, 'Sergio', 'Ramos', '2002-09-05', '366.220.530-70', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (191, 'Marcelo', 'Júnior', '2002-07-15', '920.864.620-85', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (179, 'Declan', 'Rice', '2003-02-05', '350.824.400-49', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (195, 'Joshua', 'Kimmich', '2002-09-20', '127.681.070-92', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (145, 'Arjen ', 'Robben', '2002-11-22', '867.891.460-42', 'M', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (151, 'Selena', 'Gomez', '2003-02-12', '033.240.680-82', 'F', '2022-01-01', 2);
INSERT INTO public.alunos VALUES (231, 'Vinicius', 'Júnior', '2004-02-12', '033.240.683-82', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (189, 'Valdemir', 'Melo', '2003-06-25', '739.503.410-66', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (183, 'Daniel', 'Santos', '2003-03-18', '889.738.620-71', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (264, 'Davi', 'Silveira', '2003-02-05', '340.924.403-49', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (269, 'Eloá', 'Costa', '2002-09-20', '189.635.093-80', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (218, 'Evelin', 'Barbosa', '2003-05-15', '446.850.154-04', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (181, 'Henry', 'Fernandes', '2003-02-25', '003.456.810-33', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (268, 'Felipe', 'Santos', '2003-03-18', '889.788.023-71', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (236, 'Fernanda', 'Almeida', '2003-10-10', '046.856.423-45', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (197, 'Davi', 'Ferreira', '2002-10-30', '230.327.300-93', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (270, 'Matteo', 'Oliveira', '2003-04-05', '443.946.243-66', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (185, 'Vicente', 'Oliveira', '2003-04-05', '463.846.240-66', 'M', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (225, 'Murilo', 'Cardoso', '2003-11-22', '867.891.463-42', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (230, 'Giovanna', 'Costa', '2003-07-01', '957.034.033-08', 'F', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (198, 'Isis', 'Gonçalves', '2003-05-01', '940.246.030-06', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (262, 'João', 'Nascimento', '2004-01-12', '567.028.273-05', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (209, 'João', 'Silva', '2003-07-12', '880.228.857-24', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (192, 'Juliana', 'Santos', '2003-02-28', '104.327.016-06', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (267, 'Viviane', 'Rodrigues', '2002-08-12', '710.528.873-05', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (278, 'Lucas', 'Oliveira', '2002-08-10', '876.529.893-82', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (79, 'Fernanda', 'Oliveira', '2003-10-30', '202.956.013-91', 'F', '2023-01-01', 1);
INSERT INTO public.alunos VALUES (282, 'Bento', 'Ferreira', '2002-10-30', '290.927.303-93', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (283, 'Heloisa', 'Gonçalves', '2003-05-01', '150.246.033-06', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (281, 'Julia', 'Santos', '2003-04-15', '685.078.363-06', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (184, 'Sarah', 'Lima', '2002-09-20', '189.635.070-80', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (279, 'Maria Cecília', 'Novara', '2003-03-05', '403.689.783-47', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (194, 'Isabella', 'Bernardi', '2003-03-05', '403.789.780-47', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (196, 'Julia', 'Camavinga', '2003-04-15', '685.072.320-06', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (277, 'Juliana', 'Hidalgo', '2003-02-28', '104.427.013-06', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (188, 'Clara', 'Ferreira', '2002-11-12', '274.963.860.09', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (273, 'Marina', 'Ferreira', '2002-11-12', '274.865.863-09', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (178, 'Maria Luísa', 'Rogers', '2002-06-30', '217.779.580-77', 'F', '2022-07-01', 2);
INSERT INTO public.alunos VALUES (263, 'Lauana', 'Stark', '2003-06-30', '237.479.583-77', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (275, 'Olívia', 'Gomes', '2003-01-10', '457.802.483-80', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (285, 'Luna', 'Barbosa', '2003-06-20', '088.598.303-93', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (265, 'Sasha', 'Pinto', '2002-07-20', '815.161.883-60', 'F', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (284, 'Raphael', 'Assis', '2002-11-10', '700.622.173-08', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (276, 'Renan', 'Cardoso', '2002-07-15', '920.834.223-85', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (266, 'Chico', 'Guardiola', '2003-02-25', '603.856.813-33', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (272, 'Gabriel', 'Magalhães', '2003-05-22', '017.572.093-96', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (232, 'Tathianna', 'Silva', '2003-08-22', '713.205.083-05', 'M', '2023-01-01', 2);
INSERT INTO public.alunos VALUES (280, 'Thiago', 'Alcantara', '2002-09-20', '127.782.073-92', 'M', '2023-07-01', 2);
INSERT INTO public.alunos VALUES (274, 'Valdecir', 'Melo', '2003-06-25', '739.593.313-66', 'M', '2023-07-01', 2);


--
-- TOC entry 4950 (class 0 OID 16666)
-- Dependencies: 232
-- Data for Name: atividade_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atividade_aluno VALUES (5, 209, 7.0);
INSERT INTO public.atividade_aluno VALUES (5, 210, 6.5);
INSERT INTO public.atividade_aluno VALUES (5, 216, 7.0);
INSERT INTO public.atividade_aluno VALUES (5, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (5, 220, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 222, 7.0);
INSERT INTO public.atividade_aluno VALUES (5, 223, 6.0);
INSERT INTO public.atividade_aluno VALUES (5, 225, 9.0);
INSERT INTO public.atividade_aluno VALUES (5, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (5, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (5, 229, 8.0);
INSERT INTO public.atividade_aluno VALUES (5, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (5, 232, 6.0);
INSERT INTO public.atividade_aluno VALUES (5, 233, 7.5);
INSERT INTO public.atividade_aluno VALUES (5, 234, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 236, 7.0);
INSERT INTO public.atividade_aluno VALUES (1, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 216, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 219, 9.0);
INSERT INTO public.atividade_aluno VALUES (1, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (1, 221, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 222, 6.0);
INSERT INTO public.atividade_aluno VALUES (1, 223, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 224, 7.0);
INSERT INTO public.atividade_aluno VALUES (1, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (1, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 229, 9.0);
INSERT INTO public.atividade_aluno VALUES (1, 230, 8.0);
INSERT INTO public.atividade_aluno VALUES (1, 232, 8.5);
INSERT INTO public.atividade_aluno VALUES (1, 233, 9.5);
INSERT INTO public.atividade_aluno VALUES (1, 235, 8.0);
INSERT INTO public.atividade_aluno VALUES (2, 210, 6.5);
INSERT INTO public.atividade_aluno VALUES (2, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (2, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (2, 218, 7.5);
INSERT INTO public.atividade_aluno VALUES (2, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (2, 221, 9.0);
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
INSERT INTO public.atividade_aluno VALUES (2, 236, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 216, 9.0);
INSERT INTO public.atividade_aluno VALUES (3, 219, 9.5);
INSERT INTO public.atividade_aluno VALUES (3, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (3, 221, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 223, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (3, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (3, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 229, 7.0);
INSERT INTO public.atividade_aluno VALUES (3, 231, 9.5);
INSERT INTO public.atividade_aluno VALUES (3, 233, 8.5);
INSERT INTO public.atividade_aluno VALUES (3, 234, 9.0);
INSERT INTO public.atividade_aluno VALUES (3, 236, 8.0);
INSERT INTO public.atividade_aluno VALUES (6, 211, 7.0);
INSERT INTO public.atividade_aluno VALUES (6, 212, 8.0);
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
INSERT INTO public.atividade_aluno VALUES (7, 215, 9.5);
INSERT INTO public.atividade_aluno VALUES (7, 216, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 218, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 220, 7.5);
INSERT INTO public.atividade_aluno VALUES (7, 221, 8.0);
INSERT INTO public.atividade_aluno VALUES (7, 222, 6.0);
INSERT INTO public.atividade_aluno VALUES (7, 223, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 224, 7.0);
INSERT INTO public.atividade_aluno VALUES (7, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (7, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 228, 6.5);
INSERT INTO public.atividade_aluno VALUES (7, 231, 7.0);
INSERT INTO public.atividade_aluno VALUES (7, 232, 8.5);
INSERT INTO public.atividade_aluno VALUES (7, 233, 9.5);
INSERT INTO public.atividade_aluno VALUES (7, 235, 8.0);
INSERT INTO public.atividade_aluno VALUES (4, 236, 6.5);
INSERT INTO public.atividade_aluno VALUES (7, 236, 6.5);
INSERT INTO public.atividade_aluno VALUES (8, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (8, 214, 8.5);
INSERT INTO public.atividade_aluno VALUES (8, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (8, 216, 7.0);
INSERT INTO public.atividade_aluno VALUES (8, 217, 8.0);
INSERT INTO public.atividade_aluno VALUES (8, 219, 6.5);
INSERT INTO public.atividade_aluno VALUES (8, 220, 8.5);
INSERT INTO public.atividade_aluno VALUES (8, 221, 9.0);
INSERT INTO public.atividade_aluno VALUES (2, 220, 4.5);
INSERT INTO public.atividade_aluno VALUES (2, 213, 7);
INSERT INTO public.atividade_aluno VALUES (5, 215, 8.8);
INSERT INTO public.atividade_aluno VALUES (5, 217, 4);
INSERT INTO public.atividade_aluno VALUES (5, 221, 1);
INSERT INTO public.atividade_aluno VALUES (5, 224, 4);
INSERT INTO public.atividade_aluno VALUES (5, 230, 4.65);
INSERT INTO public.atividade_aluno VALUES (1, 213, 6.9);
INSERT INTO public.atividade_aluno VALUES (1, 215, 4.28);
INSERT INTO public.atividade_aluno VALUES (1, 218, 5.89);
INSERT INTO public.atividade_aluno VALUES (1, 225, 5.7);
INSERT INTO public.atividade_aluno VALUES (1, 228, 3.7);
INSERT INTO public.atividade_aluno VALUES (1, 231, 2.3);
INSERT INTO public.atividade_aluno VALUES (1, 234, 9.8);
INSERT INTO public.atividade_aluno VALUES (1, 236, 8.8);
INSERT INTO public.atividade_aluno VALUES (2, 209, 7.8);
INSERT INTO public.atividade_aluno VALUES (2, 214, 2);
INSERT INTO public.atividade_aluno VALUES (2, 216, 8.3);
INSERT INTO public.atividade_aluno VALUES (2, 217, 4);
INSERT INTO public.atividade_aluno VALUES (2, 222, 7.8);
INSERT INTO public.atividade_aluno VALUES (2, 235, 4.5);
INSERT INTO public.atividade_aluno VALUES (3, 210, 9.9);
INSERT INTO public.atividade_aluno VALUES (1, 214, 5.6);
INSERT INTO public.atividade_aluno VALUES (3, 215, 7.7);
INSERT INTO public.atividade_aluno VALUES (3, 218, 4.5);
INSERT INTO public.atividade_aluno VALUES (3, 222, 6.7);
INSERT INTO public.atividade_aluno VALUES (3, 228, 10);
INSERT INTO public.atividade_aluno VALUES (3, 230, 8.8);
INSERT INTO public.atividade_aluno VALUES (3, 232, 4.6);
INSERT INTO public.atividade_aluno VALUES (3, 235, 10);
INSERT INTO public.atividade_aluno VALUES (6, 209, 8);
INSERT INTO public.atividade_aluno VALUES (6, 210, 7);
INSERT INTO public.atividade_aluno VALUES (6, 213, 3.3);
INSERT INTO public.atividade_aluno VALUES (5, 213, 4.3);
INSERT INTO public.atividade_aluno VALUES (7, 217, 8.9);
INSERT INTO public.atividade_aluno VALUES (7, 219, 9.6);
INSERT INTO public.atividade_aluno VALUES (7, 229, 6.5);
INSERT INTO public.atividade_aluno VALUES (7, 230, 8);
INSERT INTO public.atividade_aluno VALUES (7, 234, 4.79);
INSERT INTO public.atividade_aluno VALUES (8, 209, 8.5);
INSERT INTO public.atividade_aluno VALUES (5, 218, 4);
INSERT INTO public.atividade_aluno VALUES (8, 218, 9.0);
INSERT INTO public.atividade_aluno VALUES (1, 217, 7.8);
INSERT INTO public.atividade_aluno VALUES (3, 217, 6.7);
INSERT INTO public.atividade_aluno VALUES (3, 214, 2.3);
INSERT INTO public.atividade_aluno VALUES (7, 214, 8.9);
INSERT INTO public.atividade_aluno VALUES (3, 213, 7.8);
INSERT INTO public.atividade_aluno VALUES (8, 213, 4);
INSERT INTO public.atividade_aluno VALUES (7, 213, 5.6);
INSERT INTO public.atividade_aluno VALUES (3, 212, 5);
INSERT INTO public.atividade_aluno VALUES (1, 212, 4);
INSERT INTO public.atividade_aluno VALUES (5, 211, 1);
INSERT INTO public.atividade_aluno VALUES (1, 211, 3);
INSERT INTO public.atividade_aluno VALUES (8, 211, 5);
INSERT INTO public.atividade_aluno VALUES (3, 211, 4);
INSERT INTO public.atividade_aluno VALUES (8, 210, 3);
INSERT INTO public.atividade_aluno VALUES (8, 222, 7.0);
INSERT INTO public.atividade_aluno VALUES (8, 224, 8.0);
INSERT INTO public.atividade_aluno VALUES (8, 225, 9.0);
INSERT INTO public.atividade_aluno VALUES (8, 226, 7.5);
INSERT INTO public.atividade_aluno VALUES (8, 227, 8.5);
INSERT INTO public.atividade_aluno VALUES (8, 228, 6.5);
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
INSERT INTO public.atividade_aluno VALUES (10, 210, 7.0);
INSERT INTO public.atividade_aluno VALUES (10, 212, 6.5);
INSERT INTO public.atividade_aluno VALUES (10, 214, 7.5);
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
INSERT INTO public.atividade_aluno VALUES (12, 215, 8.5);
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
INSERT INTO public.atividade_aluno VALUES (13, 210, 7.0);
INSERT INTO public.atividade_aluno VALUES (13, 211, 9.0);
INSERT INTO public.atividade_aluno VALUES (13, 213, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 214, 7.5);
INSERT INTO public.atividade_aluno VALUES (13, 215, 9.5);
INSERT INTO public.atividade_aluno VALUES (13, 216, 8.0);
INSERT INTO public.atividade_aluno VALUES (13, 217, 7.0);
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
INSERT INTO public.atividade_aluno VALUES (14, 216, 9.0);
INSERT INTO public.atividade_aluno VALUES (14, 217, 7.0);
INSERT INTO public.atividade_aluno VALUES (14, 218, 8.0);
INSERT INTO public.atividade_aluno VALUES (14, 219, 9.5);
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
INSERT INTO public.atividade_aluno VALUES (14, 220, 7);
INSERT INTO public.atividade_aluno VALUES (8, 229, 4);
INSERT INTO public.atividade_aluno VALUES (13, 218, 5.6);
INSERT INTO public.atividade_aluno VALUES (9, 217, 1.2);
INSERT INTO public.atividade_aluno VALUES (10, 217, 7.8);
INSERT INTO public.atividade_aluno VALUES (10, 216, 3.2);
INSERT INTO public.atividade_aluno VALUES (12, 216, 4.5);
INSERT INTO public.atividade_aluno VALUES (14, 215, 3.4);
INSERT INTO public.atividade_aluno VALUES (12, 214, 4.5);
INSERT INTO public.atividade_aluno VALUES (14, 214, 1.3);
INSERT INTO public.atividade_aluno VALUES (14, 213, 5.6);
INSERT INTO public.atividade_aluno VALUES (10, 213, 4);
INSERT INTO public.atividade_aluno VALUES (13, 212, 3);
INSERT INTO public.atividade_aluno VALUES (10, 211, 8);
INSERT INTO public.atividade_aluno VALUES (15, 210, 4);
INSERT INTO public.atividade_aluno VALUES (13, 209, 6.5);
INSERT INTO public.atividade_aluno VALUES (10, 209, 4);
INSERT INTO public.atividade_aluno VALUES (15, 211, 8.0);
INSERT INTO public.atividade_aluno VALUES (15, 212, 7.5);
INSERT INTO public.atividade_aluno VALUES (15, 213, 9.0);
INSERT INTO public.atividade_aluno VALUES (15, 214, 8.5);
INSERT INTO public.atividade_aluno VALUES (15, 215, 6.0);
INSERT INTO public.atividade_aluno VALUES (15, 217, 8.0);
INSERT INTO public.atividade_aluno VALUES (15, 218, 7.5);
INSERT INTO public.atividade_aluno VALUES (15, 219, 6.5);
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
INSERT INTO public.atividade_aluno VALUES (5, 212, 4.5);
INSERT INTO public.atividade_aluno VALUES (5, 235, 10);
INSERT INTO public.atividade_aluno VALUES (2, 211, 5.3);
INSERT INTO public.atividade_aluno VALUES (3, 225, 4.5);
INSERT INTO public.atividade_aluno VALUES (7, 225, 4.9);
INSERT INTO public.atividade_aluno VALUES (8, 223, 4);
INSERT INTO public.atividade_aluno VALUES (15, 220, 6.7);
INSERT INTO public.atividade_aluno VALUES (15, 216, 5.6);
INSERT INTO public.atividade_aluno VALUES (10, 215, 5.6);
INSERT INTO public.atividade_aluno VALUES (5, 214, 3.7);
INSERT INTO public.atividade_aluno VALUES (1, 210, 1);


--
-- TOC entry 4946 (class 0 OID 16593)
-- Dependencies: 228
-- Data for Name: atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atividades VALUES (1, 'Trabalho de pesquisa sobre a história da computação', '2023-04-15', 15, 3, 2);
INSERT INTO public.atividades VALUES (3, 'Desenvolvimento de um trabalho prático utilizando algoritmos simples', '2023-06-05', 15, 3, 2);
INSERT INTO public.atividades VALUES (4, 'Desenvolvimento de um site estático utilizando HTML, CSS e JavaScrip', '2023-04-20', 13, 2, 2);
INSERT INTO public.atividades VALUES (6, 'Desenvolvimento de um blog dinâmico com CRUD em PHP e MySQL', '2023-06-10', 13, 2, 2);
INSERT INTO public.atividades VALUES (5, 'Implementação de um sistema de login utilizando Node.js e Express', '2023-05-15', 13, 2, 2);
INSERT INTO public.atividades VALUES (8, 'Trabalho sobre álgebra booleana e circuitos lógico', '2023-05-25', 2, 4, 2);
INSERT INTO public.atividades VALUES (9, 'Apresentação sobre grafos e suas aplicações', '2023-06-20', 2, 4, 2);
INSERT INTO public.atividades VALUES (15, 'Trabalho prático de desenvolvimento de algoritmos', '2023-06-25', 2, 1, 2);
INSERT INTO public.atividades VALUES (2, 'Prova teórica sobre conceitos básicos de computação', '2023-05-10', 15, 3, 1);
INSERT INTO public.atividades VALUES (7, 'TProva sobre conjuntos, relações e funções', '2023-05-01', 2, 4, 1);
INSERT INTO public.atividades VALUES (10, 'Prova sobre limites e derivadas', '2023-05-05', 8, 5, 1);
INSERT INTO public.atividades VALUES (11, 'Prova sobre integrais definidas', '2023-05-30', 8, 5, 1);
INSERT INTO public.atividades VALUES (12, 'Apresentação sobre aplicações da derivada', '2023-06-25', 8, 5, 1);
INSERT INTO public.atividades VALUES (13, 'Prova sobre estruturas de controle', '2023-04-05', 2, 1, 1);
INSERT INTO public.atividades VALUES (14, 'Prova sobre arrays e funções', '2023-05-30', 2, 1, 1);


--
-- TOC entry 4934 (class 0 OID 16532)
-- Dependencies: 216
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos VALUES (1, 'Bacharelado em Ciência da Computação', 9, 14, 'BCC');
INSERT INTO public.cursos VALUES (2, 'Tecnologia em Análise e Desenvolvimento de Sistemas', 6, 10, 'TADS');


--
-- TOC entry 4947 (class 0 OID 16604)
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
-- TOC entry 4940 (class 0 OID 16558)
-- Dependencies: 222
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos VALUES (2, 'Departamento de Matemática', 'DMAT');
INSERT INTO public.departamentos VALUES (1, 'Departamento de Ciência da Computação', 'DCC');


--
-- TOC entry 4936 (class 0 OID 16539)
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
-- TOC entry 4942 (class 0 OID 16565)
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
-- TOC entry 4952 (class 0 OID 16922)
-- Dependencies: 234
-- Data for Name: tipo_atividade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_atividade VALUES (1, 'Prova');
INSERT INTO public.tipo_atividade VALUES (2, 'Trabalho');


--
-- TOC entry 4948 (class 0 OID 16619)
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
-- TOC entry 4949 (class 0 OID 16634)
-- Dependencies: 231
-- Data for Name: turma_professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turma_professor VALUES (1, 2);
INSERT INTO public.turma_professor VALUES (2, 13);
INSERT INTO public.turma_professor VALUES (3, 15);
INSERT INTO public.turma_professor VALUES (4, 2);
INSERT INTO public.turma_professor VALUES (5, 8);


--
-- TOC entry 4938 (class 0 OID 16546)
-- Dependencies: 220
-- Data for Name: turmas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turmas VALUES (1, '2023/1', 'F301', 20);
INSERT INTO public.turmas VALUES (2, '2023/1', 'F305', 21);
INSERT INTO public.turmas VALUES (3, '2023/1', 'F204', 13);
INSERT INTO public.turmas VALUES (4, '2023/1', 'F101', 1);
INSERT INTO public.turmas VALUES (5, '2023/1', 'F201', 14);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 225
-- Name: alunos_id_aluno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_aluno_seq', 285, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 227
-- Name: atividades_id_atividade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atividades_id_atividade_seq', 15, true);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 215
-- Name: cursos_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_curso_seq', 2, true);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 221
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_departamento_seq', 2, true);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 217
-- Name: disciplinas_id_disciplina_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplinas_id_disciplina_seq', 40, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 223
-- Name: professores_id_professor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professores_id_professor_seq', 15, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_atividade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_atividade_id_seq', 2, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 219
-- Name: turmas_id_turma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turmas_id_turma_seq', 6, true);


--
-- TOC entry 4761 (class 2606 OID 16586)
-- Name: alunos alunos_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_cpf_key UNIQUE (cpf);


--
-- TOC entry 4763 (class 2606 OID 16584)
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id_aluno);


--
-- TOC entry 4773 (class 2606 OID 16672)
-- Name: atividade_aluno atividade_aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade_aluno
    ADD CONSTRAINT atividade_aluno_pkey PRIMARY KEY (id_atividade, id_aluno);


--
-- TOC entry 4765 (class 2606 OID 16598)
-- Name: atividades atividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY (id_atividade);


--
-- TOC entry 4767 (class 2606 OID 16608)
-- Name: cursos_disciplinas cursos_disciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_disciplinas
    ADD CONSTRAINT cursos_disciplinas_pkey PRIMARY KEY (id_curso, id_disciplina);


--
-- TOC entry 4749 (class 2606 OID 16537)
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 4755 (class 2606 OID 16563)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento);


--
-- TOC entry 4751 (class 2606 OID 16544)
-- Name: disciplinas disciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT disciplinas_pkey PRIMARY KEY (id_disciplina);


--
-- TOC entry 4757 (class 2606 OID 16572)
-- Name: professores professores_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_cpf_key UNIQUE (cpf);


--
-- TOC entry 4759 (class 2606 OID 16570)
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id_professor);


--
-- TOC entry 4775 (class 2606 OID 16929)
-- Name: tipo_atividade tipo_atividade_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_atividade
    ADD CONSTRAINT tipo_atividade_pk PRIMARY KEY (id_tipo_atividade);


--
-- TOC entry 4769 (class 2606 OID 16623)
-- Name: turma_aluno turma_aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_aluno
    ADD CONSTRAINT turma_aluno_pkey PRIMARY KEY (id_turma, id_aluno);


--
-- TOC entry 4771 (class 2606 OID 16638)
-- Name: turma_professor turma_professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_professor
    ADD CONSTRAINT turma_professor_pkey PRIMARY KEY (id_turma, id_professor);


--
-- TOC entry 4753 (class 2606 OID 16551)
-- Name: turmas turmas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_pkey PRIMARY KEY (id_turma);


--
-- TOC entry 4778 (class 2606 OID 16587)
-- Name: alunos alunos_fk_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_fk_curso_fkey FOREIGN KEY (fk_curso) REFERENCES public.cursos(id_curso);


--
-- TOC entry 4788 (class 2606 OID 16749)
-- Name: atividade_aluno atividade_aluno_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade_aluno
    ADD CONSTRAINT atividade_aluno_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.alunos(id_aluno) ON DELETE CASCADE;


--
-- TOC entry 4789 (class 2606 OID 16754)
-- Name: atividade_aluno atividade_aluno_id_atividade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividade_aluno
    ADD CONSTRAINT atividade_aluno_id_atividade_fkey FOREIGN KEY (id_atividade) REFERENCES public.atividades(id_atividade) ON DELETE CASCADE;


--
-- TOC entry 4779 (class 2606 OID 16599)
-- Name: atividades atividades_fk_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_fk_professor_fkey FOREIGN KEY (fk_professor) REFERENCES public.professores(id_professor);


--
-- TOC entry 4780 (class 2606 OID 16930)
-- Name: atividades atividades_tipo_atividade_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_tipo_atividade_fk FOREIGN KEY (fk_tipo_atividade) REFERENCES public.tipo_atividade(id_tipo_atividade);


--
-- TOC entry 4781 (class 2606 OID 16694)
-- Name: atividades atividades_turmas_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_turmas_fk FOREIGN KEY (fk_turma) REFERENCES public.turmas(id_turma);


--
-- TOC entry 4782 (class 2606 OID 16609)
-- Name: cursos_disciplinas cursos_disciplinas_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_disciplinas
    ADD CONSTRAINT cursos_disciplinas_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- TOC entry 4783 (class 2606 OID 16614)
-- Name: cursos_disciplinas cursos_disciplinas_id_disciplina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_disciplinas
    ADD CONSTRAINT cursos_disciplinas_id_disciplina_fkey FOREIGN KEY (id_disciplina) REFERENCES public.disciplinas(id_disciplina);


--
-- TOC entry 4777 (class 2606 OID 16573)
-- Name: professores professores_fk_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_fk_departamento_fkey FOREIGN KEY (fk_departamento) REFERENCES public.departamentos(id_departamento);


--
-- TOC entry 4784 (class 2606 OID 16759)
-- Name: turma_aluno turma_aluno_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_aluno
    ADD CONSTRAINT turma_aluno_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.alunos(id_aluno) ON DELETE CASCADE;


--
-- TOC entry 4785 (class 2606 OID 16764)
-- Name: turma_aluno turma_aluno_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_aluno
    ADD CONSTRAINT turma_aluno_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id_turma) ON DELETE CASCADE;


--
-- TOC entry 4786 (class 2606 OID 16769)
-- Name: turma_professor turma_professor_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_professor
    ADD CONSTRAINT turma_professor_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.professores(id_professor) ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 16774)
-- Name: turma_professor turma_professor_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma_professor
    ADD CONSTRAINT turma_professor_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id_turma) ON DELETE CASCADE;


--
-- TOC entry 4776 (class 2606 OID 16552)
-- Name: turmas turmas_fk_disciplina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_fk_disciplina_fkey FOREIGN KEY (fk_disciplina) REFERENCES public.disciplinas(id_disciplina);


-- Completed on 2024-04-14 20:55:05

--
-- PostgreSQL database dump complete
--

