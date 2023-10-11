--
-- PostgreSQL database cluster dump
--

-- Started on 2023-10-11 15:32:44

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-11 15:32:44

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

-- Completed on 2023-10-11 15:32:44

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-11 15:32:44

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2023-10-11 15:32:44

--
-- PostgreSQL database dump complete
--

--
-- Database "prd_case" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-10-11 15:32:44

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
-- TOC entry 4809 (class 1262 OID 16394)
-- Name: prd_case; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE prd_case WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';


ALTER DATABASE prd_case OWNER TO postgres;

\connect prd_case

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
-- TOC entry 216 (class 1259 OID 16527)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    sexo character(1),
    data_nascimento date,
    data_cadastro date,
    cidade character varying(255),
    uf character varying(2),
    geracao character varying(50),
    CONSTRAINT clientes_sexo_check CHECK ((sexo = ANY (ARRAY['m'::bpchar, 'f'::bpchar])))
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16526)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 220 (class 1259 OID 16558)
-- Name: jogos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogos (
    id integer NOT NULL,
    data_jogo date,
    hora_jogo time without time zone,
    time_casa character varying(255),
    time_fora character varying(255),
    gols_time1 integer,
    gols_time2 integer
);


ALTER TABLE public.jogos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16557)
-- Name: jogos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jogos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jogos_id_seq OWNER TO postgres;

--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 219
-- Name: jogos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jogos_id_seq OWNED BY public.jogos.id;


--
-- TOC entry 218 (class 1259 OID 16535)
-- Name: resultado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resultado (
    id integer NOT NULL,
    clientes_id integer,
    data_acesso date,
    buyin real,
    winning real,
    rake real
);


ALTER TABLE public.resultado OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16534)
-- Name: resultado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resultado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resultado_id_seq OWNER TO postgres;

--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 217
-- Name: resultado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resultado_id_seq OWNED BY public.resultado.id;


--
-- TOC entry 4644 (class 2604 OID 16530)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4646 (class 2604 OID 16561)
-- Name: jogos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogos ALTER COLUMN id SET DEFAULT nextval('public.jogos_id_seq'::regclass);


--
-- TOC entry 4645 (class 2604 OID 16538)
-- Name: resultado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultado ALTER COLUMN id SET DEFAULT nextval('public.resultado_id_seq'::regclass);


--
-- TOC entry 4799 (class 0 OID 16527)
-- Dependencies: 216
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, sexo, data_nascimento, data_cadastro, cidade, uf, geracao) FROM stdin;
1001	m	1996-01-22	2021-08-25	Alves	DF	\N
1002	f	1941-09-18	2022-04-12	Novaes do Oeste	SC	\N
1003	f	1956-02-14	2021-03-22	da Paz do Sul	AP	\N
1004	f	1984-04-29	2023-08-21	da Luz	MS	\N
1005	f	1971-01-30	2021-02-26	Silveira da Prata	PR	\N
1006	m	1947-08-26	2023-09-25	Melo	DF	\N
1007	f	1987-03-09	2022-12-01	Pires	PI	\N
1008	f	1951-03-07	2021-12-05	Dias da Serra	PR	\N
1009	m	1952-10-30	2021-05-25	Moraes	MT	\N
1010	m	1988-03-10	2023-09-25	Teixeira de Goiás	PI	\N
1011	f	1993-09-27	2022-10-11	Rocha das Pedras	AP	\N
1012	f	1947-02-15	2023-06-01	Araújo	MG	\N
1013	m	1937-07-25	2023-09-22	Almeida de Jesus	AC	\N
1014	f	1962-05-13	2023-02-02	da Cunha do Amparo	RO	\N
1015	m	1982-08-31	2021-01-30	Lima de da Paz	AM	\N
1016	m	1945-01-30	2021-11-03	Pinto do Campo	AL	\N
1017	m	1995-02-19	2023-08-18	Azevedo	AC	\N
1018	m	1955-04-24	2023-09-15	Caldeira do Galho	MG	\N
1019	f	1965-10-14	2023-06-28	Teixeira de da Rocha	AC	\N
1020	f	1929-05-09	2023-08-25	Nascimento	SE	\N
1021	f	1928-03-02	2022-11-20	Carvalho	MG	\N
1022	f	1931-04-14	2021-08-29	Silva	TO	\N
1023	m	1967-05-26	2023-05-08	Pereira	AP	\N
1024	f	1997-05-11	2022-03-28	Araújo de Minas	PB	\N
1025	m	1941-08-04	2023-01-28	Dias	BA	\N
1026	f	1949-03-07	2023-08-22	Melo da Mata	AL	\N
1027	m	1932-09-23	2022-08-07	Nogueira de Goiás	CE	\N
1028	f	1950-10-23	2021-02-22	Vieira Verde	SP	\N
1029	f	1950-12-13	2022-05-09	Barbosa	MS	\N
1030	f	1926-12-22	2021-07-16	Santos	RJ	\N
1031	m	1963-04-25	2020-10-28	Moura de Goiás	PA	\N
1032	m	1978-03-23	2022-02-02	da Rocha	SE	\N
1033	f	1973-11-25	2022-09-04	Lopes	PR	\N
1034	f	1986-06-27	2021-12-31	da Mota Grande	GO	\N
1035	m	1931-09-05	2022-01-12	Cardoso da Prata	RN	\N
1036	f	1937-12-12	2021-07-06	da Mota	RR	\N
1037	f	1941-07-09	2021-10-13	da Cunha	TO	\N
1038	m	1980-05-19	2023-07-18	Correia	MG	\N
1039	m	2005-10-26	2021-01-16	Duarte de Gomes	PI	\N
1040	f	1935-10-13	2020-12-01	Azevedo de Oliveira	MT	\N
1041	f	1993-05-22	2023-06-19	Nunes	AC	\N
1042	f	1944-11-07	2023-07-01	da Cruz Grande	BA	\N
1043	m	1960-06-19	2022-08-28	Aragão da Praia	RN	\N
1044	m	2000-07-29	2023-06-19	Gomes	MA	\N
1045	f	1954-02-22	2020-12-12	da Costa	SP	\N
1046	m	1985-09-10	2021-12-19	Duarte	MG	\N
1047	m	1946-05-15	2023-04-11	Mendes	SC	\N
1048	f	1982-04-28	2023-01-04	Alves	PI	\N
1049	m	1953-12-06	2021-09-05	Araújo	RR	\N
1050	f	1986-02-27	2021-01-22	da Cruz de da Rosa	MS	\N
1051	f	1928-10-29	2023-01-29	Melo do Sul	DF	\N
1052	m	1967-03-20	2021-05-11	Santos	AM	\N
1053	f	1960-06-04	2022-06-24	Moura	RJ	\N
1054	m	1950-04-29	2023-08-15	da Conceição	BA	\N
1055	f	1961-03-14	2023-03-31	da Paz do Oeste	DF	\N
1056	f	1969-09-19	2022-03-31	Moura	RR	\N
1057	f	1996-07-04	2021-10-18	Freitas	SE	\N
1058	m	1949-05-09	2021-07-10	Rodrigues	CE	\N
1059	m	1968-05-17	2023-02-12	da Mota do Campo	SE	\N
1060	m	1970-05-07	2023-03-15	Peixoto de Oliveira	DF	\N
1061	m	1970-01-08	2021-08-22	Rodrigues	AP	\N
1062	f	1925-02-27	2023-06-01	Castro das Flores	RN	\N
1063	m	1953-12-26	2021-05-31	Barros da Praia	MS	\N
1064	m	1951-05-08	2021-09-17	da Rocha de da Conceição	DF	\N
1065	m	2004-10-31	2023-10-09	Rezende	RO	\N
1066	f	1994-11-12	2022-07-01	Ferreira do Sul	RS	\N
1067	m	1959-11-25	2021-02-07	da Cruz das Flores	GO	\N
1068	m	1944-09-14	2023-01-11	da Luz	PR	\N
1069	m	1955-12-06	2022-11-23	da Luz das Flores	AC	\N
1070	m	1999-11-02	2020-10-17	Carvalho	MA	\N
1071	f	1999-08-03	2022-03-10	da Rocha	RR	\N
1072	f	1946-08-13	2022-03-10	da Rosa	AC	\N
1073	m	1995-03-08	2022-09-25	Pires de Moura	AL	\N
1074	m	1931-10-19	2022-03-14	Lopes	SC	\N
1075	m	1991-07-22	2022-11-08	Carvalho	RS	\N
1076	f	1976-07-04	2022-02-08	da Rosa	PE	\N
1077	m	1944-09-01	2022-04-19	Ferreira do Amparo	PE	\N
1078	f	1927-04-11	2023-09-10	Viana de Minas	PI	\N
1079	f	1938-11-26	2021-03-07	Moura	TO	\N
1080	f	1949-03-19	2023-10-02	Carvalho	ES	\N
1081	f	1930-03-15	2021-12-29	Castro de Moreira	SP	\N
1082	f	2003-10-05	2021-06-04	da Luz do Campo	RO	\N
1083	m	1945-04-05	2023-06-15	Cavalcanti de Gomes	BA	\N
1084	m	1976-07-27	2021-06-09	Aragão da Prata	CE	\N
1085	f	1937-08-15	2023-01-06	Barbosa de Goiás	RJ	\N
1086	m	1954-11-12	2022-05-03	Martins da Praia	MA	\N
1087	f	1947-06-20	2021-01-26	Caldeira	CE	\N
1088	m	1940-12-08	2023-08-11	Mendes	RS	\N
1089	f	1971-02-01	2021-08-05	Ramos Alegre	TO	\N
1090	m	2004-09-05	2020-10-22	Ramos Paulista	PB	\N
1091	f	1957-11-15	2023-02-18	Rocha	RO	\N
1092	f	1970-08-03	2022-03-30	Viana	RN	\N
1093	f	1969-05-12	2023-02-23	Araújo	AC	\N
1094	f	1932-07-18	2021-03-11	Monteiro de Minas	SC	\N
1095	m	1967-01-02	2023-03-15	Rodrigues de Melo	RN	\N
1096	m	1938-01-11	2021-03-19	da Mota de Freitas	RN	\N
1097	m	1960-06-27	2022-01-04	Sales	AL	\N
1098	f	2005-12-13	2021-09-15	da Cruz	AP	\N
1099	f	1977-04-07	2021-07-15	Jesus	DF	\N
1100	f	1984-05-07	2023-04-14	Castro	CE	\N
1101	m	1984-10-24	2021-08-21	Almeida	MT	\N
1102	f	1979-01-26	2021-01-12	da Cruz	DF	\N
1103	f	1955-06-30	2021-08-13	Almeida	SP	\N
1104	f	1969-01-14	2020-12-18	Pires da Serra	SC	\N
1105	f	2001-01-06	2022-11-27	Caldeira	MS	\N
1106	f	1972-03-16	2021-08-08	Santos	PA	\N
1107	m	1943-08-16	2022-11-21	Cavalcanti	AP	\N
1108	m	1958-09-01	2020-10-22	Alves	ES	\N
1109	m	1952-10-13	2022-03-30	Ferreira das Pedras	RR	\N
1110	m	1929-01-23	2021-11-28	Sales da Prata	AL	\N
1111	m	1982-09-05	2021-12-23	Viana da Serra	GO	\N
1112	m	1995-07-22	2022-02-06	Porto	AL	\N
1113	f	1972-12-02	2023-01-31	Barbosa de da Mata	MS	\N
1114	f	2004-03-08	2022-11-23	Nunes de Porto	TO	\N
1115	m	1952-04-04	2023-06-02	Castro Grande	AC	\N
1116	f	1946-12-08	2020-11-23	Melo da Prata	AL	\N
1117	m	1949-01-13	2022-05-30	Souza	AL	\N
1118	f	1967-10-13	2022-04-06	Barbosa de Lima	PR	\N
1119	m	1968-07-16	2021-08-08	Rezende do Campo	PI	\N
1120	f	1999-05-21	2020-11-15	Viana das Flores	PA	\N
1121	f	1953-01-16	2021-07-10	Azevedo das Flores	GO	\N
1122	f	1957-12-04	2023-09-13	Ferreira do Norte	AL	\N
1123	m	1974-01-12	2023-02-26	Porto do Oeste	MT	\N
1124	m	1990-08-16	2023-01-02	Barros de Aragão	PE	\N
1125	m	1932-01-11	2022-07-07	Lopes de Rocha	PA	\N
1126	m	1945-01-31	2023-08-22	Ramos de Sales	GO	\N
1127	f	1960-08-16	2021-03-29	Nascimento	MG	\N
1128	f	1965-04-16	2022-06-09	da Rocha das Pedras	CE	\N
1129	m	1929-11-07	2023-09-29	Ramos	RJ	\N
1130	m	1988-09-29	2022-08-24	Mendes das Pedras	RN	\N
1131	f	1947-06-25	2020-11-16	da Paz	RN	\N
1132	f	1977-10-03	2023-02-14	Ferreira	GO	\N
1133	f	2005-05-30	2021-07-05	Monteiro dos Dourados	RR	\N
1134	m	2002-01-25	2023-05-14	Ribeiro	BA	\N
1135	m	1958-02-22	2023-02-13	Nogueira	AL	\N
1136	m	1975-11-05	2021-03-25	Araújo da Prata	TO	\N
1137	m	1987-02-28	2022-10-15	Silveira de Goiás	PR	\N
1138	f	1997-08-23	2023-08-02	da Cruz de Rodrigues	AP	\N
1139	f	1946-05-19	2022-10-17	Moura da Praia	DF	\N
1140	f	1982-04-14	2022-06-19	Moura dos Dourados	CE	\N
1141	f	1933-05-01	2021-03-10	Rocha	PE	\N
1142	m	1968-10-21	2021-08-14	Nascimento de Cardoso	PE	\N
1143	m	1968-01-08	2021-03-17	Nunes do Norte	CE	\N
1144	m	1927-01-23	2022-12-20	da Conceição de Cavalcanti	MG	\N
1145	m	1973-05-30	2022-01-12	Souza	SP	\N
1146	m	1956-03-07	2021-01-27	Sales	PI	\N
1147	m	1947-07-08	2022-03-02	Almeida	BA	\N
1148	m	1943-07-01	2022-02-04	Azevedo do Campo	MG	\N
1149	f	1935-05-08	2020-10-10	Duarte da Serra	RO	\N
1150	f	1928-07-10	2022-08-22	da Rosa	PR	\N
1151	m	1996-04-19	2023-07-27	da Rosa	SP	\N
1152	m	1935-09-22	2020-10-18	da Luz	PB	\N
1153	f	1998-12-12	2022-10-07	Aragão do Norte	CE	\N
1154	m	1994-11-23	2021-04-13	Barros de Carvalho	SC	\N
1155	f	1931-10-21	2023-08-04	Moraes	DF	\N
1156	f	1991-07-29	2023-01-24	Jesus	MS	\N
1157	m	1966-04-07	2023-01-07	Santos de da Luz	PB	\N
1158	m	1953-10-20	2023-07-08	Lima de Minas	RS	\N
1159	f	1935-06-08	2023-04-07	Ferreira da Praia	TO	\N
1160	m	1981-12-03	2021-06-03	da Cunha	MA	\N
1161	m	2002-11-27	2022-02-22	Martins	PE	\N
1162	f	1958-09-08	2022-06-24	Azevedo da Praia	RS	\N
1163	m	1955-07-19	2022-04-07	Santos	MG	\N
1164	f	1937-02-07	2023-01-18	Aragão da Mata	SP	\N
1165	m	1982-03-10	2021-10-24	Moura	AP	\N
1166	m	1990-07-08	2021-12-29	Nunes	PB	\N
1167	f	1928-08-02	2021-03-15	Lima de da Paz	SE	\N
1168	f	1926-07-16	2021-09-14	Freitas	AL	\N
1169	f	1996-08-14	2022-09-30	Caldeira	PR	\N
1170	f	1937-02-03	2021-08-04	Fernandes de Santos	GO	\N
1171	f	1929-06-17	2021-03-02	Carvalho	ES	\N
1172	f	1987-02-04	2021-08-26	Gonçalves	AM	\N
1173	f	1998-10-16	2022-05-18	Ramos da Serra	RJ	\N
1174	m	1980-03-28	2022-03-22	Novaes Grande	AP	\N
1175	f	2000-12-09	2023-01-08	Melo	AC	\N
1176	m	2005-02-16	2023-03-14	Barros	MA	\N
1177	m	1976-03-31	2023-02-22	Teixeira	AC	\N
1178	m	1950-01-01	2022-01-04	Fernandes da Serra	SE	\N
1179	m	1943-09-16	2022-06-11	Martins	ES	\N
1180	m	1949-08-03	2022-01-19	Peixoto	AM	\N
1181	f	1993-06-26	2021-01-27	Viana Grande	PI	\N
1182	f	1946-01-29	2022-04-26	Moraes	MA	\N
1183	f	1997-12-19	2022-05-31	Cardoso do Campo	RO	\N
1184	f	1943-03-15	2020-12-15	Costa	PI	\N
1185	f	1925-02-19	2021-12-18	Correia	AC	\N
1186	f	2003-07-23	2020-10-27	Aragão	RJ	\N
1187	f	2001-08-26	2021-05-18	Viana	RO	\N
1188	m	1933-06-14	2022-11-16	Barros	SP	\N
1189	m	1938-02-11	2021-11-04	Barros do Sul	RO	\N
1190	f	1974-06-06	2022-04-21	Fogaça do Amparo	PE	\N
1191	f	1930-09-28	2023-01-19	Moraes da Mata	MA	\N
1192	m	1932-01-30	2022-12-28	Alves de Rocha	AP	\N
1193	f	1957-07-21	2023-08-31	Barbosa	PE	\N
1194	f	1967-01-01	2022-10-31	Fernandes	CE	\N
1195	f	1976-11-07	2021-12-01	Silveira do Galho	GO	\N
1196	f	1990-05-25	2021-10-23	Nascimento do Sul	RO	\N
1197	f	1926-03-12	2021-12-16	Pereira do Campo	RJ	\N
1198	f	1948-01-17	2023-06-10	Porto do Amparo	RS	\N
1199	m	1980-06-01	2022-03-21	Barros Alegre	PI	\N
1200	f	2004-10-20	2023-05-08	Cardoso	PE	\N
1201	m	2005-08-24	2022-07-19	Farias	RJ	\N
1202	f	1966-09-21	2023-05-25	Novaes	RN	\N
1203	m	1969-11-22	2022-01-01	Jesus dos Dourados	ES	\N
1204	m	1978-07-29	2022-11-17	Alves de Alves	RN	\N
1205	f	1999-05-17	2021-05-27	Ribeiro	MA	\N
1206	m	2001-01-27	2023-06-30	Pires de Moraes	MA	\N
1207	m	1977-12-16	2022-12-11	Silveira	RR	\N
1208	f	2002-03-28	2021-02-02	Ribeiro do Norte	SP	\N
1209	m	1957-01-03	2020-12-02	Farias	DF	\N
1210	m	1990-11-24	2023-06-06	Ferreira	ES	\N
1211	f	1956-01-27	2022-12-10	da Rocha	GO	\N
1212	f	1992-11-06	2021-09-21	Vieira de das Neves	MG	\N
1213	m	1946-04-15	2023-09-19	da Rosa	CE	\N
1214	f	2005-08-11	2023-04-03	Rezende	PB	\N
1215	f	1977-06-28	2023-02-14	Nascimento Verde	AC	\N
1216	m	1976-08-13	2021-05-19	Vieira da Prata	AP	\N
1217	f	1942-01-04	2022-05-21	Barbosa	AM	\N
1218	f	1937-07-29	2021-02-15	Almeida dos Dourados	TO	\N
1219	f	1952-04-10	2021-03-29	Dias	SP	\N
1220	f	1937-05-23	2023-08-18	Castro Verde	MS	\N
1221	m	2003-12-15	2022-12-16	Novaes	MA	\N
1222	f	2001-05-15	2021-07-05	Fogaça do Galho	MA	\N
1223	f	1962-07-03	2023-01-11	Nogueira	RN	\N
1224	m	1979-12-23	2021-07-18	Viana	CE	\N
1225	f	2004-08-06	2021-10-09	da Cruz dos Dourados	AC	\N
1226	f	1998-06-06	2021-03-22	Aragão	RO	\N
1227	m	1948-12-14	2022-07-03	Rocha de Minas	RO	\N
1228	m	1930-01-01	2020-11-27	Dias Paulista	PI	\N
1229	f	1973-02-03	2021-01-09	Ferreira de Costa	PR	\N
1230	m	1956-03-28	2023-06-13	da Costa	RS	\N
1231	m	1981-08-04	2020-11-13	da Mata	AM	\N
1232	f	1929-06-03	2021-11-07	Caldeira do Galho	MG	\N
1233	m	1934-11-18	2020-10-28	Ferreira do Sul	SE	\N
1234	m	1952-11-28	2021-08-06	Cardoso do Oeste	MT	\N
1235	m	1992-01-21	2022-10-07	Rodrigues	RS	\N
1236	m	1928-07-25	2021-11-26	Fernandes	PI	\N
1237	f	1945-03-18	2022-03-17	Rocha	RJ	\N
1238	f	1988-07-02	2021-04-06	Aragão de Nascimento	SP	\N
1239	f	1926-03-15	2022-08-09	Viana	GO	\N
1240	m	1980-12-04	2023-07-30	Duarte de da Paz	PB	\N
1241	f	1984-02-26	2023-09-04	Araújo	DF	\N
1242	m	1943-10-12	2021-08-26	Ferreira de Minas	AP	\N
1243	m	1966-05-30	2021-10-29	Ferreira de Minas	RS	\N
1244	m	2001-02-14	2023-05-18	Novaes	BA	\N
1245	m	1987-05-31	2022-06-03	Gonçalves	SC	\N
1246	f	1941-07-14	2022-08-30	Fogaça Paulista	PB	\N
1247	m	1983-01-18	2021-03-05	Santos Paulista	MT	\N
1248	m	1972-08-06	2022-05-19	Cunha	SP	\N
1249	f	1926-09-19	2023-02-07	Vieira Verde	GO	\N
1250	f	1948-01-05	2021-09-08	Aragão do Norte	PI	\N
1251	m	1976-08-04	2023-08-26	Porto de Ribeiro	CE	\N
1252	f	1996-03-13	2023-06-15	Lima de Souza	RR	\N
1253	f	1982-09-26	2023-08-07	Duarte	AL	\N
1254	m	1935-05-31	2023-06-07	Mendes da Serra	PE	\N
1255	m	1980-07-19	2021-02-24	Dias Alegre	MA	\N
1256	f	1932-11-27	2020-11-06	Correia Verde	TO	\N
1257	f	1996-09-09	2023-05-18	Viana dos Dourados	MA	\N
1258	m	1986-12-06	2021-11-05	Oliveira	AL	\N
1259	m	1954-01-20	2021-05-04	Aragão	PA	\N
1260	m	1947-07-20	2021-04-30	Cunha da Mata	AM	\N
1261	f	2000-02-02	2021-02-19	da Costa	DF	\N
1262	f	1945-05-26	2023-01-12	Ferreira	MG	\N
1263	f	1971-12-18	2023-10-09	Nascimento Grande	ES	\N
1264	m	1964-09-08	2022-04-27	Campos de Cardoso	PI	\N
1265	f	1943-05-23	2021-04-16	Moraes	GO	\N
1266	f	1989-08-24	2021-07-26	da Rosa do Norte	CE	\N
1267	f	1985-03-14	2023-09-17	Porto de Moura	AM	\N
1268	f	1956-04-12	2021-01-10	Fernandes	PE	\N
1269	m	1986-04-18	2020-12-30	Moreira	MG	\N
1270	f	1977-09-02	2023-05-11	da Luz	PE	\N
1271	f	1943-08-11	2021-09-13	Teixeira	PB	\N
1272	f	1936-05-25	2023-07-02	Rezende	SC	\N
1273	f	1940-07-04	2022-12-29	Pires de Nascimento	PI	\N
1274	m	1966-02-10	2022-07-06	Aragão das Pedras	RJ	\N
1275	f	1990-10-10	2021-01-31	Ramos Grande	MT	\N
1276	m	2000-05-09	2022-05-10	Cardoso Paulista	RO	\N
1277	f	1992-10-11	2022-05-24	Nogueira do Galho	RO	\N
1278	f	1990-04-26	2022-02-05	Rezende do Oeste	RN	\N
1279	f	1995-11-01	2022-09-23	Ramos Alegre	MT	\N
1280	f	1982-04-07	2023-07-23	Souza do Norte	SC	\N
1281	f	1990-10-01	2021-01-23	Lima da Praia	SC	\N
1282	m	2003-10-07	2022-11-13	Almeida da Mata	SC	\N
1283	f	1953-02-16	2022-12-26	Souza	SC	\N
1284	f	1998-11-18	2022-04-18	Cardoso do Norte	MT	\N
1285	f	1929-06-29	2021-07-14	Cardoso	MA	\N
1286	f	1970-04-27	2022-03-15	da Cruz de Rodrigues	AP	\N
1287	f	1985-01-01	2021-10-25	da Costa das Pedras	RN	\N
1288	m	2004-12-20	2023-01-19	Cardoso de Silva	AC	\N
1289	f	1927-04-24	2020-10-27	Almeida	RR	\N
1290	f	1949-01-12	2022-05-03	da Luz	AC	\N
1291	m	1993-11-03	2023-05-14	Ramos	SP	\N
1292	f	1951-10-24	2021-09-10	Lopes dos Dourados	CE	\N
1293	f	1999-01-23	2022-06-04	Aragão	MS	\N
1294	f	2004-12-14	2023-08-23	Pereira de Goiás	ES	\N
1295	f	2003-05-30	2021-03-17	Sales Grande	PI	\N
1296	f	1937-10-10	2021-09-11	da Mata de Monteiro	CE	\N
1297	f	1998-11-16	2022-06-02	da Conceição	RO	\N
1298	f	2003-06-18	2022-10-25	Lopes	SE	\N
1299	m	1950-10-31	2022-01-11	Caldeira de Ribeiro	RS	\N
1300	m	1957-12-10	2023-05-21	Cardoso da Prata	PA	\N
1301	m	1932-03-15	2022-04-30	Castro de Peixoto	MS	\N
1302	f	1988-08-25	2023-01-09	Rodrigues	PI	\N
1303	m	1985-01-02	2022-02-03	Pereira de Minas	SE	\N
1304	m	1972-01-07	2022-03-15	Silveira de Mendes	AP	\N
1305	m	1984-08-04	2023-01-11	Araújo Grande	SC	\N
1306	f	2004-04-22	2021-11-25	da Conceição de Sales	MA	\N
1307	f	1932-01-04	2022-12-14	Cavalcanti de Minas	DF	\N
1308	f	2002-11-12	2022-10-12	Cavalcanti de Castro	SE	\N
1309	m	1965-07-06	2022-02-08	Duarte Paulista	TO	\N
1310	m	1994-08-03	2023-05-23	Vieira de Viana	MA	\N
1311	f	1989-03-24	2022-07-01	Monteiro	PA	\N
1312	f	1990-05-11	2021-11-29	Teixeira	AM	\N
1313	m	1954-03-03	2021-08-27	Vieira	MS	\N
1314	m	1929-07-20	2021-11-22	Porto das Pedras	BA	\N
1315	f	1968-04-15	2021-07-10	Araújo de Caldeira	ES	\N
1316	m	1931-12-10	2021-01-16	da Mata do Norte	AC	\N
1317	m	1986-09-27	2023-01-20	Silveira de Moreira	RS	\N
1318	m	1950-11-09	2021-06-27	Porto da Mata	CE	\N
1319	f	1981-10-12	2023-05-13	Barbosa de Minas	RO	\N
1320	m	2000-02-06	2021-08-06	Porto	RN	\N
1321	f	1974-04-07	2021-10-07	Rocha	PE	\N
1322	f	1991-02-25	2022-11-20	Jesus	PB	\N
1323	m	1978-01-09	2022-01-13	Rocha Verde	MA	\N
1324	m	1950-09-04	2021-08-22	Mendes de Minas	PR	\N
1325	m	1987-05-30	2021-03-04	Lopes da Mata	SE	\N
1326	f	1947-08-21	2023-02-18	Fogaça	MT	\N
1327	f	1969-12-19	2022-05-26	Moura do Campo	RO	\N
1328	f	1955-08-07	2022-11-03	da Mota do Sul	CE	\N
1329	m	1985-12-08	2023-10-08	Silveira	AL	\N
1330	f	1971-12-29	2021-09-09	Mendes	PI	\N
1331	m	2004-02-29	2020-12-10	Vieira Alegre	TO	\N
1332	f	1931-11-05	2021-09-22	da Rocha de Farias	AC	\N
1333	m	1966-09-20	2021-01-03	da Luz	AP	\N
1334	m	1986-03-23	2021-07-21	Vieira	SC	\N
1335	f	1983-07-20	2022-09-19	Nogueira dos Dourados	MS	\N
1336	f	1937-09-07	2020-12-20	da Costa	AL	\N
1337	m	1967-06-27	2022-03-20	Farias Grande	PE	\N
1338	m	1927-07-02	2021-01-18	Jesus da Mata	AP	\N
1339	m	1928-08-19	2020-12-28	da Cunha da Mata	PI	\N
1340	f	1986-11-03	2021-10-31	da Conceição	AM	\N
1341	f	1933-11-12	2021-05-22	Melo de Novaes	MT	\N
1342	m	2005-09-17	2023-07-22	Araújo do Galho	ES	\N
1343	m	1952-03-23	2021-11-16	Gonçalves da Prata	MT	\N
1344	m	1967-06-10	2021-08-17	Cavalcanti	MS	\N
1345	f	1929-02-25	2021-05-11	Cardoso de Minas	RJ	\N
1346	f	1989-11-15	2021-12-29	Viana da Praia	GO	\N
1347	m	1953-04-24	2022-11-10	Lima da Serra	AP	\N
1348	m	1969-01-30	2023-08-03	da Mata de da Paz	AM	\N
1349	f	1966-01-15	2021-07-02	Alves do Norte	PE	\N
1350	m	2000-03-21	2021-07-01	Barbosa	SE	\N
1351	f	1931-12-26	2021-03-18	Moraes	AP	\N
1352	f	1936-10-06	2021-11-30	da Rocha	MA	\N
1353	f	1986-10-09	2023-08-13	Araújo de Nunes	PB	\N
1354	m	1938-06-17	2021-10-03	Barros	SE	\N
1355	m	1976-06-30	2022-05-30	Fogaça da Serra	MG	\N
1356	m	1964-10-14	2021-09-02	Ribeiro	TO	\N
1357	f	1937-01-24	2022-11-05	Porto	PB	\N
1358	f	2002-05-10	2021-07-27	Vieira	PB	\N
1359	f	1945-02-19	2021-12-31	Correia	SP	\N
1360	f	2005-10-14	2021-09-28	da Mota de Farias	PE	\N
1361	f	1954-12-07	2020-11-29	Azevedo do Oeste	RR	\N
1362	f	1991-07-27	2021-03-06	Cardoso	RJ	\N
1363	m	1953-01-26	2020-11-10	Moraes de Carvalho	AC	\N
1364	m	2000-07-14	2021-12-27	Nunes da Serra	AC	\N
1365	f	1936-10-28	2023-02-25	Melo	RJ	\N
1366	m	1953-04-17	2022-10-24	Cardoso do Campo	MS	\N
1367	m	1976-08-16	2022-05-14	Cardoso	MS	\N
1368	m	1949-08-24	2022-09-29	Gonçalves da Prata	PR	\N
1369	m	1994-09-22	2020-12-19	da Luz dos Dourados	RO	\N
1370	f	1942-09-13	2021-01-29	Cardoso	RO	\N
1371	m	1966-01-08	2023-04-30	Nogueira do Galho	RS	\N
1372	f	1957-12-20	2021-03-30	Ramos do Campo	MT	\N
1373	f	1983-08-30	2022-12-07	Lima	RJ	\N
1374	f	1997-04-29	2021-12-03	da Luz da Serra	SC	\N
1375	m	1985-07-10	2022-11-26	Cunha da Mata	PB	\N
1376	f	1978-03-07	2020-12-26	Moura	PE	\N
1377	f	1978-07-18	2021-11-10	da Mata Verde	MG	\N
1378	m	2005-01-19	2021-02-26	Silveira de da Mota	CE	\N
1379	m	1967-08-20	2021-12-24	Lopes	AC	\N
1380	f	1938-01-29	2021-12-25	da Rosa das Pedras	RN	\N
1381	f	1993-04-16	2022-05-06	Lopes da Serra	GO	\N
1382	f	1996-02-20	2023-05-01	Ferreira	SP	\N
1383	f	1957-09-26	2022-10-16	Nunes	RO	\N
1384	m	1965-02-04	2023-03-26	Rodrigues do Norte	SP	\N
1385	m	2003-03-17	2022-11-05	Nunes do Campo	PA	\N
1386	f	1990-05-20	2022-05-27	Barros Grande	PI	\N
1387	m	2001-12-01	2022-04-10	Porto	MT	\N
1388	f	1936-04-14	2021-04-25	Rezende	AL	\N
1389	f	1970-06-22	2021-05-23	Caldeira de da Luz	RN	\N
1390	f	1962-04-29	2022-04-26	Moraes das Flores	MA	\N
1391	m	1999-04-20	2022-01-01	Peixoto	MG	\N
1392	f	1968-02-03	2021-11-29	Nascimento	PA	\N
1393	f	1959-10-14	2021-09-12	Farias de Minas	MS	\N
1394	f	1930-08-01	2023-06-21	da Rocha	GO	\N
1395	f	1992-02-02	2022-07-22	Cardoso de Almeida	AL	\N
1396	m	1979-02-06	2021-09-28	Dias do Galho	PE	\N
1397	f	1952-01-13	2022-03-21	Porto Grande	PE	\N
1398	f	1957-01-02	2023-05-16	Silveira	DF	\N
1399	m	1990-04-14	2022-10-31	das Neves	PI	\N
1400	f	1926-01-05	2022-11-25	Souza	RN	\N
1401	f	1942-08-07	2020-12-05	Lima	RN	\N
1402	f	1928-10-27	2021-03-05	Teixeira Alegre	AL	\N
1403	m	1955-06-04	2022-08-07	da Rosa	AL	\N
1404	f	1987-06-06	2021-03-20	Lopes	PR	\N
1405	f	1965-11-09	2022-01-05	Moreira	BA	\N
1406	f	1946-11-22	2023-08-05	Gonçalves de Goiás	MG	\N
1407	f	1946-10-16	2022-05-27	Monteiro	BA	\N
1408	m	2004-11-17	2022-10-29	Ferreira	BA	\N
1409	m	1966-03-22	2022-02-21	Santos	AL	\N
1410	f	1986-11-30	2022-10-31	da Mata de Monteiro	SP	\N
1411	f	1928-04-08	2022-05-10	Lima	RS	\N
1412	m	1945-07-10	2021-03-31	Nogueira da Serra	SP	\N
1413	m	1950-05-25	2020-12-18	Ramos da Mata	MS	\N
1414	m	1965-11-22	2021-05-10	Ribeiro do Amparo	TO	\N
1415	f	1992-03-26	2023-06-28	Lopes de Minas	PR	\N
1416	m	1969-04-22	2021-03-21	Cavalcanti	BA	\N
1417	f	1961-03-01	2022-07-09	Peixoto	PE	\N
1418	f	1959-06-20	2021-01-26	Campos de Costa	GO	\N
1419	f	1959-12-28	2022-07-05	Moreira	MG	\N
1420	f	1966-11-05	2022-10-27	Nunes	SE	\N
1421	m	1992-08-31	2023-07-17	Ramos	PI	\N
1422	f	1979-11-13	2022-11-15	Jesus	AL	\N
1423	f	2001-06-13	2021-07-26	Dias da Serra	TO	\N
1424	f	1976-01-01	2022-02-07	Martins da Praia	AL	\N
1425	f	1994-05-21	2023-05-09	Rodrigues da Praia	AM	\N
1426	f	2002-05-08	2022-07-30	Rodrigues	RN	\N
1427	f	2002-12-13	2022-11-08	Cardoso	TO	\N
1428	f	1978-11-27	2020-10-24	da Rocha do Sul	MT	\N
1429	f	1993-03-11	2021-03-31	Carvalho	MS	\N
1430	m	1935-10-06	2022-04-20	Silva	TO	\N
1431	m	1959-07-10	2021-08-05	Alves	SC	\N
1432	m	1938-04-07	2023-05-18	Cunha Grande	DF	\N
1433	m	2002-11-17	2023-09-17	da Rosa Paulista	AP	\N
1434	f	1978-12-25	2023-09-27	da Conceição do Sul	AL	\N
1435	m	1925-11-30	2022-01-07	Souza	SE	\N
1436	m	1965-09-10	2021-08-25	Lima da Mata	RJ	\N
1437	m	1991-03-29	2021-09-27	Cunha Grande	MA	\N
1438	m	2000-07-09	2022-06-28	Moraes	MT	\N
1439	f	1942-09-10	2023-08-10	Cavalcanti	AP	\N
1440	m	1946-05-26	2021-04-02	Nunes de Minas	TO	\N
1441	m	1980-02-22	2022-11-23	Azevedo	MA	\N
1442	m	1934-01-25	2022-01-26	Campos	RS	\N
1443	m	1942-05-03	2022-02-25	Fernandes Grande	SC	\N
1444	f	1932-11-26	2023-06-02	Barbosa	ES	\N
1445	f	1938-07-27	2023-02-08	Gonçalves	MT	\N
1446	f	1981-09-01	2021-02-05	Lopes	TO	\N
1447	m	1926-03-16	2022-01-26	Lima de Cavalcanti	ES	\N
1448	m	1978-12-25	2021-08-03	Barros das Flores	PR	\N
1449	m	1961-08-26	2022-11-10	Moraes	MA	\N
1450	m	1996-02-28	2023-04-28	Pires Alegre	RJ	\N
1451	m	1950-08-06	2023-01-22	Oliveira do Oeste	AP	\N
1452	f	1986-06-24	2022-04-29	Martins	ES	\N
1453	f	1964-02-07	2021-08-20	Aragão	SC	\N
1454	f	1955-10-01	2021-07-14	Caldeira	RS	\N
1455	m	1953-10-02	2023-05-26	Monteiro	SE	\N
1456	f	1977-09-23	2023-09-30	Pires	SP	\N
1457	m	1995-07-20	2022-02-25	da Cruz das Pedras	PE	\N
1458	f	1937-01-05	2023-01-09	Peixoto	AC	\N
1459	f	1935-09-05	2022-11-02	Melo do Campo	AL	\N
1460	f	1928-07-01	2021-01-03	Martins de Cardoso	MS	\N
1461	m	1999-10-29	2023-09-18	Lopes	ES	\N
1462	m	1997-04-27	2022-07-12	Araújo	PE	\N
1463	m	1950-07-31	2021-11-19	Pires de Barros	ES	\N
1464	m	1992-06-11	2023-07-10	da Luz de da Conceição	PA	\N
1465	m	1971-09-11	2020-10-25	Duarte	BA	\N
1466	f	1944-12-16	2022-01-30	Ribeiro	MG	\N
1467	m	2000-01-05	2021-10-01	Peixoto da Mata	AP	\N
1468	f	1984-05-25	2020-11-28	Sales Verde	BA	\N
1469	m	1939-10-13	2022-02-07	da Cruz	AC	\N
1470	m	1952-09-24	2023-01-06	Nascimento da Mata	PA	\N
1471	m	1980-04-04	2023-04-19	Ribeiro	TO	\N
1472	f	1949-11-10	2020-12-26	Viana Paulista	TO	\N
1473	f	1984-09-29	2021-12-22	Nascimento Verde	ES	\N
1474	f	1965-03-31	2022-04-14	Lima	AL	\N
1475	f	2001-04-15	2020-10-23	da Mata	BA	\N
1476	f	1971-03-30	2022-10-07	da Mota dos Dourados	CE	\N
1477	f	1967-06-13	2022-06-17	Cavalcanti	CE	\N
1478	f	1979-07-25	2021-03-29	Duarte da Mata	MG	\N
1479	m	1941-07-14	2023-05-29	Nogueira	TO	\N
1480	m	1936-01-10	2021-05-23	das Neves do Campo	MS	\N
1481	m	1932-05-21	2022-12-23	Azevedo	MA	\N
1482	m	1956-10-11	2020-12-23	Cavalcanti do Sul	AL	\N
1483	f	1945-08-15	2022-06-01	Lopes	TO	\N
1484	f	1990-07-01	2022-04-02	Moreira da Prata	SC	\N
1485	m	1938-03-03	2021-09-02	Aragão Paulista	AP	\N
1486	f	1964-07-01	2023-03-24	Mendes de da Cruz	RO	\N
1487	f	1993-07-08	2022-02-09	Ramos	AP	\N
1488	f	1933-03-18	2022-09-08	Monteiro	MA	\N
1489	f	1934-06-04	2020-10-20	Aragão Alegre	MG	\N
1490	f	1941-09-02	2022-05-30	Mendes de Minas	AL	\N
1491	m	1993-09-04	2021-06-25	Lopes de Farias	DF	\N
1492	m	1976-01-08	2022-01-13	Araújo de Peixoto	ES	\N
1493	m	1925-08-11	2023-04-18	Duarte	PA	\N
1494	m	1950-05-18	2023-06-10	Sales	RR	\N
1495	f	1971-03-30	2021-11-18	da Rocha de Minas	MG	\N
1496	m	1982-01-12	2020-11-01	Caldeira Verde	AM	\N
1497	m	1931-09-26	2022-09-19	Vieira da Praia	PE	\N
1498	f	1991-01-16	2020-10-11	Mendes Grande	PR	\N
1499	f	2004-12-26	2021-07-04	Azevedo de Nogueira	RJ	\N
1500	f	1946-06-09	2022-08-06	Pires de Lima	RO	\N
1501	f	1941-07-10	2022-04-06	Ribeiro	DF	\N
1502	m	1965-01-16	2021-09-28	Campos	BA	\N
1503	f	1944-11-22	2022-04-25	Sales	MT	\N
1504	f	1989-09-15	2022-10-04	Ramos do Amparo	CE	\N
1505	m	1968-05-11	2021-11-01	Porto	CE	\N
1506	f	1975-07-03	2022-08-11	Rocha de Goiás	PA	\N
1507	m	1984-04-18	2022-01-21	Farias de Alves	MS	\N
1508	f	1997-10-07	2022-07-02	Vieira	MA	\N
1509	f	1997-05-02	2021-06-15	das Neves	MA	\N
1510	m	1996-01-07	2020-11-03	Vieira	AL	\N
1511	m	1978-10-19	2022-01-12	da Mota	RO	\N
1512	m	1988-04-29	2021-03-09	Vieira	AC	\N
1513	f	2001-04-23	2023-07-17	Ferreira	ES	\N
1514	m	1987-05-11	2022-11-17	Ribeiro	PA	\N
1515	m	1986-05-23	2022-12-20	Pires de Lopes	DF	\N
1516	m	1993-03-16	2021-03-29	Vieira de da Rosa	SC	\N
1517	f	1946-11-27	2021-12-16	Pires do Oeste	PA	\N
1518	m	1970-10-28	2022-11-07	Costela de Pires	MS	\N
1519	m	1925-10-02	2022-02-18	Azevedo	PA	\N
1520	m	1936-02-27	2023-01-30	Vieira do Oeste	RR	\N
1521	m	1936-04-01	2023-07-27	Cunha do Sul	AM	\N
1522	f	1933-12-28	2022-02-16	Sales do Oeste	SC	\N
1523	m	1938-04-16	2023-06-23	Pereira	MG	\N
1524	m	1984-01-16	2022-02-07	da Luz Grande	AM	\N
1525	f	1972-05-17	2023-06-11	Campos de Minas	RO	\N
1526	f	1976-12-21	2023-04-06	Correia	MS	\N
1527	m	1987-10-05	2022-07-14	Novaes Alegre	RJ	\N
1528	f	1944-04-17	2020-11-24	Pinto Verde	BA	\N
1529	m	1944-02-04	2022-03-31	Fogaça	MS	\N
1530	f	1931-05-29	2021-07-17	Santos de da Rocha	CE	\N
1531	f	1997-04-07	2023-08-14	da Costa	ES	\N
1532	f	1980-01-13	2021-02-18	da Conceição das Pedras	PR	\N
1533	f	1999-05-19	2023-02-07	Aragão	GO	\N
1534	m	2004-03-24	2022-09-03	Costela do Sul	AL	\N
1535	m	1974-04-02	2020-12-10	Oliveira do Amparo	AL	\N
1536	m	1955-07-22	2021-01-29	Fernandes do Galho	RN	\N
1537	f	1997-05-03	2022-10-26	Cardoso	PA	\N
1538	f	1949-10-16	2023-04-02	Castro Alegre	AL	\N
1539	m	1927-07-21	2022-07-29	Cavalcanti	RJ	\N
1540	f	1934-08-17	2022-06-29	Moreira Alegre	RR	\N
1541	m	1944-07-27	2021-07-08	da Luz da Prata	AC	\N
1542	m	1942-05-13	2022-09-07	da Costa	AC	\N
1543	f	1977-05-02	2021-09-22	Melo de Goiás	RS	\N
1544	f	2003-12-06	2022-11-06	Lima	AL	\N
1545	m	1935-01-10	2022-03-05	Azevedo	AC	\N
1546	m	1997-10-05	2021-02-02	da Rocha	AP	\N
1547	f	1968-12-19	2021-10-28	Carvalho	RJ	\N
1548	f	1992-06-19	2021-08-11	Barros	SP	\N
1549	f	1964-03-10	2022-08-07	Barbosa	PR	\N
1550	m	1993-10-03	2021-01-23	Gonçalves do Galho	SE	\N
1551	m	1974-06-23	2021-01-30	Farias	RR	\N
1552	f	1946-01-22	2021-03-31	Monteiro	RN	\N
1553	m	1974-11-29	2022-10-29	Moura do Norte	AC	\N
1554	m	1994-03-24	2021-12-10	Cunha	RN	\N
1555	f	1949-07-12	2021-04-03	da Rocha do Sul	ES	\N
1556	f	1987-01-23	2022-10-04	Campos de Correia	MT	\N
1557	f	1934-07-28	2023-01-26	da Luz de Dias	PI	\N
1558	f	1937-02-03	2021-11-19	Rezende de Goiás	RS	\N
1559	f	1968-10-28	2021-04-02	Melo de da Rosa	SC	\N
1560	f	1940-09-07	2020-10-21	da Cruz	PR	\N
1561	f	1945-11-13	2020-12-31	da Luz de Ramos	AC	\N
1562	f	1936-01-06	2021-04-11	da Rocha do Galho	PI	\N
1563	m	1932-02-12	2021-11-13	Martins de Minas	DF	\N
1564	m	1952-11-18	2023-04-26	Vieira da Prata	PI	\N
1565	m	1925-02-11	2022-07-10	Lopes	TO	\N
1566	f	1991-04-12	2021-08-24	da Paz	GO	\N
1567	f	1997-09-07	2020-12-04	da Costa	MG	\N
1568	m	1967-05-24	2023-06-13	Santos	SP	\N
1569	f	1935-03-30	2021-02-07	Azevedo	AP	\N
1570	m	1959-12-15	2021-09-13	das Neves	RJ	\N
1571	m	1999-12-06	2021-12-20	da Mata	GO	\N
1572	m	1982-12-16	2023-08-18	da Rocha de Teixeira	TO	\N
1573	m	1971-08-05	2023-07-05	Oliveira do Campo	RO	\N
1574	f	1973-03-11	2021-07-17	Farias Paulista	CE	\N
1575	f	1997-06-22	2023-08-03	Pires	RO	\N
1576	m	1934-12-07	2021-05-15	Campos do Norte	AP	\N
1577	m	1979-05-26	2021-09-09	Silva de Goiás	DF	\N
1578	m	1995-11-28	2020-11-11	Mendes de Gonçalves	AM	\N
1579	f	1960-01-28	2023-02-01	Peixoto Alegre	PB	\N
1580	f	1999-10-28	2022-02-16	Correia Alegre	MG	\N
1581	m	1931-09-21	2022-12-01	Moura	ES	\N
1582	m	1940-03-22	2022-03-15	da Cruz das Pedras	TO	\N
1583	m	1975-02-28	2021-10-14	Cardoso	AC	\N
1584	f	1996-10-02	2022-09-21	Fogaça de Minas	TO	\N
1585	m	1990-06-27	2021-05-22	Ribeiro	PB	\N
1586	m	1981-05-07	2021-08-22	Nogueira	RJ	\N
1587	m	2000-01-02	2020-11-08	Aragão da Mata	RR	\N
1588	f	1982-07-17	2023-09-04	Campos	PE	\N
1589	m	1951-05-01	2020-11-13	Jesus	MT	\N
1590	m	1934-04-08	2021-05-09	Ferreira da Prata	PI	\N
1591	m	1953-11-14	2022-08-25	Nunes	AL	\N
1592	m	1991-05-31	2023-08-14	Cavalcanti da Prata	SP	\N
1593	f	1984-03-18	2022-05-10	Jesus da Serra	RN	\N
1594	m	1999-03-28	2021-07-09	Cunha das Flores	PI	\N
1595	m	1983-04-10	2021-09-30	Moraes de Silva	PB	\N
1596	f	1948-12-01	2021-01-28	Carvalho	RJ	\N
1597	f	1956-09-14	2022-03-30	Teixeira	CE	\N
1598	f	1950-03-23	2021-12-28	Caldeira do Sul	MG	\N
1599	f	1942-09-24	2023-05-15	Duarte dos Dourados	AM	\N
1600	m	1987-12-11	2022-05-15	da Conceição de Novaes	PE	\N
1601	f	1999-10-08	2020-11-12	Martins	MS	\N
1602	f	1946-08-22	2022-03-25	Rocha de Minas	AP	\N
1603	f	1986-02-03	2022-07-22	Aragão	MT	\N
1604	m	1926-11-22	2022-04-06	Costela do Sul	MT	\N
1605	f	1946-01-14	2021-06-17	Azevedo da Prata	RS	\N
1606	f	1932-10-06	2022-03-03	Rodrigues	MT	\N
1607	m	1977-07-27	2021-02-09	Azevedo da Mata	SE	\N
1608	m	1999-02-06	2021-12-07	Cardoso Alegre	CE	\N
1609	f	1960-12-17	2020-10-30	Silveira	BA	\N
1610	f	1999-08-23	2021-02-23	Farias	PB	\N
1611	f	1951-10-30	2021-10-14	da Rosa	BA	\N
1612	m	1998-05-30	2021-11-13	Farias	RN	\N
1613	m	2003-04-25	2020-10-20	da Rocha da Prata	PE	\N
1614	f	1978-08-23	2023-09-05	Caldeira	PA	\N
1615	f	1967-11-29	2021-04-18	Cardoso	MG	\N
1616	f	1991-06-17	2023-03-14	Fogaça Verde	MG	\N
1617	f	1959-12-11	2021-03-26	da Luz	MS	\N
1618	m	1999-08-03	2020-10-28	Peixoto	TO	\N
1619	m	1982-10-24	2023-10-09	Rodrigues	RN	\N
1620	m	1956-03-22	2022-07-25	Ferreira	MT	\N
1621	f	1957-03-20	2023-01-10	Ribeiro	TO	\N
1622	f	1969-02-12	2022-07-22	Moura do Galho	PA	\N
1623	m	1965-07-24	2023-02-17	da Luz da Prata	PA	\N
1624	m	1982-08-25	2021-03-30	Gonçalves de Ramos	MG	\N
1625	f	1934-09-26	2020-12-04	das Neves de Aragão	RN	\N
1626	m	1969-01-12	2023-09-17	Barros dos Dourados	MS	\N
1627	m	1925-06-08	2022-06-21	Dias das Flores	SP	\N
1628	m	1947-08-03	2021-01-14	Barros do Campo	MG	\N
1629	m	1964-06-13	2022-12-20	das Neves de da Costa	PR	\N
1630	f	1951-07-25	2022-06-18	Novaes	RO	\N
1631	m	1995-01-07	2022-12-24	Oliveira	GO	\N
1632	m	1982-03-02	2023-04-24	Aragão de Goiás	MG	\N
1633	f	1952-05-28	2022-07-12	da Costa	BA	\N
1634	m	1927-03-28	2023-09-26	da Rosa do Oeste	RS	\N
1635	m	1957-03-08	2021-10-25	Mendes	AP	\N
1636	m	1965-06-29	2022-10-01	Nunes de Goiás	RR	\N
1637	m	1938-04-19	2021-08-27	Souza da Prata	CE	\N
1638	f	1992-01-03	2022-05-06	Viana	RN	\N
1639	m	2001-09-04	2021-05-11	Porto	SE	\N
1640	m	1928-11-05	2020-11-15	Melo	SE	\N
1641	f	1975-05-06	2022-08-15	da Cunha	PI	\N
1642	m	1950-07-25	2022-05-25	Viana	DF	\N
1643	f	1929-01-22	2021-04-25	da Rosa	AM	\N
1644	m	2002-12-21	2023-10-08	Martins	AP	\N
1645	m	1982-09-08	2023-03-23	da Mata de Minas	BA	\N
1646	m	1988-01-13	2022-02-02	Aragão	RO	\N
1647	m	1930-08-20	2023-01-13	Novaes	RO	\N
1648	m	1993-12-12	2023-02-11	Jesus	RJ	\N
1649	m	1957-10-23	2023-02-15	Ferreira	AL	\N
1650	m	1946-08-28	2021-09-07	Caldeira	AL	\N
1651	f	1949-02-10	2021-05-06	Araújo dos Dourados	DF	\N
1652	f	1939-03-28	2021-01-06	Fernandes	RN	\N
1653	f	1968-01-01	2021-09-08	Cunha da Praia	PR	\N
1654	f	1940-06-15	2022-12-21	Nunes Verde	MG	\N
1655	m	1975-10-04	2021-05-21	Fernandes do Campo	SC	\N
1656	f	1928-06-03	2022-09-12	Gonçalves Verde	MS	\N
1657	f	1984-02-19	2023-02-17	Souza	BA	\N
1658	m	1952-01-20	2022-04-12	da Cunha da Praia	SP	\N
1659	f	1943-05-08	2023-04-10	Barbosa	DF	\N
1660	m	1979-06-03	2020-10-15	Nogueira	RO	\N
1661	f	1942-09-12	2022-06-18	Lima	PI	\N
1662	m	1956-10-21	2023-05-08	da Rosa de Goiás	PB	\N
1663	m	1964-10-18	2021-06-30	Barros de Goiás	PB	\N
1664	m	1979-11-01	2022-04-15	Mendes	MG	\N
1665	f	1994-12-03	2022-08-30	Pereira	ES	\N
1666	m	1972-04-08	2022-01-06	Ramos	SP	\N
1667	f	1995-01-02	2021-07-13	Porto	PB	\N
1668	m	1996-01-02	2021-03-04	da Conceição das Flores	RR	\N
1669	m	1987-02-02	2020-12-30	Sales da Praia	SC	\N
1670	f	1965-06-05	2022-03-28	Carvalho	AC	\N
1671	f	1978-08-09	2023-02-06	da Luz Grande	AP	\N
1672	m	1934-06-09	2023-09-26	Fogaça Verde	MS	\N
1673	m	1962-11-28	2022-03-18	Nunes	MG	\N
1674	f	2003-07-30	2022-01-22	Melo	PI	\N
1675	f	1928-06-24	2023-08-08	Moreira	PB	\N
1676	m	1933-08-24	2020-11-28	Pires	PB	\N
1677	f	1947-10-30	2023-10-07	Oliveira da Praia	RO	\N
1678	m	1945-03-13	2022-11-27	Cavalcanti do Campo	BA	\N
1679	f	1984-08-08	2022-05-15	Costela de Goiás	RO	\N
1680	m	1972-05-21	2021-05-28	Sales	AP	\N
1681	f	1934-05-03	2023-01-13	Viana Paulista	AL	\N
1682	m	1993-11-02	2021-12-27	Alves Grande	SP	\N
1683	f	1989-12-25	2023-06-26	Ribeiro	GO	\N
1684	f	1969-01-20	2022-12-20	da Conceição	GO	\N
1685	m	1966-08-23	2023-02-20	Cardoso	MG	\N
1686	m	1948-07-14	2022-03-10	Pereira dos Dourados	PA	\N
1687	m	2003-09-01	2021-10-12	Silva Verde	DF	\N
1688	m	2001-11-21	2022-01-01	Souza de Cunha	SC	\N
1689	f	1989-11-16	2021-08-07	da Conceição de Peixoto	AP	\N
1690	f	1975-07-28	2023-02-05	Ramos das Pedras	AP	\N
1691	f	1959-10-01	2022-03-26	Azevedo do Oeste	AC	\N
1692	m	1957-01-28	2021-02-10	Pinto	MG	\N
1693	f	1978-07-05	2022-03-21	Freitas do Campo	PI	\N
1694	m	1972-02-16	2022-11-23	da Mata do Amparo	RN	\N
1695	f	1988-09-15	2022-11-08	Vieira de Costela	RJ	\N
1696	f	1987-07-02	2022-03-24	Araújo da Mata	MT	\N
1697	m	1958-08-27	2021-06-09	Nogueira	MA	\N
1698	m	1987-06-21	2021-08-23	Cardoso das Flores	SE	\N
1699	f	1969-02-27	2022-02-04	Caldeira	PA	\N
1700	m	1997-01-04	2021-01-06	da Mota	RJ	\N
1701	f	2000-10-28	2021-09-08	Ribeiro	ES	\N
1702	m	1981-10-09	2023-02-23	Costa da Praia	RJ	\N
1703	m	1989-01-30	2020-11-19	da Rocha	CE	\N
1704	f	1963-03-24	2023-07-23	Mendes	ES	\N
1705	m	1930-09-28	2021-04-30	Silva	AL	\N
1706	f	2001-04-12	2022-04-04	Dias da Praia	DF	\N
1707	m	1953-12-06	2021-04-24	Jesus	PE	\N
1708	m	1967-01-19	2021-04-20	Melo	PE	\N
1709	f	1958-03-07	2023-03-29	Monteiro	MG	\N
1710	f	1992-04-22	2022-08-08	Farias do Galho	RR	\N
1711	f	1989-01-30	2021-01-25	da Costa	RR	\N
1712	m	1961-06-27	2021-08-27	da Mota	DF	\N
1713	f	1937-02-15	2021-02-18	Cavalcanti	RJ	\N
1714	m	1952-08-23	2021-09-18	Gonçalves	AL	\N
1715	m	1993-04-29	2022-02-02	Barbosa	MT	\N
1716	m	1976-11-15	2022-07-06	Pinto do Norte	MS	\N
1717	m	1977-02-24	2023-02-06	da Cruz	GO	\N
1718	f	1983-12-17	2023-10-06	Nogueira	SC	\N
1719	m	1990-08-08	2023-08-16	Duarte do Campo	PR	\N
1720	m	1954-01-31	2020-11-09	Barbosa	SP	\N
1721	f	1946-04-08	2022-05-30	Vieira	AM	\N
1722	m	1999-11-14	2021-07-12	Caldeira de Minas	PA	\N
1723	m	1959-04-21	2022-03-26	das Neves do Amparo	RS	\N
1724	m	1933-07-03	2022-12-26	da Luz	MA	\N
1725	m	1992-06-07	2022-02-03	Souza	PA	\N
1726	m	2004-12-05	2022-10-13	Nascimento de da Rosa	MG	\N
1727	m	1991-03-30	2021-11-20	Lopes	RS	\N
1728	f	1960-05-28	2022-10-24	Santos de Minas	RJ	\N
1729	f	1943-08-03	2022-04-15	Fogaça de Minas	AP	\N
1730	m	1967-08-14	2022-05-19	Ribeiro	RN	\N
1731	f	1954-10-10	2023-07-08	Lopes	PR	\N
1732	f	2004-01-18	2023-06-17	da Rocha de da Cruz	MT	\N
1733	f	1972-10-06	2023-07-12	Ferreira do Oeste	MS	\N
1734	f	1957-12-18	2021-09-10	Nogueira	SE	\N
1735	f	2004-02-04	2020-11-21	Gomes do Norte	TO	\N
1736	f	1949-11-22	2022-10-27	Peixoto	PI	\N
1737	m	1971-01-28	2022-05-13	Moraes do Oeste	AL	\N
1738	f	1997-10-18	2021-11-26	Barros	RN	\N
1739	m	1972-10-27	2023-04-26	Nogueira de Minas	PB	\N
1740	f	2003-09-17	2020-10-22	Peixoto do Amparo	RS	\N
1741	m	1955-06-18	2022-03-04	da Rocha	PR	\N
1742	m	1980-02-02	2022-02-09	Moura	RJ	\N
1743	m	2001-10-09	2021-06-01	Aragão de Moraes	RR	\N
1744	f	1955-10-20	2021-08-09	Teixeira	MT	\N
1745	m	1932-12-07	2021-04-22	Rezende do Campo	RN	\N
1746	m	2000-01-14	2021-09-05	Araújo das Flores	MG	\N
1747	m	1942-03-11	2023-03-10	Ribeiro	AL	\N
1748	f	1951-10-05	2021-03-27	Souza de Cunha	DF	\N
1749	m	1975-12-25	2023-04-28	Melo Paulista	CE	\N
1750	m	1970-04-07	2023-05-28	Lima	RJ	\N
1751	f	1933-05-09	2023-07-05	Azevedo	PA	\N
1752	m	2000-04-24	2020-12-15	Cardoso	RO	\N
1753	f	1945-01-09	2023-03-01	Ribeiro	PB	\N
1754	f	2001-07-25	2022-07-28	Nogueira	RR	\N
1755	m	1987-12-18	2022-05-22	Cavalcanti	SE	\N
1756	m	1977-05-09	2022-03-16	Silveira de Souza	SE	\N
1757	m	1930-09-05	2022-04-18	da Cruz	SP	\N
1758	m	1986-11-07	2023-03-28	Almeida de Goiás	ES	\N
1759	m	1949-06-28	2023-05-25	da Costa do Campo	TO	\N
1760	m	1983-03-24	2022-08-29	Silveira das Flores	GO	\N
1761	f	1993-01-12	2021-05-06	da Mota	BA	\N
1762	f	1931-05-02	2021-11-13	Mendes	PR	\N
1763	m	1930-03-30	2022-11-06	Barbosa da Praia	PI	\N
1764	f	1954-11-06	2022-07-02	Rocha	ES	\N
1765	m	1985-09-24	2021-01-07	da Costa da Serra	PE	\N
1766	f	1938-06-19	2021-11-03	Fernandes	PR	\N
1767	m	1983-04-13	2022-09-03	Moura Paulista	RS	\N
1768	f	1956-03-29	2022-08-13	da Rocha do Campo	DF	\N
1769	f	1945-02-20	2023-07-03	Castro dos Dourados	RR	\N
1770	f	1981-09-25	2023-03-08	das Neves do Campo	MA	\N
1771	f	1958-12-27	2023-03-25	Ferreira de Goiás	MA	\N
1772	m	1997-07-16	2021-09-08	Silva dos Dourados	PB	\N
1773	f	1980-06-27	2022-12-22	Farias dos Dourados	SE	\N
1774	f	1981-07-21	2022-04-15	Nogueira de Alves	MS	\N
1775	m	1937-09-04	2021-09-01	Novaes do Galho	RR	\N
1776	f	1950-08-06	2021-10-03	Lopes	GO	\N
1777	f	1959-11-09	2023-05-14	Fernandes do Sul	ES	\N
1778	m	1966-09-25	2021-03-15	Nascimento	PA	\N
1779	m	1958-09-24	2023-08-20	Alves	DF	\N
1780	f	1945-07-17	2022-07-04	Ribeiro da Praia	RJ	\N
1781	f	1942-03-16	2023-03-28	Rezende	PI	\N
1782	f	1931-06-10	2022-02-08	Nascimento	PA	\N
1783	f	1927-05-06	2023-01-12	Ferreira	BA	\N
1784	m	1973-04-12	2022-12-29	da Cruz	PE	\N
1785	f	1980-11-10	2023-09-11	Lima	SC	\N
1786	f	1944-09-03	2021-10-30	Teixeira	MA	\N
1787	f	1950-10-17	2022-11-25	Cardoso	AC	\N
1788	f	1991-10-31	2023-04-09	Sales de Campos	MA	\N
1789	m	1937-04-27	2022-05-04	Teixeira	BA	\N
1790	m	1944-04-01	2020-10-12	da Cunha	AP	\N
1791	f	1944-09-28	2021-06-16	Caldeira	PB	\N
1792	m	1989-07-06	2023-07-28	da Mata	DF	\N
1793	m	1959-06-17	2023-01-02	Lima do Norte	RR	\N
1794	f	1926-04-15	2021-10-31	Barros	MT	\N
1795	f	1957-10-07	2022-02-06	Fogaça	RR	\N
1796	m	1969-02-09	2021-02-06	Duarte das Pedras	MS	\N
1797	f	2001-03-19	2021-01-30	Viana do Amparo	MA	\N
1798	f	1990-09-24	2023-05-01	Fernandes da Praia	MA	\N
1799	f	2004-09-28	2020-10-29	Viana	PB	\N
1800	m	1951-10-09	2022-02-12	Monteiro do Norte	MS	\N
1801	m	1931-10-22	2023-06-29	Alves do Campo	PB	\N
1802	f	1940-11-06	2023-09-03	Sales do Campo	PI	\N
1803	m	1941-12-10	2021-08-23	Santos	TO	\N
1804	m	1956-12-19	2023-04-08	Peixoto de Moreira	AM	\N
1805	m	1927-09-17	2023-02-23	da Mota	SP	\N
1806	f	1945-12-15	2021-08-16	Pinto do Campo	RR	\N
1807	f	1929-01-24	2023-05-15	das Neves	BA	\N
1808	m	1946-10-31	2021-05-06	da Rocha	PA	\N
1809	m	1946-03-02	2021-09-04	Rodrigues de da Mota	PI	\N
1810	f	1974-06-15	2021-08-25	Pires	AC	\N
1811	f	1966-07-24	2021-10-02	Ferreira de Ramos	MA	\N
1812	f	1990-02-15	2022-09-28	Aragão das Pedras	BA	\N
1813	m	1998-07-10	2021-08-02	Mendes	PE	\N
1814	m	1979-08-13	2021-02-21	Caldeira de Minas	AM	\N
1815	f	1966-05-27	2022-06-21	da Paz do Sul	MG	\N
1816	m	1934-02-10	2023-02-08	Costela de Barbosa	AP	\N
1817	m	1950-06-03	2023-09-27	da Paz	RO	\N
1818	f	1980-09-10	2022-08-21	Freitas	ES	\N
1819	m	1951-04-13	2022-11-15	da Cunha de Duarte	SP	\N
1820	m	1941-07-14	2021-04-23	Freitas	MT	\N
1821	m	1986-09-27	2021-11-25	Duarte dos Dourados	AC	\N
1822	f	1929-10-16	2021-06-09	Ribeiro	AP	\N
1823	f	1996-10-16	2022-03-09	Novaes do Sul	RN	\N
1824	f	1945-05-20	2023-08-15	Viana de Azevedo	AL	\N
1825	m	2000-11-12	2023-01-27	Duarte do Galho	CE	\N
1826	f	1976-03-06	2022-04-24	Novaes	AM	\N
1827	m	1984-07-27	2023-08-29	Nascimento	PE	\N
1828	m	1932-09-01	2022-11-24	Correia da Praia	RR	\N
1829	m	1980-03-13	2021-12-31	Rezende	BA	\N
1830	m	1986-11-19	2022-04-08	Peixoto	PE	\N
1831	m	1999-04-16	2023-02-28	da Mata Paulista	AM	\N
1832	f	1977-07-19	2021-09-18	Freitas	MT	\N
1833	f	1961-09-04	2023-01-10	da Mata de Porto	MS	\N
1834	m	1954-09-09	2022-10-14	Cunha	SP	\N
1835	f	1952-05-31	2022-10-01	da Costa	SE	\N
1836	f	1972-08-28	2023-07-02	Teixeira de Silva	RJ	\N
1837	m	1940-11-10	2022-11-24	Cardoso do Galho	CE	\N
1838	f	1956-08-01	2022-04-06	Barros	PB	\N
1839	m	2000-02-21	2023-09-07	Mendes da Praia	ES	\N
1840	m	1996-03-19	2022-08-01	Lopes	MA	\N
1841	m	1996-01-30	2023-03-09	Moraes de Castro	MA	\N
1842	m	1960-08-05	2020-10-11	Moreira	MS	\N
1843	f	1968-08-05	2021-04-11	Dias de Cardoso	AC	\N
1844	f	1935-07-09	2021-05-03	Campos dos Dourados	SC	\N
1845	m	1974-01-10	2023-02-25	Castro do Campo	AM	\N
1846	f	1956-07-09	2021-05-01	da Mota de da Costa	CE	\N
1847	m	1930-05-11	2022-04-27	Nunes dos Dourados	PI	\N
1848	m	1951-12-23	2021-05-22	Cunha de Silva	SP	\N
1849	m	1957-11-18	2021-07-21	Cardoso de Goiás	PR	\N
1850	f	1928-02-01	2021-08-31	Ramos	PB	\N
1851	m	1977-07-22	2022-02-27	Almeida do Amparo	RS	\N
1852	m	1929-06-28	2023-03-07	Souza	SP	\N
1853	m	1991-03-15	2023-07-12	Duarte	MS	\N
1854	m	1936-07-31	2021-04-04	das Neves	PI	\N
1855	f	1992-03-16	2023-02-07	Alves da Prata	AL	\N
1856	m	1975-02-06	2023-07-29	Ferreira Paulista	PI	\N
1857	f	1988-08-24	2022-07-30	da Mota de Ribeiro	SC	\N
1858	f	1945-02-21	2022-12-23	Ferreira	PA	\N
1859	m	1995-06-30	2022-05-09	Souza Verde	AL	\N
1860	m	1928-05-29	2022-04-14	Pires	GO	\N
1861	m	1993-03-13	2021-08-08	Rodrigues Grande	MA	\N
1862	m	1964-10-12	2022-03-13	Costa	PA	\N
1863	f	1942-07-27	2021-02-01	Silva	ES	\N
1864	f	1981-03-13	2022-11-30	Vieira	CE	\N
1865	f	2004-09-16	2022-12-12	Silveira Alegre	PI	\N
1866	f	1926-04-03	2022-03-27	Nunes Alegre	MT	\N
1867	m	1941-05-10	2023-01-31	Aragão de Moraes	SP	\N
1868	f	1928-05-26	2020-11-18	Cunha de Costa	PR	\N
1869	f	1969-09-03	2020-10-30	da Paz de Correia	RJ	\N
1870	f	1963-06-25	2022-10-01	Silva	RS	\N
1871	f	1941-02-08	2021-09-10	da Rosa de Monteiro	RR	\N
1872	m	1967-07-08	2022-10-16	Teixeira da Serra	RO	\N
1873	m	1943-11-06	2022-11-13	da Paz de Melo	PR	\N
1874	f	1930-11-22	2021-11-24	da Cruz	MA	\N
1875	f	1988-05-10	2023-09-29	Campos dos Dourados	MS	\N
1876	f	2004-06-16	2021-10-03	Vieira da Serra	PR	\N
1877	m	1933-11-26	2021-10-28	Pereira das Flores	RJ	\N
1878	f	1948-01-26	2022-08-09	Rezende	RS	\N
1879	f	1943-03-08	2020-11-02	Ramos	MA	\N
1880	f	1965-07-04	2021-06-16	Monteiro de Porto	AC	\N
1881	m	1979-09-22	2022-06-25	Cavalcanti do Campo	PE	\N
1882	m	1986-06-14	2021-12-31	Silveira	PA	\N
1883	m	1996-05-06	2023-01-13	Pires de Minas	AM	\N
1884	f	1960-01-10	2022-10-31	Santos Verde	ES	\N
1885	m	1967-03-23	2022-08-11	da Costa do Sul	SE	\N
1886	f	1927-07-28	2021-10-14	Nunes dos Dourados	TO	\N
1887	m	1982-01-31	2023-08-24	Caldeira de Souza	BA	\N
1888	f	1970-03-01	2021-04-13	Lopes da Prata	AL	\N
1889	f	1993-02-20	2021-04-18	Barbosa de Peixoto	PA	\N
1890	m	1974-08-21	2022-04-20	Nascimento da Serra	SP	\N
1891	f	1929-10-15	2023-01-30	Sales	CE	\N
1892	f	1950-05-22	2021-12-01	Campos	RN	\N
1893	f	1942-05-06	2021-02-06	Santos de da Mata	BA	\N
1894	m	1965-07-13	2023-05-03	Correia de Dias	MS	\N
1895	m	1966-03-26	2022-04-09	da Rosa	BA	\N
1896	f	1984-11-08	2023-06-11	Dias do Campo	SP	\N
1897	m	1959-05-10	2021-03-27	Barros de Fernandes	MG	\N
1898	f	1941-10-25	2022-06-18	Silveira	RS	\N
1899	f	2000-06-19	2022-07-26	Ribeiro Verde	PR	\N
1900	f	1987-06-26	2023-06-18	Gomes	BA	\N
1901	m	1998-01-27	2022-06-05	Moura	SE	\N
1902	f	1995-12-11	2021-11-17	Pinto	TO	\N
1903	m	1948-07-27	2020-12-24	Jesus Paulista	CE	\N
1904	f	1948-06-22	2023-09-24	Ramos de Porto	BA	\N
1905	m	1968-09-07	2021-04-19	Moreira do Campo	PB	\N
1906	f	1943-05-13	2022-04-26	Moura da Prata	AP	\N
1907	m	1994-08-14	2022-03-23	Rocha	SC	\N
1908	m	1966-06-02	2021-08-23	Lopes do Sul	PE	\N
1909	m	1966-04-11	2023-08-05	da Paz do Amparo	AP	\N
1910	m	1965-11-11	2023-01-12	das Neves de da Rocha	AM	\N
1911	f	1947-09-04	2021-07-28	Duarte da Praia	AL	\N
1912	f	1925-04-10	2022-06-15	Cardoso	SE	\N
1913	f	1991-10-26	2020-12-26	da Costa Verde	DF	\N
1914	m	1947-03-20	2022-06-07	Araújo	SE	\N
1915	m	1980-01-11	2023-03-17	Silveira	AC	\N
1916	m	1950-06-11	2022-02-17	Carvalho	AC	\N
1917	m	1998-08-01	2023-03-14	Vieira	MT	\N
1918	m	1934-03-05	2021-06-27	Pereira	RR	\N
1919	m	1960-02-15	2021-12-11	Teixeira	AL	\N
1920	f	1978-08-19	2023-03-15	Barbosa	RS	\N
1921	f	1993-01-15	2023-06-26	Mendes	AC	\N
1922	f	1925-04-22	2021-04-23	Cardoso da Serra	SP	\N
1923	m	1998-07-13	2022-02-03	Viana da Praia	RO	\N
1924	f	1983-12-29	2021-05-09	Lima	PR	\N
1925	f	1938-09-19	2021-02-17	Teixeira	RN	\N
1926	f	1946-11-17	2022-06-28	Campos	MG	\N
1927	f	1977-08-02	2022-05-06	Barros	PI	\N
1928	m	1992-04-24	2021-03-16	Silveira	PB	\N
1929	f	1987-08-31	2023-01-15	Moura	MS	\N
1930	m	1936-06-27	2021-04-19	Aragão de da Costa	AL	\N
1931	f	2005-11-09	2021-05-07	Farias	CE	\N
1932	m	1975-07-15	2022-05-07	Alves do Amparo	MG	\N
1933	f	1949-02-15	2021-11-27	Vieira	MS	\N
1934	f	1932-01-29	2023-09-12	Dias de Cunha	RN	\N
1935	f	1960-04-14	2023-08-19	Oliveira das Pedras	MA	\N
1936	f	1966-07-29	2022-09-19	da Mata do Sul	AM	\N
1937	m	1970-04-01	2022-12-20	Duarte de Goiás	MT	\N
1938	m	1955-01-13	2021-03-13	Castro Verde	MS	\N
1939	f	1966-04-03	2022-06-20	Almeida da Mata	GO	\N
1940	m	1986-02-01	2022-03-23	Novaes Verde	RS	\N
1941	m	1955-01-06	2021-08-23	Campos	MT	\N
1942	f	1955-06-25	2022-03-19	da Cunha	GO	\N
1943	f	1933-07-29	2023-02-08	Porto Alegre	SE	\N
1944	f	1998-07-08	2021-02-28	Martins	PI	\N
1945	f	1997-02-17	2022-07-18	Melo Paulista	BA	\N
1946	m	1964-09-06	2021-11-22	Fogaça da Mata	SP	\N
1947	f	1953-10-18	2022-10-01	Vieira do Amparo	AL	\N
1948	m	1954-11-23	2022-04-05	Moura da Praia	PE	\N
1949	f	1982-07-12	2022-09-27	Viana do Sul	MT	\N
1950	f	1974-06-10	2022-08-04	Sales	PR	\N
1951	f	1971-10-07	2021-06-23	Cavalcanti de Novaes	MT	\N
1952	f	1975-11-22	2023-06-23	Nogueira do Norte	DF	\N
1953	m	1975-02-14	2023-02-23	Almeida	MA	\N
1954	f	1939-02-16	2023-02-14	da Rosa de Castro	PA	\N
1955	m	1946-01-04	2022-08-16	Ramos de Moreira	PI	\N
1956	f	1996-05-15	2023-06-17	Peixoto	SP	\N
1957	m	1956-10-24	2020-11-22	Melo de Nascimento	AL	\N
1958	m	1952-03-02	2022-05-12	Santos	GO	\N
1959	m	1986-08-15	2023-02-23	Moura	RJ	\N
1960	f	2005-02-17	2021-12-12	Mendes	PI	\N
1961	f	1968-09-20	2021-04-15	Sales	SC	\N
1962	f	1926-06-25	2020-10-13	Barbosa da Prata	PI	\N
1963	m	1959-03-22	2022-11-24	das Neves Paulista	ES	\N
1964	m	1996-08-22	2022-03-02	Jesus	MT	\N
1965	f	2001-04-05	2023-01-06	Monteiro	GO	\N
1966	m	1949-02-25	2022-06-28	Carvalho	AC	\N
1967	f	2001-11-04	2022-04-24	Vieira	MG	\N
1968	f	1981-03-28	2020-11-22	Silveira do Campo	MG	\N
1969	m	1950-08-19	2022-06-21	da Conceição de Goiás	CE	\N
1970	m	1980-02-28	2020-12-30	Nunes	AL	\N
1971	f	1962-05-31	2022-09-11	Azevedo Paulista	DF	\N
1972	f	1951-03-09	2022-08-01	Silveira	GO	\N
1973	f	1936-01-26	2023-02-15	Porto	RR	\N
1974	f	1962-07-27	2022-12-11	Pinto	AC	\N
1975	f	1957-01-30	2023-04-19	Caldeira	RN	\N
1976	f	1933-08-14	2021-05-28	Rocha da Prata	MG	\N
1977	m	1934-10-28	2023-08-10	Rezende	MS	\N
1978	f	2003-01-12	2022-07-28	Oliveira	AP	\N
1979	m	1940-09-10	2021-07-06	Carvalho de da Rosa	MA	\N
1980	m	1954-03-10	2023-06-03	Alves Grande	RS	\N
1981	m	1933-08-04	2021-03-24	Cardoso de Pires	SE	\N
1982	m	1984-08-23	2022-05-08	da Costa	AL	\N
1983	m	1973-06-13	2020-12-20	Fernandes	AP	\N
1984	m	1978-06-05	2022-11-13	Teixeira do Norte	PE	\N
1985	m	1990-08-18	2021-11-27	Novaes	AP	\N
1986	f	1981-11-01	2023-01-23	Oliveira	RO	\N
1987	m	1977-07-08	2021-07-15	Farias de Goiás	AL	\N
1988	m	1951-12-03	2020-12-06	Gonçalves Verde	CE	\N
1989	m	1927-01-28	2023-02-26	Barbosa da Praia	PE	\N
1990	f	1962-02-10	2023-03-05	Nascimento	CE	\N
1991	m	1959-06-20	2021-06-09	Carvalho	PR	\N
1992	f	1982-03-15	2020-10-10	Fogaça de Goiás	RN	\N
1993	f	1969-02-17	2022-09-10	da Mata da Praia	MS	\N
1994	m	1974-06-15	2021-02-13	Aragão	ES	\N
1995	f	1940-11-14	2020-12-10	Novaes	MT	\N
1996	f	1983-07-08	2022-03-03	da Mata do Campo	AC	\N
1997	m	1944-12-07	2022-06-07	Jesus de da Cunha	TO	\N
1	m	1955-12-14	2022-11-05	Gonçalves de Goiás	AP	Geração Baby Boomers
2	f	2003-03-11	2023-03-30	Barros das Flores	AP	Geração Z
3	m	1992-08-15	2021-06-15	Martins	GO	Geração Y
4	m	1993-05-21	2023-01-23	Nunes de Fogaça	RO	Geração Y
5	m	1950-12-08	2022-05-12	Rodrigues	SP	Geração Baby Boomers
6	m	1993-02-26	2021-07-24	Campos de Minas	BA	Geração Y
7	m	1972-09-26	2022-10-30	Santos	RN	Geração X
8	m	1959-04-25	2023-08-17	Campos do Norte	MS	Geração Baby Boomers
9	f	2004-01-04	2021-02-02	Duarte	SC	Geração Z
10	f	1934-11-03	2022-08-21	Ferreira	PA	Geração Veterana
11	m	1951-02-01	2022-01-20	Porto	SC	Geração Baby Boomers
12	m	1995-08-21	2023-02-18	Moraes	MT	Geração Y
13	f	1965-04-01	2021-08-30	Melo da Praia	BA	Geração X
14	f	1932-11-12	2021-07-11	da Conceição das Pedras	MA	Geração Veterana
15	f	1997-08-15	2020-11-13	Correia	SP	Geração Z
16	f	1926-01-21	2022-09-18	Rezende de Nogueira	RJ	Geração Veterana
17	m	1979-02-25	2021-02-22	Correia	MG	Geração X
18	f	1987-11-29	2021-12-15	Alves Alegre	RR	Geração Y
19	m	1991-04-29	2023-10-06	da Costa	MG	Geração Y
20	f	1999-10-15	2021-09-01	da Rosa da Serra	RS	Geração Z
21	f	1926-10-03	2023-09-25	Moreira	SE	Geração Veterana
22	m	1955-09-09	2021-02-22	Cavalcanti	RN	Geração Baby Boomers
23	f	1984-07-21	2022-04-13	Freitas	PI	Geração Y
24	m	2005-07-25	2023-09-11	da Mota do Campo	GO	Geração Z
25	f	1949-05-08	2021-09-10	da Mata Verde	SE	Geração Baby Boomers
26	m	1992-10-07	2022-12-01	Silva de Silva	SE	Geração Y
27	m	1969-07-04	2021-07-06	Moraes	MA	Geração X
28	f	1963-04-20	2020-10-22	Alves	MG	Geração X
29	f	1934-07-31	2021-05-17	Freitas do Sul	AP	Geração Veterana
30	f	2001-05-01	2022-11-28	Pereira de Cardoso	AP	Geração Z
31	m	1947-09-19	2022-05-02	da Rosa	RO	Geração Baby Boomers
32	f	1934-07-14	2022-07-25	da Mata	AL	Geração Veterana
33	f	1997-12-15	2021-07-25	da Mata	PB	Geração Z
34	f	1947-12-01	2022-09-11	da Costa Verde	PE	Geração Baby Boomers
35	m	1987-10-14	2022-09-30	Martins	MA	Geração Y
36	f	1928-06-12	2022-06-16	da Paz	SP	Geração Veterana
37	f	1967-01-20	2021-09-11	Santos de Lopes	MS	Geração X
38	f	1934-01-28	2021-04-13	Pinto do Campo	AL	Geração Veterana
39	f	1988-06-02	2021-04-07	Ramos	CE	Geração Y
40	m	1926-05-13	2021-04-06	Gomes	PA	Geração Veterana
41	m	1957-09-05	2023-04-08	Cardoso	MS	Geração Baby Boomers
42	m	1944-07-28	2021-05-13	Fogaça da Prata	AP	Geração Baby Boomers
43	m	1943-10-16	2021-07-21	Nogueira	AM	Geração Baby Boomers
44	m	1933-07-25	2022-10-13	da Costa do Norte	DF	Geração Veterana
45	f	1935-10-07	2021-03-15	da Costa do Oeste	MS	Geração Veterana
46	m	1946-05-18	2023-03-28	Martins	MS	Geração Baby Boomers
47	f	1952-06-21	2022-05-27	da Mata do Sul	ES	Geração Baby Boomers
48	m	1988-10-17	2022-05-31	Costela de da Costa	SE	Geração Y
49	f	1992-12-05	2021-04-17	Dias	SC	Geração Y
50	f	1984-08-24	2020-10-25	Castro de Goiás	AL	Geração Y
51	m	1991-08-29	2021-01-11	da Rocha Grande	SE	Geração Y
52	m	1959-10-20	2023-05-08	da Paz	PA	Geração Baby Boomers
53	f	1991-06-15	2020-12-26	Nascimento	MG	Geração Y
54	m	1975-11-13	2022-02-02	Sales	PR	Geração X
55	m	1975-02-26	2020-11-03	Barbosa	PE	Geração X
56	m	1935-01-19	2022-06-26	Moura dos Dourados	GO	Geração Veterana
57	m	1945-05-31	2022-03-26	Teixeira da Serra	RJ	Geração Baby Boomers
58	f	1931-03-17	2021-12-27	Barbosa dos Dourados	MG	Geração Veterana
59	f	1943-07-13	2021-01-06	Teixeira	AL	Geração Baby Boomers
60	f	1979-07-29	2022-06-09	Vieira	MA	Geração X
61	f	1937-04-24	2023-01-06	Novaes da Serra	RJ	Geração Veterana
62	f	1939-08-09	2022-11-15	Barros	AM	Geração Veterana
63	f	1990-04-24	2023-07-18	Monteiro de Goiás	PI	Geração Y
64	f	1933-09-01	2023-03-29	Costela das Pedras	GO	Geração Veterana
65	f	1961-07-15	2022-10-12	Monteiro	PE	Geração X
66	f	1994-05-28	2022-02-15	Almeida	SC	Geração Y
67	f	1988-10-25	2023-02-03	Ramos de Monteiro	BA	Geração Y
68	f	1980-04-21	2020-12-17	Ferreira	PA	Geração Y
69	m	1993-10-14	2021-02-15	Nascimento	MS	Geração Y
70	f	1974-06-08	2021-07-19	Lima	ES	Geração X
71	f	1972-07-21	2023-07-26	Gomes de Goiás	PE	Geração X
72	m	1931-12-29	2022-07-10	Freitas de Duarte	MS	Geração Veterana
73	f	1995-09-12	2022-11-23	da Rocha	PB	Geração Y
74	f	1968-11-23	2021-01-16	Lopes	AL	Geração X
75	m	1970-03-11	2022-06-06	da Mota de Peixoto	MT	Geração X
76	f	1969-10-09	2022-01-13	Moura	SC	Geração X
77	m	2001-10-26	2023-04-16	Ramos	RJ	Geração Z
78	m	1956-05-18	2023-06-10	Viana Verde	SE	Geração Baby Boomers
79	m	1998-10-17	2023-09-04	Carvalho das Pedras	SC	Geração Z
80	m	1984-07-02	2022-09-23	Lopes das Flores	PI	Geração Y
81	f	1927-01-25	2022-05-12	Rodrigues	ES	Geração Veterana
82	m	1944-09-10	2023-01-25	Costa do Galho	GO	Geração Baby Boomers
83	f	1997-12-29	2022-01-10	Sales	AC	Geração Z
84	f	1932-10-10	2022-12-23	Farias	SE	Geração Veterana
85	m	1954-05-04	2023-04-24	Ribeiro	GO	Geração Baby Boomers
86	m	1965-01-18	2022-12-11	Monteiro de da Mata	RO	Geração X
87	f	1953-09-17	2021-01-16	Fernandes	SC	Geração Baby Boomers
88	f	1983-06-13	2021-03-07	da Mota	RR	Geração Y
89	m	1983-04-26	2023-03-21	Almeida da Serra	SP	Geração Y
90	f	1976-04-28	2022-11-07	Carvalho de Moreira	MG	Geração X
91	m	1961-05-17	2022-05-02	Moreira	AL	Geração X
92	f	1964-11-17	2023-02-16	Araújo de Minas	TO	Geração X
93	m	1958-09-16	2021-02-25	da Cruz	PR	Geração Baby Boomers
94	f	1934-06-29	2021-11-06	Castro	PI	Geração Veterana
95	f	1989-08-26	2022-05-16	Ferreira	MS	Geração Y
96	f	1957-08-19	2023-04-18	Teixeira das Pedras	RS	Geração Baby Boomers
97	m	1925-08-12	2021-11-21	da Conceição	MT	Geração Veterana
98	f	1947-04-17	2022-04-20	Campos	AL	Geração Baby Boomers
99	m	1981-08-27	2021-10-29	Cavalcanti	RN	Geração Y
100	m	2001-06-11	2022-08-17	da Luz	BA	Geração Z
101	m	1944-08-20	2022-02-11	Cunha da Mata	SP	Geração Baby Boomers
102	f	1956-09-27	2022-02-10	Barbosa de Pereira	MT	Geração Baby Boomers
103	f	1927-09-25	2021-12-06	Aragão	PB	Geração Veterana
104	f	1962-03-01	2023-05-17	Rodrigues do Amparo	SC	Geração X
105	f	1972-03-21	2021-04-03	Gomes da Prata	AC	Geração X
106	f	1955-02-14	2021-09-02	Aragão	MT	Geração Baby Boomers
107	f	1981-05-09	2022-07-01	Caldeira	RJ	Geração Y
108	m	1997-11-27	2023-01-10	Costela	PA	Geração Z
109	m	1927-08-07	2021-04-05	Moura de Dias	RO	Geração Veterana
110	m	1956-07-21	2023-08-13	Castro	AP	Geração Baby Boomers
111	f	2005-05-27	2022-03-17	Moura do Sul	TO	Geração Z
112	m	1978-03-23	2023-05-31	Barbosa do Galho	MS	Geração X
113	f	1949-05-14	2021-09-07	Silva	PA	Geração Baby Boomers
114	m	1930-06-03	2021-08-01	Dias	RR	Geração Veterana
115	m	1992-07-02	2022-01-08	Lopes	CE	Geração Y
116	m	1945-06-18	2023-02-22	Silva	AP	Geração Baby Boomers
117	m	2001-08-23	2022-03-05	Araújo	RS	Geração Z
118	f	1981-11-01	2023-03-06	da Rocha	AM	Geração Y
119	m	1983-11-23	2022-08-21	Freitas do Campo	AC	Geração Y
120	f	1941-01-07	2021-02-10	Pinto dos Dourados	MA	Geração Baby Boomers
121	f	1985-12-16	2021-11-18	Silva	CE	Geração Y
122	m	1935-01-31	2020-12-17	Campos	AM	Geração Veterana
123	f	1979-04-23	2022-11-30	Silva Grande	DF	Geração X
124	m	1967-05-21	2022-07-26	Caldeira	MS	Geração X
125	f	1925-08-01	2023-05-02	Silva	PR	Geração Veterana
126	f	1980-11-20	2022-02-10	Souza	ES	Geração Y
127	f	1933-06-27	2021-03-07	Melo das Flores	CE	Geração Veterana
128	m	1999-10-08	2021-02-14	Correia	PA	Geração Z
129	f	1971-02-18	2022-04-04	Rezende do Oeste	PE	Geração X
130	f	1965-09-21	2022-12-08	Caldeira	BA	Geração X
131	f	1990-03-02	2021-01-01	Moreira da Praia	MA	Geração Y
132	f	1989-02-02	2021-10-16	Silveira	MT	Geração Y
133	m	1933-09-20	2021-10-14	Vieira do Sul	RJ	Geração Veterana
134	f	1976-01-25	2022-05-03	Cavalcanti do Campo	CE	Geração X
135	f	1984-06-15	2023-01-21	Nascimento Grande	MT	Geração Y
136	f	1955-08-31	2023-06-07	Rezende	CE	Geração Baby Boomers
137	f	1941-04-05	2020-11-21	Silva	ES	Geração Baby Boomers
138	f	1997-05-23	2023-03-24	Silveira	MT	Geração Z
139	f	1937-09-22	2023-06-01	Martins	RJ	Geração Veterana
140	m	1966-12-16	2021-06-24	Nunes	PB	Geração X
141	m	1952-03-18	2022-06-28	Moura	PR	Geração Baby Boomers
142	f	1933-08-04	2022-02-12	Pereira Paulista	RJ	Geração Veterana
143	m	1977-08-20	2023-02-02	Fernandes	BA	Geração X
144	f	1950-06-02	2023-03-21	Nogueira	TO	Geração Baby Boomers
145	f	1955-10-13	2023-06-15	Dias	RN	Geração Baby Boomers
146	m	1997-05-25	2023-09-15	da Mata do Oeste	SC	Geração Z
147	f	1999-12-11	2023-09-26	da Rosa Paulista	AM	Geração Z
148	m	1989-07-02	2022-09-23	Rodrigues da Serra	GO	Geração Y
149	f	1946-11-13	2022-03-16	Almeida	AC	Geração Baby Boomers
150	f	1930-05-06	2021-08-31	Monteiro	MA	Geração Veterana
151	f	1931-02-20	2023-07-21	Cardoso	SE	Geração Veterana
152	f	1925-10-19	2022-03-13	Alves	CE	Geração Veterana
153	f	1941-12-09	2021-12-16	Costa de Freitas	MG	Geração Baby Boomers
154	m	2002-01-17	2022-08-10	Martins do Galho	AP	Geração Z
155	f	1939-10-27	2020-10-21	Porto	SE	Geração Veterana
156	m	1943-04-25	2022-07-07	da Rocha Alegre	GO	Geração Baby Boomers
157	f	1949-03-10	2023-10-07	da Rosa do Campo	PA	Geração Baby Boomers
158	f	1943-08-05	2023-08-02	Pires Alegre	MA	Geração Baby Boomers
159	m	1962-12-17	2022-01-06	Silva Grande	GO	Geração X
160	m	1991-12-22	2022-02-19	da Luz	PI	Geração Y
161	f	1989-08-28	2020-10-31	Moreira	PI	Geração Y
162	m	1928-03-02	2022-03-31	Costela das Flores	RN	Geração Veterana
163	f	1988-11-21	2020-11-26	Melo de Minas	SC	Geração Y
164	f	1931-10-02	2023-04-09	Silva	CE	Geração Veterana
165	m	1932-03-17	2022-09-17	Lopes	MG	Geração Veterana
166	m	1928-06-22	2023-01-16	Barbosa	AC	Geração Veterana
167	f	1979-02-23	2020-10-28	Fogaça	AL	Geração X
168	m	1992-10-30	2021-11-14	Oliveira	PI	Geração Y
169	f	1933-08-29	2023-10-07	Araújo de Minas	PE	Geração Veterana
170	f	1932-06-28	2021-04-02	Freitas das Flores	BA	Geração Veterana
171	f	1960-06-17	2021-07-29	Correia	MS	Geração X
172	f	1931-08-21	2022-02-06	Sales	SC	Geração Veterana
173	m	1940-07-27	2021-07-06	Peixoto do Sul	RO	Geração Veterana
174	m	1941-11-01	2020-12-11	Caldeira da Serra	RJ	Geração Baby Boomers
175	f	1960-01-31	2023-01-04	Aragão do Sul	GO	Geração X
176	m	1991-11-10	2023-09-05	Ramos de Monteiro	CE	Geração Y
177	f	1986-09-19	2022-04-17	Lima Alegre	RS	Geração Y
178	f	1942-08-05	2021-01-13	Cardoso da Prata	GO	Geração Baby Boomers
179	m	1980-07-15	2022-02-19	Pires	AP	Geração Y
180	m	1978-08-13	2022-03-15	Mendes do Oeste	RO	Geração X
181	f	1948-10-24	2021-04-15	Moura	PA	Geração Baby Boomers
182	f	1984-01-02	2021-07-12	Viana	MG	Geração Y
183	m	1968-02-21	2020-10-09	Cardoso	RR	Geração X
184	f	1970-02-13	2022-08-22	Pinto	AL	Geração X
185	f	1971-03-13	2022-10-09	da Mota do Campo	AL	Geração X
186	f	1945-08-08	2021-05-28	Lima	PE	Geração Baby Boomers
187	f	1934-09-18	2023-04-20	Carvalho de da Cruz	DF	Geração Veterana
188	f	1995-08-05	2020-11-30	Moraes	CE	Geração Y
189	m	1956-11-22	2021-01-03	Almeida	RR	Geração Baby Boomers
190	m	1931-07-06	2021-10-19	Moura	SE	Geração Veterana
191	f	1958-12-11	2021-09-05	da Cunha de Nogueira	MT	Geração Baby Boomers
192	m	2004-10-02	2023-10-08	Campos	PA	Geração Z
193	m	1931-02-08	2021-11-05	Ferreira	TO	Geração Veterana
194	f	1994-07-03	2021-12-24	Ribeiro	SE	Geração Y
195	m	1985-12-04	2022-05-24	Nascimento de Rodrigues	ES	Geração Y
196	m	1975-11-19	2021-12-21	Teixeira	SC	Geração X
197	f	1973-01-21	2023-06-23	da Paz	PR	Geração X
198	m	1929-01-05	2022-08-12	Carvalho	RR	Geração Veterana
199	f	1961-12-16	2021-08-04	Silveira	CE	Geração X
200	m	2005-08-10	2022-06-24	Porto Verde	MS	Geração Z
201	m	1987-05-09	2021-08-08	Dias	RS	Geração Y
202	m	1945-12-29	2021-10-11	Silva Paulista	AM	Geração Baby Boomers
203	f	1929-04-20	2023-01-29	da Paz	PI	Geração Veterana
204	m	1982-11-10	2022-10-08	Teixeira	SE	Geração Y
205	f	1953-04-08	2021-02-22	Porto	PB	Geração Baby Boomers
206	m	1937-09-09	2023-04-19	Silveira Grande	RO	Geração Veterana
207	m	1981-06-13	2020-11-16	Pereira	GO	Geração Y
208	m	1970-04-18	2021-06-18	Porto das Flores	PE	Geração X
209	f	1984-05-07	2022-12-08	Dias Verde	BA	Geração Y
210	m	1958-09-04	2022-09-13	Alves	CE	Geração Baby Boomers
211	m	1942-04-12	2022-10-30	Aragão	AL	Geração Baby Boomers
212	m	1981-09-17	2021-03-01	Cavalcanti	SP	Geração Y
213	m	1959-11-30	2023-07-15	Ribeiro de Goiás	AL	Geração Baby Boomers
214	f	1958-10-08	2022-03-19	Campos de Souza	AC	Geração Baby Boomers
215	m	1953-11-23	2023-06-04	Gomes Alegre	PE	Geração Baby Boomers
216	f	1944-12-18	2021-11-12	da Mota	MT	Geração Baby Boomers
217	m	1962-08-11	2021-08-30	da Paz	ES	Geração X
218	m	1943-07-10	2021-07-30	Santos das Flores	RS	Geração Baby Boomers
219	f	1964-02-22	2021-09-21	Lima das Pedras	PE	Geração X
220	f	1980-07-16	2020-11-20	Porto	AL	Geração Y
221	m	2001-10-17	2023-02-20	Cunha	AL	Geração Z
222	m	1963-09-22	2023-07-18	Lima	SC	Geração X
223	m	1940-03-06	2023-02-18	Rocha dos Dourados	MG	Geração Veterana
224	m	1950-08-27	2021-12-19	Ramos	MA	Geração Baby Boomers
225	f	1929-07-20	2023-02-10	Teixeira de Rocha	RJ	Geração Veterana
226	m	1972-03-22	2023-08-05	Rocha	RO	Geração X
227	f	1953-09-18	2023-07-26	Moreira	BA	Geração Baby Boomers
228	m	1979-08-11	2021-05-11	Fernandes da Serra	MT	Geração X
229	f	1955-03-31	2021-02-15	Rocha Verde	ES	Geração Baby Boomers
230	f	1966-11-03	2021-10-15	Ribeiro Alegre	PB	Geração X
231	f	1968-05-03	2020-12-10	Santos do Sul	BA	Geração X
232	f	1945-03-05	2023-09-23	Nunes de da Paz	RO	Geração Baby Boomers
233	f	1978-03-28	2023-05-02	Peixoto do Campo	MT	Geração X
234	m	1969-05-10	2022-09-08	Dias do Oeste	RR	Geração X
235	m	1925-12-15	2021-12-24	da Rosa	MA	Geração Veterana
236	f	1985-12-15	2021-01-06	da Rosa	PR	Geração Y
237	m	1973-10-02	2021-01-31	Mendes do Amparo	AL	Geração X
238	f	1996-06-21	2022-02-01	Castro de Barros	RN	Geração Z
239	f	1971-05-30	2023-03-02	Porto do Galho	RO	Geração X
240	m	1994-07-08	2022-03-17	Porto	PB	Geração Y
241	m	1942-12-04	2021-12-13	Teixeira	SE	Geração Baby Boomers
242	f	1984-01-28	2023-01-16	da Mata Verde	RS	Geração Y
243	f	1998-11-23	2022-11-08	Rocha do Galho	MA	Geração Z
244	f	2000-12-27	2022-09-25	Rocha	AC	Geração Z
245	f	1988-04-17	2022-05-12	das Neves	AP	Geração Y
246	m	1996-12-28	2022-06-28	da Costa Paulista	TO	Geração Z
247	f	1981-03-10	2023-09-23	Rezende	MS	Geração Y
248	f	1932-03-16	2023-04-24	da Conceição	RO	Geração Veterana
249	m	1966-05-15	2021-01-17	Nogueira	SC	Geração X
250	m	1949-05-09	2020-11-15	Viana do Campo	AL	Geração Baby Boomers
251	f	1951-08-31	2022-02-09	Alves	MG	Geração Baby Boomers
252	m	1962-08-01	2023-08-15	Cardoso	GO	Geração X
253	m	1952-03-20	2021-11-20	Aragão	MA	Geração Baby Boomers
254	f	1978-03-30	2022-01-01	Alves Grande	RJ	Geração X
255	m	1990-12-03	2023-09-06	Almeida de Nascimento	DF	Geração Y
256	m	1980-08-15	2021-04-05	Lopes da Prata	PA	Geração Y
257	m	1959-05-26	2021-12-31	Souza	RJ	Geração Baby Boomers
258	m	1996-11-20	2022-04-01	Barbosa dos Dourados	RJ	Geração Z
259	f	1946-10-16	2021-08-09	da Conceição	PA	Geração Baby Boomers
260	m	1988-10-07	2023-03-06	Teixeira Paulista	MT	Geração Y
261	m	1946-02-17	2022-04-24	Campos	RR	Geração Baby Boomers
262	f	1986-06-30	2021-08-10	das Neves Grande	RR	Geração Y
263	f	1928-06-28	2023-04-20	Vieira dos Dourados	RS	Geração Veterana
264	f	1959-01-05	2023-04-16	Sales	SP	Geração Baby Boomers
265	m	1925-10-08	2023-01-04	da Mota	SP	Geração Veterana
266	f	1978-04-02	2023-05-14	Silveira do Oeste	PB	Geração X
267	m	1955-06-12	2023-04-15	Sales de Goiás	ES	Geração Baby Boomers
268	f	1975-02-17	2021-11-26	Pinto	PR	Geração X
269	f	1950-12-23	2022-02-12	Farias Paulista	PA	Geração Baby Boomers
270	m	1991-06-28	2023-06-29	Ramos de Teixeira	MG	Geração Y
271	f	1962-04-11	2021-02-09	Costela	MA	Geração X
272	m	1949-11-18	2023-04-08	Nunes da Prata	RO	Geração Baby Boomers
273	m	1939-06-29	2021-06-16	Alves da Mata	MA	Geração Veterana
274	f	1967-11-10	2021-12-11	Ramos da Praia	AP	Geração X
275	m	1928-04-06	2021-06-11	Caldeira	MG	Geração Veterana
276	f	2005-08-15	2022-01-20	Alves de da Cruz	MA	Geração Z
277	m	1932-03-26	2023-02-04	Costela	SC	Geração Veterana
278	f	1995-10-09	2023-07-06	da Conceição da Serra	PB	Geração Y
279	m	1940-03-14	2020-11-19	Silva	SE	Geração Veterana
280	f	1931-01-01	2022-10-10	Oliveira	PI	Geração Veterana
281	m	1965-11-14	2023-01-11	Carvalho da Serra	DF	Geração X
282	m	1960-06-30	2021-03-28	Jesus	PA	Geração X
283	m	1957-01-09	2021-06-03	Oliveira	RR	Geração Baby Boomers
284	m	1937-06-09	2021-12-05	Porto dos Dourados	RN	Geração Veterana
285	m	1956-02-18	2022-07-04	Dias	RN	Geração Baby Boomers
286	m	1998-05-31	2021-04-30	Silveira do Galho	SP	Geração Z
287	f	1984-01-16	2022-11-14	Moreira dos Dourados	MG	Geração Y
288	m	1939-05-08	2021-09-26	Nunes das Pedras	MS	Geração Veterana
289	m	1980-12-19	2023-01-09	da Cunha de Lopes	PB	Geração Y
290	m	1971-10-07	2021-05-05	Alves	PB	Geração X
291	m	1957-07-19	2021-09-10	Cunha de Pinto	SE	Geração Baby Boomers
292	f	1979-07-09	2023-09-28	Fernandes de Goiás	CE	Geração X
293	m	1993-12-13	2020-11-06	Campos	PR	Geração Y
294	f	1996-01-27	2021-11-27	Lima	CE	Geração Z
295	m	1982-08-05	2021-09-02	da Cruz de Martins	AL	Geração Y
296	f	1929-02-09	2023-06-15	Azevedo	DF	Geração Veterana
297	f	1958-02-12	2022-08-08	Ramos	SC	Geração Baby Boomers
298	f	1991-01-06	2021-05-24	Santos da Serra	CE	Geração Y
299	f	2002-02-10	2023-06-25	da Paz	SC	Geração Z
300	m	1978-01-06	2023-01-02	Dias	AP	Geração X
301	m	1982-12-26	2021-07-22	Costa Verde	SP	Geração Y
302	m	1983-04-17	2022-06-30	Ramos da Praia	TO	Geração Y
303	m	1936-04-12	2021-09-26	Castro	RN	Geração Veterana
304	m	1991-07-20	2023-07-03	Silva	PE	Geração Y
305	m	1981-04-13	2021-03-27	Rezende das Flores	SC	Geração Y
306	m	1965-07-23	2022-10-30	Castro do Norte	ES	Geração X
307	f	1982-06-26	2021-12-27	Ramos Verde	DF	Geração Y
308	f	1964-02-17	2023-03-08	Moreira do Galho	RJ	Geração X
309	m	1929-12-29	2022-01-19	Cunha	PA	Geração Veterana
310	f	1934-05-04	2021-03-03	Caldeira	GO	Geração Veterana
311	f	1944-04-11	2023-10-07	Pereira	AP	Geração Baby Boomers
312	m	1944-07-21	2022-09-22	Farias dos Dourados	PA	Geração Baby Boomers
313	f	1962-06-04	2021-11-22	Rodrigues das Pedras	PR	Geração X
314	f	1968-06-18	2021-06-27	Jesus	RS	Geração X
315	f	1975-12-21	2022-08-27	Porto de Cunha	SE	Geração X
316	m	2004-10-02	2022-07-24	da Rocha Grande	RR	Geração Z
317	m	1936-07-17	2022-10-24	Fogaça	PI	Geração Veterana
318	f	1955-02-10	2022-05-19	da Rosa Verde	AM	Geração Baby Boomers
319	f	1942-06-14	2023-01-02	Moreira da Serra	BA	Geração Baby Boomers
320	m	1947-04-11	2021-02-23	Caldeira	SE	Geração Baby Boomers
321	m	1945-11-10	2023-02-24	Martins da Mata	AM	Geração Baby Boomers
322	f	1960-08-29	2021-09-21	Sales	AL	Geração X
323	m	1980-01-05	2023-03-24	Oliveira	MT	Geração Y
324	m	1999-02-04	2020-10-17	Costa de Farias	SC	Geração Z
325	m	1996-01-21	2023-01-06	Correia do Campo	RJ	Geração Z
326	m	2004-10-11	2021-04-15	Rezende	BA	Geração Z
327	m	1965-08-03	2021-07-29	da Costa da Serra	PR	Geração X
328	f	1991-06-17	2022-03-19	da Mota	RN	Geração Y
329	m	1989-07-02	2021-07-26	Souza	PB	Geração Y
435	f	1984-04-28	2021-01-28	Costela	PE	Geração Y
330	f	1954-03-06	2023-09-10	Moura de Cavalcanti	DF	Geração Baby Boomers
331	m	1960-01-17	2020-10-26	Araújo	RN	Geração X
332	f	1963-02-09	2023-07-03	Souza de Sales	PR	Geração X
333	f	1947-08-18	2022-10-23	Pires	RN	Geração Baby Boomers
334	f	1990-06-04	2021-10-24	Pereira de Minas	PA	Geração Y
335	f	1967-08-22	2022-11-10	Ribeiro do Norte	PI	Geração X
336	f	1941-12-14	2021-04-02	das Neves do Norte	MA	Geração Baby Boomers
337	m	1984-11-05	2021-03-24	Alves	RS	Geração Y
338	m	1927-12-03	2021-03-13	da Paz	AC	Geração Veterana
339	m	1990-12-09	2022-02-27	Rocha do Oeste	RS	Geração Y
340	m	1977-04-02	2022-03-04	da Conceição Alegre	PE	Geração X
341	m	1938-09-25	2021-07-08	Rezende	RR	Geração Veterana
342	f	2004-11-11	2022-02-24	Nascimento de Castro	AM	Geração Z
343	f	1985-06-04	2023-01-31	Vieira	PB	Geração Y
344	f	1981-07-10	2023-07-13	Cardoso	DF	Geração Y
345	m	1985-01-27	2021-04-05	Teixeira do Amparo	PB	Geração Y
346	f	1986-10-01	2022-07-27	Pereira Grande	SE	Geração Y
347	m	1950-12-22	2021-05-26	Teixeira de Goiás	SP	Geração Baby Boomers
348	f	1960-09-05	2021-03-16	Rocha do Sul	RS	Geração X
349	m	1959-10-19	2021-09-16	da Conceição	DF	Geração Baby Boomers
350	m	2002-04-04	2022-06-03	Gonçalves	SE	Geração Z
351	f	1957-04-04	2022-08-17	Dias Verde	PE	Geração Baby Boomers
352	m	1958-10-14	2023-03-06	Peixoto	PB	Geração Baby Boomers
353	m	1975-05-09	2021-07-22	Ramos de da Mata	RR	Geração X
354	f	1999-06-10	2021-02-22	Duarte	MS	Geração Z
355	m	1933-07-16	2023-09-25	Costela	RN	Geração Veterana
356	f	1948-08-19	2021-06-24	Ferreira Verde	SC	Geração Baby Boomers
357	m	1983-07-22	2020-12-23	da Cunha Grande	AL	Geração Y
358	m	1977-07-07	2022-07-03	Dias de Novaes	TO	Geração X
359	f	1981-02-11	2022-12-08	Lima	RR	Geração Y
360	f	1965-12-11	2022-03-31	Gomes	MS	Geração X
361	f	1997-02-15	2022-07-22	Cavalcanti	PE	Geração Z
362	m	1990-08-26	2021-04-19	da Mota da Praia	MT	Geração Y
363	m	2001-06-05	2023-08-10	Viana do Amparo	TO	Geração Z
364	f	1937-07-27	2021-06-27	Moraes	SE	Geração Veterana
365	f	1961-04-18	2021-11-04	Azevedo de Viana	RS	Geração X
366	f	1989-08-19	2023-10-05	da Conceição	MG	Geração Y
367	m	2004-08-27	2023-09-17	Campos	AM	Geração Z
368	m	1935-09-12	2022-01-08	da Cruz Grande	AC	Geração Veterana
369	m	1995-10-24	2023-08-09	Vieira	PI	Geração Y
370	f	1968-08-05	2022-11-26	Alves	RS	Geração X
371	m	1934-06-23	2021-09-20	Almeida de Goiás	PE	Geração Veterana
372	m	1946-09-08	2021-05-19	Mendes de Monteiro	CE	Geração Baby Boomers
373	f	1977-06-21	2021-05-03	Cavalcanti	TO	Geração X
374	m	1964-01-03	2022-02-27	da Luz do Norte	BA	Geração X
375	f	1984-11-25	2020-12-26	Nascimento	RR	Geração Y
376	f	1984-09-14	2020-11-26	Araújo	GO	Geração Y
377	f	1959-11-14	2021-04-14	Souza do Norte	SC	Geração Baby Boomers
378	f	1937-12-09	2020-11-28	Correia da Serra	MS	Geração Veterana
379	f	1999-07-19	2023-08-05	Nascimento Grande	RR	Geração Z
380	f	1976-06-14	2022-10-04	Moreira de Santos	AL	Geração X
381	m	1973-07-17	2023-07-18	Alves do Sul	SC	Geração X
382	f	2000-04-01	2022-11-16	Dias	MS	Geração Z
383	m	1958-01-13	2021-09-16	Dias Grande	PA	Geração Baby Boomers
384	f	1978-11-07	2020-10-16	Moura da Serra	RN	Geração X
385	f	1985-06-18	2021-01-18	Nogueira	AL	Geração Y
386	m	1965-07-26	2022-11-28	Nunes Verde	PI	Geração X
387	f	1948-01-09	2021-05-10	Porto	PB	Geração Baby Boomers
388	f	1961-05-14	2022-02-18	Viana	SP	Geração X
389	m	1958-04-13	2021-08-01	da Mata Grande	RO	Geração Baby Boomers
390	f	1974-08-08	2022-08-06	das Neves	MT	Geração X
391	f	1986-05-27	2020-10-16	Silva da Prata	RJ	Geração Y
392	f	1970-07-16	2021-04-29	da Cruz de Freitas	RN	Geração X
393	f	1984-02-06	2022-06-01	Dias	RN	Geração Y
394	f	1992-04-20	2021-09-01	Duarte	SE	Geração Y
395	m	1962-05-17	2022-02-20	Campos	SP	Geração X
396	f	1937-03-29	2022-05-11	Cardoso das Pedras	RS	Geração Veterana
397	f	1994-02-09	2021-06-26	da Costa	PR	Geração Y
398	m	1941-01-06	2021-01-02	Pires de Moura	RJ	Geração Baby Boomers
399	m	1976-07-30	2021-09-13	Cunha Grande	PI	Geração X
400	m	1925-12-02	2020-11-14	Sales	MG	Geração Veterana
401	f	1993-03-25	2023-06-15	Cunha	AC	Geração Y
402	f	1969-10-31	2022-05-22	Teixeira	AP	Geração X
403	m	1959-11-12	2022-11-13	Mendes da Mata	PI	Geração Baby Boomers
404	f	1987-04-17	2021-03-04	Mendes da Praia	RS	Geração Y
405	m	1992-06-04	2022-08-16	da Cunha	MS	Geração Y
406	f	1960-12-21	2022-09-17	Gonçalves	PI	Geração X
407	m	1986-01-15	2023-07-13	da Conceição	BA	Geração Y
408	f	1974-03-21	2022-07-05	Carvalho	RR	Geração X
409	f	1977-07-07	2022-01-20	Moraes	PI	Geração X
410	m	1963-10-08	2020-12-27	Souza Verde	PA	Geração X
411	m	1948-02-07	2022-09-03	Fernandes do Norte	MS	Geração Baby Boomers
412	f	1938-08-26	2022-03-12	Azevedo	MG	Geração Veterana
413	m	1943-04-01	2023-08-28	Nogueira	RN	Geração Baby Boomers
414	m	1993-05-21	2021-06-16	Cunha dos Dourados	PB	Geração Y
415	m	1980-01-07	2022-03-10	Fogaça	RR	Geração Y
416	m	1942-01-07	2022-02-10	Cunha da Serra	TO	Geração Baby Boomers
417	m	1965-11-07	2021-10-16	Cardoso de Teixeira	MS	Geração X
418	f	2000-05-06	2023-06-05	Fogaça de Rezende	PI	Geração Z
419	m	1983-02-25	2022-08-09	Rocha	SE	Geração Y
420	m	1998-06-24	2022-06-16	da Costa da Prata	GO	Geração Z
421	m	1993-12-14	2023-03-22	Gonçalves	MA	Geração Y
422	f	1953-12-11	2023-06-25	Ferreira	SC	Geração Baby Boomers
423	f	1933-07-20	2021-08-10	Alves	TO	Geração Veterana
424	f	1995-07-10	2022-04-17	Caldeira	RS	Geração Y
425	m	1957-06-01	2022-11-12	Novaes	ES	Geração Baby Boomers
426	m	1991-02-26	2021-08-29	Almeida	MS	Geração Y
427	f	1969-04-19	2021-12-11	Caldeira das Flores	AC	Geração X
428	m	2004-11-23	2021-06-16	Peixoto	SC	Geração Z
429	m	1926-11-30	2023-06-13	da Paz Alegre	PA	Geração Veterana
430	f	1950-01-02	2021-11-27	Pinto	SP	Geração Baby Boomers
431	f	1937-01-22	2022-07-24	Teixeira do Oeste	SC	Geração Veterana
432	m	1990-06-11	2021-04-02	Fernandes	SC	Geração Y
433	f	1961-08-24	2022-12-22	Porto de Carvalho	RJ	Geração X
434	f	1989-04-22	2022-07-02	Freitas	PI	Geração Y
436	m	1947-09-03	2023-09-06	Farias	TO	Geração Baby Boomers
437	m	1932-09-16	2022-01-13	Moura	AC	Geração Veterana
438	m	1947-10-14	2021-12-05	Moraes	MS	Geração Baby Boomers
439	f	1945-03-25	2023-01-28	Ramos	GO	Geração Baby Boomers
440	f	1992-05-26	2021-06-02	Cardoso da Serra	TO	Geração Y
441	f	1942-07-06	2021-08-02	Nunes de das Neves	PE	Geração Baby Boomers
442	m	2003-09-08	2020-10-31	Duarte dos Dourados	SC	Geração Z
443	m	1988-11-21	2021-01-08	Cavalcanti Alegre	MG	Geração Y
444	f	1946-06-06	2021-11-01	Lima	DF	Geração Baby Boomers
445	m	1979-05-21	2023-07-16	Silva de Goiás	ES	Geração X
446	f	1964-09-12	2021-01-16	Martins das Pedras	SC	Geração X
447	f	1942-08-11	2023-03-25	Oliveira	AL	Geração Baby Boomers
448	m	1941-08-08	2023-07-27	Ramos	AL	Geração Baby Boomers
449	m	1980-03-16	2022-03-08	Silva	PI	Geração Y
450	f	2001-09-29	2022-07-11	da Paz	CE	Geração Z
451	f	1985-03-29	2020-10-30	Vieira Grande	RJ	Geração Y
452	f	1993-01-12	2023-01-18	da Paz de Rocha	AP	Geração Y
453	m	1983-09-22	2021-11-19	Pereira	MT	Geração Y
454	f	1977-02-19	2021-09-19	Mendes da Prata	CE	Geração X
455	m	1938-01-22	2021-10-02	Caldeira das Pedras	AM	Geração Veterana
456	f	1948-11-02	2022-11-11	Araújo do Sul	MG	Geração Baby Boomers
457	m	1996-06-26	2021-10-01	Sales do Amparo	AP	Geração Z
458	f	1983-02-14	2023-04-20	Nascimento da Prata	RN	Geração Y
459	f	1971-07-06	2022-03-15	Sales	MS	Geração X
460	f	1988-10-13	2023-03-15	Campos de Moraes	AP	Geração Y
461	f	1995-07-03	2020-10-27	Martins	TO	Geração Y
462	f	1970-12-28	2022-10-19	Ramos	SE	Geração X
463	f	1950-07-17	2023-08-29	Monteiro	PB	Geração Baby Boomers
464	m	1994-09-03	2022-08-17	Castro das Flores	RJ	Geração Y
465	m	1981-11-29	2023-10-06	Rocha do Norte	PI	Geração Y
466	f	1983-04-28	2023-07-24	Barros	AP	Geração Y
467	f	1945-08-09	2022-06-23	Ramos de Pires	SE	Geração Baby Boomers
468	f	1962-12-30	2021-01-02	Monteiro	MA	Geração X
469	f	1987-05-30	2020-12-01	Lopes	SP	Geração Y
470	m	1933-12-12	2022-08-11	Nunes	RJ	Geração Veterana
471	f	1967-11-01	2020-11-19	Carvalho Alegre	RR	Geração X
472	f	1989-08-24	2022-09-27	Ribeiro de da Rocha	PI	Geração Y
473	f	1945-11-15	2021-10-12	Gomes Alegre	RO	Geração Baby Boomers
474	f	1930-01-07	2021-02-09	Almeida de Minas	AM	Geração Veterana
475	f	1953-06-30	2023-06-07	da Luz do Amparo	AL	Geração Baby Boomers
476	f	1949-09-18	2022-05-06	Lopes	ES	Geração Baby Boomers
477	f	1958-05-06	2022-12-26	Mendes	PB	Geração Baby Boomers
478	m	1977-06-05	2021-07-24	da Paz	BA	Geração X
479	m	1952-06-13	2022-02-24	Freitas de Lopes	ES	Geração Baby Boomers
480	f	1985-01-10	2021-11-03	Rezende de Farias	PE	Geração Y
481	f	1985-03-11	2021-12-18	da Mota das Pedras	RS	Geração Y
482	f	1925-11-03	2022-02-03	da Cruz Alegre	PE	Geração Veterana
483	f	1990-07-09	2021-03-17	da Conceição	PA	Geração Y
484	f	1952-07-02	2023-03-06	Cunha do Norte	AL	Geração Baby Boomers
485	m	1952-08-21	2022-05-31	Aragão do Sul	AC	Geração Baby Boomers
486	f	1926-12-17	2021-10-25	Rezende	SC	Geração Veterana
487	f	1934-02-06	2021-04-08	Monteiro	MA	Geração Veterana
488	f	1955-09-11	2023-02-08	Porto	MS	Geração Baby Boomers
489	m	1934-04-22	2023-01-01	Nascimento das Flores	PE	Geração Veterana
490	f	1953-10-11	2020-12-04	Aragão da Serra	DF	Geração Baby Boomers
491	f	1950-02-26	2023-03-10	Nunes	AP	Geração Baby Boomers
492	f	1932-08-15	2022-09-10	Correia da Praia	PR	Geração Veterana
493	m	1928-09-23	2022-08-04	Nascimento da Mata	RN	Geração Veterana
494	m	1968-09-03	2021-07-17	Fernandes de Ribeiro	PA	Geração X
495	m	1928-03-11	2022-01-22	Mendes da Prata	PR	Geração Veterana
496	f	1929-12-09	2020-12-28	Carvalho do Galho	PE	Geração Veterana
497	f	1965-02-12	2022-08-12	Dias de Minas	PA	Geração X
498	m	1944-05-25	2022-06-21	Freitas das Flores	RR	Geração Baby Boomers
499	m	1959-06-19	2021-10-08	da Cruz	PA	Geração Baby Boomers
500	f	1928-10-28	2021-09-17	Ramos	DF	Geração Veterana
501	f	1933-05-06	2022-12-16	Rezende	RO	Geração Veterana
502	f	1987-08-11	2020-11-13	Cardoso do Norte	SE	Geração Y
503	f	2000-10-23	2023-02-06	Pereira	AL	Geração Z
504	m	1932-08-10	2022-01-14	Nogueira de da Costa	RN	Geração Veterana
505	f	1978-04-13	2020-12-18	da Costa da Praia	PR	Geração X
506	m	1985-11-18	2023-06-08	Costa do Campo	BA	Geração Y
507	m	1960-08-04	2022-03-21	Barbosa	SP	Geração X
508	m	1947-06-03	2023-03-27	Fernandes de Costa	PA	Geração Baby Boomers
509	m	1983-05-13	2023-09-30	Alves	TO	Geração Y
510	m	1928-06-07	2021-10-30	Gomes de Correia	BA	Geração Veterana
511	m	1947-12-06	2022-03-22	Jesus de Cardoso	SE	Geração Baby Boomers
512	m	1937-01-01	2021-01-01	Silva de Minas	MG	Geração Veterana
513	f	1940-07-05	2021-05-07	Fogaça	RN	Geração Veterana
514	f	1927-01-24	2021-01-28	Almeida	PI	Geração Veterana
515	f	2005-05-14	2021-05-18	Cardoso do Amparo	CE	Geração Z
516	m	1926-03-18	2021-10-07	Lopes de da Costa	TO	Geração Veterana
517	f	1987-07-07	2021-07-12	Azevedo da Serra	PI	Geração Y
518	m	1970-05-12	2021-09-26	Peixoto	AP	Geração X
519	f	1983-10-30	2023-07-18	Nascimento do Galho	GO	Geração Y
520	m	2004-11-20	2021-10-12	Silva do Sul	RR	Geração Z
521	m	1989-04-22	2021-12-27	da Mata	RR	Geração Y
522	m	1966-01-18	2022-04-11	Nunes	RO	Geração X
523	f	1950-02-09	2022-10-03	Fernandes Verde	PA	Geração Baby Boomers
524	m	1952-09-19	2023-05-02	Barbosa do Campo	PE	Geração Baby Boomers
525	m	1998-09-13	2021-04-08	Barros de Castro	ES	Geração Z
526	m	1945-10-31	2023-06-03	Teixeira	AC	Geração Baby Boomers
527	m	1956-06-15	2021-06-25	Pinto	MA	Geração Baby Boomers
528	m	1967-06-22	2022-06-14	Moraes	MS	Geração X
529	f	1976-04-17	2022-05-02	Peixoto da Mata	AL	Geração X
530	f	1998-10-09	2021-07-22	Duarte	SP	Geração Z
531	m	1987-11-21	2021-03-22	da Costa dos Dourados	MS	Geração Y
532	f	1938-06-28	2023-07-12	Ribeiro de Minas	DF	Geração Veterana
533	m	1931-06-29	2022-07-06	Martins Paulista	ES	Geração Veterana
534	m	1963-11-15	2022-06-01	Almeida Verde	DF	Geração X
535	f	1989-05-28	2023-09-23	Dias	MA	Geração Y
536	m	1944-12-27	2021-02-19	Castro	PE	Geração Baby Boomers
537	f	1962-06-11	2021-03-10	Almeida de Costela	RN	Geração X
538	m	1987-05-21	2020-10-12	Pires Grande	SC	Geração Y
539	m	1970-07-11	2023-06-07	Lima Paulista	PI	Geração X
540	m	1932-02-12	2021-03-15	Pinto	SP	Geração Veterana
541	m	1976-05-29	2022-10-09	Novaes das Pedras	RS	Geração X
542	f	1976-10-05	2023-06-20	Viana	PA	Geração X
543	f	2000-12-27	2021-04-08	Jesus de Mendes	RN	Geração Z
544	m	1963-12-08	2020-10-12	Freitas	PB	Geração X
545	m	1989-10-14	2021-11-06	da Conceição	SC	Geração Y
546	f	1985-01-13	2021-09-04	Martins	MG	Geração Y
547	m	1952-07-25	2021-08-21	da Luz de da Mata	AC	Geração Baby Boomers
548	m	1975-12-06	2021-02-15	Sales	GO	Geração X
549	m	1969-01-12	2023-10-07	Cavalcanti de Almeida	AL	Geração X
550	f	1985-11-20	2021-11-28	da Conceição	PA	Geração Y
551	m	1947-02-25	2023-04-27	Lima do Amparo	RN	Geração Baby Boomers
552	f	1977-12-04	2022-07-28	Gonçalves Grande	SP	Geração X
553	f	1937-06-08	2022-09-14	da Paz	RO	Geração Veterana
554	f	1930-08-03	2023-04-07	Pires de Rocha	AC	Geração Veterana
555	m	1944-02-27	2023-05-02	Ribeiro de Goiás	BA	Geração Baby Boomers
556	f	1952-08-21	2021-02-16	Cunha de Minas	RO	Geração Baby Boomers
557	f	1964-02-01	2022-02-15	Castro	RO	Geração X
558	m	1926-08-05	2022-06-15	Dias	RR	Geração Veterana
559	m	1939-09-13	2021-04-21	Silveira de Goiás	SC	Geração Veterana
560	m	1992-04-02	2021-01-29	Lopes	TO	Geração Y
561	f	1964-08-22	2022-07-01	Viana Verde	SC	Geração X
562	f	1968-10-07	2021-05-23	Peixoto do Sul	GO	Geração X
563	m	1954-04-04	2023-08-16	Almeida dos Dourados	AM	Geração Baby Boomers
564	f	1934-10-18	2022-07-10	da Mata	BA	Geração Veterana
565	m	1995-07-31	2021-11-07	Fogaça	RJ	Geração Y
566	f	1990-02-23	2022-04-14	da Conceição	PA	Geração Y
567	m	1991-08-26	2023-06-07	Teixeira	AM	Geração Y
568	f	1993-11-05	2020-11-19	Moreira	CE	Geração Y
569	m	1926-01-27	2021-08-10	Aragão	PA	Geração Veterana
570	m	1946-05-24	2022-11-13	da Costa	MA	Geração Baby Boomers
571	m	1970-08-31	2021-01-31	Santos	SE	Geração X
572	m	1944-08-21	2021-06-25	da Cruz	PI	Geração Baby Boomers
573	m	1941-12-27	2020-10-30	Farias	MS	Geração Baby Boomers
574	m	1969-12-25	2021-02-17	da Mata de Rodrigues	SP	Geração X
575	f	1958-09-08	2022-07-18	da Cunha	MA	Geração Baby Boomers
576	m	1953-01-17	2021-07-04	Jesus de da Mota	AC	Geração Baby Boomers
577	f	1972-12-29	2023-01-31	Nunes do Norte	SE	Geração X
578	m	1975-05-18	2022-10-13	Dias da Prata	SP	Geração X
579	m	1966-06-20	2021-08-09	da Paz do Sul	MA	Geração X
580	f	1998-09-15	2023-01-30	da Rocha	AP	Geração Z
581	f	1968-04-20	2021-05-20	Duarte Paulista	PA	Geração X
582	m	1969-01-28	2023-04-22	Barros	MA	Geração X
583	f	1988-08-13	2021-05-30	da Cruz	MA	Geração Y
584	f	1999-05-07	2020-12-21	Novaes	AM	Geração Z
585	m	1956-06-04	2021-08-18	Ribeiro	MG	Geração Baby Boomers
586	f	1928-03-03	2023-01-22	da Mata	SC	Geração Veterana
587	m	1955-05-12	2023-08-14	da Rocha	PA	Geração Baby Boomers
588	m	1990-09-25	2021-03-31	Aragão	GO	Geração Y
589	f	2002-10-01	2023-10-09	Nascimento de Pires	RO	Geração Z
590	f	1932-10-08	2023-09-12	Fernandes	BA	Geração Veterana
591	f	2002-04-26	2023-05-31	Freitas de Minas	SC	Geração Z
592	m	1973-12-31	2022-01-18	Almeida	MS	Geração X
593	f	2001-04-21	2022-11-10	Silva de das Neves	MT	Geração Z
594	m	1963-02-14	2022-04-17	da Paz	AC	Geração X
595	f	1945-06-02	2020-10-29	da Rocha do Sul	TO	Geração Baby Boomers
596	m	1928-03-16	2022-09-11	Monteiro	BA	Geração Veterana
597	m	1949-09-13	2021-09-15	Monteiro do Campo	DF	Geração Baby Boomers
598	m	1980-08-21	2023-04-10	Fernandes	RS	Geração Y
599	f	2000-05-12	2023-01-31	Carvalho de Gonçalves	SP	Geração Z
600	m	1935-06-30	2023-07-10	da Cunha	PB	Geração Veterana
601	m	1947-08-25	2023-03-12	Pinto	ES	Geração Baby Boomers
602	m	1983-04-18	2023-09-17	Dias Grande	RO	Geração Y
603	f	1951-08-16	2023-09-04	Farias	AL	Geração Baby Boomers
604	f	1952-07-14	2022-02-05	Moraes	DF	Geração Baby Boomers
605	m	1949-04-05	2021-09-26	Souza	BA	Geração Baby Boomers
606	f	1946-01-23	2023-07-15	Mendes	RN	Geração Baby Boomers
607	m	1987-07-26	2022-09-22	Correia	ES	Geração Y
608	f	1934-04-06	2021-10-28	Araújo	DF	Geração Veterana
609	f	1963-08-24	2021-06-13	Dias do Galho	MA	Geração X
610	f	1987-12-20	2023-01-16	Alves	PR	Geração Y
611	f	1942-10-14	2023-03-15	Mendes	AM	Geração Baby Boomers
612	f	2002-05-13	2022-07-04	Cunha	PB	Geração Z
613	m	2002-01-24	2023-05-19	Costa	PR	Geração Z
614	f	1957-07-08	2023-08-11	da Cunha	PR	Geração Baby Boomers
615	m	1987-11-01	2021-08-26	Rezende	GO	Geração Y
616	f	1933-02-20	2022-06-21	Vieira	MS	Geração Veterana
617	f	1930-01-04	2022-06-25	Mendes do Sul	MT	Geração Veterana
618	m	1964-11-12	2022-10-31	Nascimento	SE	Geração X
619	f	1947-06-22	2022-05-25	Teixeira de Minas	MT	Geração Baby Boomers
620	m	1932-06-25	2020-11-09	da Cruz	RN	Geração Veterana
621	f	1985-02-14	2022-03-25	Rezende	MS	Geração Y
622	f	1956-10-13	2022-05-10	Cardoso	TO	Geração Baby Boomers
623	f	1983-11-22	2022-04-11	da Rosa da Serra	PE	Geração Y
624	f	1981-08-31	2023-06-20	Duarte	MA	Geração Y
625	f	1996-09-24	2022-03-11	Araújo	RS	Geração Z
626	f	1992-04-16	2022-12-24	Alves do Campo	MT	Geração Y
627	f	1944-12-18	2021-04-25	Martins da Prata	BA	Geração Baby Boomers
628	m	1981-10-28	2021-09-25	Pereira	MA	Geração Y
629	f	1961-02-01	2021-12-29	Almeida de Minas	RS	Geração X
630	m	1953-10-10	2023-06-08	Nunes	MS	Geração Baby Boomers
631	f	1975-03-30	2021-07-10	Silveira Grande	RR	Geração X
632	f	1972-12-05	2021-11-20	Dias de Pereira	RR	Geração X
633	f	1934-07-04	2021-01-24	Cavalcanti Verde	ES	Geração Veterana
634	f	1970-01-11	2021-01-24	Fernandes do Norte	MA	Geração X
635	m	1967-04-23	2022-06-22	da Luz do Oeste	MG	Geração X
636	m	1984-03-22	2021-08-05	Vieira	DF	Geração Y
637	f	2000-10-28	2022-12-23	das Neves	SP	Geração Z
638	f	1973-05-12	2022-10-22	Aragão da Prata	AC	Geração X
639	f	1930-04-25	2023-06-27	Farias da Praia	SP	Geração Veterana
640	m	1926-01-20	2022-07-21	Silva	AP	Geração Veterana
641	m	1945-04-01	2021-05-09	Barbosa da Praia	SE	Geração Baby Boomers
642	m	1970-03-09	2023-07-11	Cavalcanti das Flores	PR	Geração X
643	m	1951-09-18	2020-11-08	da Paz	RN	Geração Baby Boomers
644	f	1942-05-19	2022-02-27	Martins do Amparo	MS	Geração Baby Boomers
645	f	1968-10-15	2023-03-27	Ramos Verde	PE	Geração X
646	f	1932-10-27	2021-02-26	Souza Verde	RS	Geração Veterana
647	m	1933-02-19	2021-08-17	Ramos de Mendes	MG	Geração Veterana
648	f	1991-02-24	2022-01-17	Souza Paulista	DF	Geração Y
649	f	1965-01-18	2021-07-06	Ramos	MS	Geração X
650	m	1947-02-21	2021-11-16	Novaes	RR	Geração Baby Boomers
651	f	1993-02-08	2021-05-05	da Mata das Flores	AM	Geração Y
652	m	1983-07-16	2021-02-24	Peixoto da Mata	MG	Geração Y
653	m	2000-09-17	2021-09-13	Monteiro da Serra	AP	Geração Z
654	f	1982-12-14	2021-12-31	Campos de da Rosa	PB	Geração Y
655	m	1971-03-26	2020-12-02	Fernandes	PI	Geração X
656	f	1984-02-01	2023-04-04	Novaes da Prata	MS	Geração Y
657	f	1939-01-26	2022-11-01	Aragão do Amparo	AC	Geração Veterana
658	f	1967-07-31	2021-05-10	Correia	CE	Geração X
659	f	1963-02-21	2023-02-14	da Rocha	PI	Geração X
660	f	1929-11-04	2020-12-11	Teixeira	AC	Geração Veterana
661	f	2001-09-12	2021-09-16	Duarte da Praia	PB	Geração Z
662	f	1940-01-07	2023-06-22	Cardoso	PA	Geração Veterana
663	m	1941-07-17	2021-08-11	Silva	MT	Geração Baby Boomers
664	f	1956-03-02	2021-04-07	Carvalho	TO	Geração Baby Boomers
665	m	1965-09-07	2021-11-02	Fernandes	RR	Geração X
666	m	1930-06-13	2020-12-27	Lopes das Flores	RO	Geração Veterana
667	f	1943-11-13	2022-08-19	Jesus	MA	Geração Baby Boomers
668	f	1964-03-10	2021-06-20	da Conceição Paulista	PR	Geração X
669	m	1961-09-09	2021-08-12	Nascimento	TO	Geração X
670	m	1956-02-23	2023-03-29	da Luz	SC	Geração Baby Boomers
671	m	1954-02-21	2021-02-27	Souza da Praia	RS	Geração Baby Boomers
672	f	1984-03-17	2020-11-23	Almeida de Goiás	TO	Geração Y
673	f	1977-02-01	2021-05-20	Nascimento	TO	Geração X
674	m	1954-01-30	2022-11-22	Nascimento	MA	Geração Baby Boomers
675	f	1939-03-01	2023-01-23	Costa	PE	Geração Veterana
676	f	1995-11-01	2022-07-19	Pires	RO	Geração Y
677	m	1979-01-05	2022-11-08	Cavalcanti	AP	Geração X
678	m	1965-10-13	2022-10-23	Carvalho dos Dourados	MS	Geração X
679	m	1982-01-13	2021-11-01	Rodrigues	MG	Geração Y
680	f	1977-02-12	2021-04-05	Rodrigues Alegre	GO	Geração X
681	m	1964-01-31	2021-01-18	Azevedo do Galho	RJ	Geração X
682	f	1939-02-20	2023-02-11	da Conceição	RS	Geração Veterana
683	m	1946-10-07	2020-10-21	Mendes	SE	Geração Baby Boomers
684	f	1986-08-21	2022-02-16	Pires das Pedras	AP	Geração Y
685	f	1925-07-20	2022-02-17	da Rocha	RJ	Geração Veterana
686	f	1941-04-08	2023-07-21	Rezende	PA	Geração Baby Boomers
687	f	1993-09-01	2020-10-20	Souza	PI	Geração Y
688	m	1971-07-02	2022-03-27	Barbosa de Cardoso	PA	Geração X
689	f	1965-07-15	2022-05-31	Santos de Minas	SC	Geração X
690	f	1979-06-26	2022-12-18	Mendes	SC	Geração X
691	m	1973-10-11	2022-08-28	da Mata do Campo	PE	Geração X
692	m	1977-10-12	2023-02-14	Mendes de Moraes	RJ	Geração X
693	m	1980-10-22	2021-10-05	da Rocha Alegre	TO	Geração Y
694	f	1978-12-29	2021-06-01	Barbosa Paulista	SC	Geração X
695	f	1972-06-07	2021-04-21	Barros	GO	Geração X
696	m	1978-07-20	2022-11-05	da Rosa	MG	Geração X
697	f	1990-06-19	2021-07-17	Gomes	CE	Geração Y
698	f	1973-10-08	2023-03-17	Sales	RR	Geração X
699	m	1989-09-04	2022-08-27	Silveira	MT	Geração Y
700	m	1928-12-27	2022-12-14	Alves	GO	Geração Veterana
701	m	1975-08-12	2021-04-02	Freitas	ES	Geração X
702	f	1952-02-12	2021-08-30	Moraes do Campo	MT	Geração Baby Boomers
703	m	1936-10-18	2022-03-02	Rodrigues	RS	Geração Veterana
704	f	1974-11-11	2022-02-27	Gomes	TO	Geração X
705	f	1961-07-31	2021-07-23	Correia	PE	Geração X
706	m	1936-08-31	2021-04-11	Ribeiro Verde	MS	Geração Veterana
707	m	1985-07-21	2020-11-03	Almeida de Goiás	MS	Geração Y
708	m	1971-04-16	2021-01-20	Silveira de Goiás	BA	Geração X
709	f	1982-09-16	2022-12-18	Ribeiro de Vieira	ES	Geração Y
710	f	2002-05-21	2023-06-14	Farias do Amparo	SP	Geração Z
711	f	1981-07-20	2023-05-02	Ramos	AP	Geração Y
712	f	1992-08-28	2021-05-21	Martins do Norte	PE	Geração Y
713	m	1987-01-27	2021-01-30	Fogaça da Prata	ES	Geração Y
714	m	1943-07-31	2021-05-10	Martins	PE	Geração Baby Boomers
715	m	1957-11-20	2022-08-06	Almeida	RR	Geração Baby Boomers
716	m	1966-10-17	2021-02-27	Correia das Pedras	SC	Geração X
717	f	1947-08-07	2023-06-14	Cavalcanti da Mata	RR	Geração Baby Boomers
718	m	1936-02-08	2021-04-10	Pires do Oeste	DF	Geração Veterana
719	m	1982-07-06	2023-03-28	Rocha	AC	Geração Y
720	m	1943-05-14	2021-04-15	Costa de Santos	AL	Geração Baby Boomers
721	f	1983-06-13	2021-01-12	Cunha	PR	Geração Y
722	m	2001-05-28	2023-05-27	Aragão	CE	Geração Z
723	f	2001-03-25	2021-04-28	Moreira de Freitas	RS	Geração Z
724	m	1965-08-27	2020-10-22	Ribeiro de Costela	MS	Geração X
725	f	2000-10-06	2022-06-25	Barbosa da Praia	PI	Geração Z
726	f	1966-03-08	2022-01-28	Lima	SE	Geração X
727	m	1946-02-21	2022-04-19	Cunha	PI	Geração Baby Boomers
728	m	1941-02-07	2021-04-22	Pires de Moreira	MG	Geração Baby Boomers
729	f	1987-12-22	2021-06-08	Cunha	PR	Geração Y
730	m	2002-04-19	2020-10-24	Cavalcanti	AL	Geração Z
731	f	1964-12-23	2022-06-05	Jesus	RS	Geração X
732	f	1930-11-12	2022-08-20	Alves	PR	Geração Veterana
733	f	1999-08-01	2022-10-11	Mendes	MG	Geração Z
734	m	1928-01-26	2021-11-19	Santos de Goiás	AL	Geração Veterana
735	m	1944-05-04	2023-06-20	Porto	DF	Geração Baby Boomers
736	m	1985-05-11	2022-02-12	da Cunha do Sul	PB	Geração Y
737	m	1971-08-07	2020-11-11	Viana Alegre	RS	Geração X
738	m	1950-11-02	2023-01-08	Cardoso	BA	Geração Baby Boomers
739	m	1964-05-17	2021-06-16	Azevedo	PA	Geração X
740	m	1983-10-27	2021-07-01	da Mota	AL	Geração Y
741	f	1943-04-18	2021-06-21	Gonçalves de Minas	GO	Geração Baby Boomers
742	f	1926-11-07	2022-12-19	Oliveira da Serra	PA	Geração Veterana
743	f	1959-08-23	2023-06-23	Caldeira do Oeste	RS	Geração Baby Boomers
744	m	1971-09-27	2023-04-29	da Paz do Campo	DF	Geração X
745	m	1977-04-26	2021-04-28	Costa	RJ	Geração X
746	f	1940-02-06	2020-11-15	da Rocha do Oeste	BA	Geração Veterana
1998	m	1999-08-13	2021-06-13	Porto da Mata	AM	\N
747	m	1962-07-16	2022-11-25	da Rosa da Serra	AL	Geração X
748	f	1979-07-25	2021-03-11	da Conceição dos Dourados	AC	Geração X
749	f	1954-03-18	2021-01-02	Cardoso das Pedras	RR	Geração Baby Boomers
750	m	1942-01-22	2021-06-02	Lopes de Jesus	RJ	Geração Baby Boomers
751	m	1932-02-29	2023-03-17	Nascimento de Minas	RJ	Geração Veterana
752	f	1962-12-20	2020-11-14	Azevedo de Goiás	BA	Geração X
753	f	1964-03-19	2023-09-21	Cardoso Alegre	PI	Geração X
754	f	1987-05-13	2022-01-30	Azevedo de Castro	RR	Geração Y
755	f	1966-09-14	2023-06-15	Nogueira	SP	Geração X
756	f	1933-05-18	2023-08-25	Oliveira das Flores	AL	Geração Veterana
757	m	1958-07-14	2021-12-01	Martins	GO	Geração Baby Boomers
758	m	1982-10-19	2021-11-13	Dias das Pedras	RJ	Geração Y
759	m	1976-04-22	2020-11-01	Santos do Norte	RS	Geração X
760	f	1939-05-30	2022-01-13	Ferreira	RJ	Geração Veterana
761	m	1940-01-31	2022-07-03	Campos	SP	Geração Veterana
762	m	1944-01-05	2023-09-11	Mendes de Almeida	RN	Geração Baby Boomers
763	f	1951-11-10	2022-07-20	Rezende de Vieira	GO	Geração Baby Boomers
764	f	1994-04-20	2020-12-02	Barros	BA	Geração Y
765	f	1967-11-07	2023-02-02	Moraes do Galho	PA	Geração X
766	f	1978-05-14	2022-05-08	Teixeira da Prata	MG	Geração X
767	f	1991-04-11	2022-06-06	Castro Grande	DF	Geração Y
768	f	1968-01-29	2021-11-25	Martins	AC	Geração X
769	m	1961-08-22	2023-08-20	Sales de Minas	RR	Geração X
770	f	1936-10-03	2022-12-08	Pinto do Amparo	RR	Geração Veterana
771	m	1992-03-22	2022-09-19	Silveira	PI	Geração Y
772	m	1941-08-09	2022-03-25	Rocha	RR	Geração Baby Boomers
773	m	1987-12-15	2023-03-16	Viana	AM	Geração Y
774	f	1992-02-28	2023-01-15	Novaes do Oeste	RR	Geração Y
775	m	1950-04-28	2023-09-05	Teixeira	SE	Geração Baby Boomers
776	m	1997-03-13	2021-05-17	das Neves das Pedras	TO	Geração Z
777	m	1927-08-06	2020-11-02	Moura	PE	Geração Veterana
778	f	1967-09-03	2022-08-24	Caldeira de Alves	RJ	Geração X
779	m	1929-06-08	2021-04-26	Moreira da Serra	BA	Geração Veterana
780	m	1982-09-16	2023-09-19	Gomes	RN	Geração Y
781	f	1981-09-21	2022-03-22	das Neves das Pedras	SC	Geração Y
782	f	1998-11-06	2023-03-06	Fogaça	PE	Geração Z
783	m	1989-03-24	2023-03-14	Pires de Costa	PR	Geração Y
784	m	1980-06-03	2021-06-28	Silveira	AL	Geração Y
785	f	1972-05-11	2022-05-06	Santos	RJ	Geração X
786	m	1938-03-24	2022-11-05	Cavalcanti Paulista	MS	Geração Veterana
787	f	1931-10-19	2020-12-19	da Rocha Verde	MG	Geração Veterana
788	m	1933-11-10	2023-10-06	Moraes	MS	Geração Veterana
789	f	1990-03-03	2023-03-03	Costa	MG	Geração Y
790	f	1960-09-02	2022-08-16	Pires de Carvalho	PE	Geração X
791	f	1962-02-06	2022-09-28	Gomes da Mata	RS	Geração X
792	m	1978-05-23	2022-05-29	Pires Alegre	PE	Geração X
793	m	1950-07-28	2021-06-23	Nascimento Verde	AL	Geração Baby Boomers
794	m	1948-03-19	2021-08-27	das Neves de Pinto	PI	Geração Baby Boomers
795	f	1939-02-23	2022-05-16	da Rosa	RN	Geração Veterana
796	m	1956-08-11	2021-07-12	da Mota	RR	Geração Baby Boomers
797	f	1959-04-09	2023-09-11	Sales	RN	Geração Baby Boomers
798	f	1957-04-02	2022-10-11	Caldeira das Pedras	BA	Geração Baby Boomers
799	m	1940-12-11	2021-06-22	Correia	TO	Geração Veterana
800	m	1958-01-14	2021-03-13	Jesus do Norte	AP	Geração Baby Boomers
801	m	1990-02-19	2022-07-18	Azevedo	AL	Geração Y
802	m	1980-12-24	2023-05-23	Teixeira Paulista	RJ	Geração Y
803	m	1984-07-07	2023-06-08	Viana da Serra	RR	Geração Y
804	m	1950-08-28	2021-05-16	da Cunha de Goiás	DF	Geração Baby Boomers
805	m	1991-03-13	2021-02-15	Moraes	PR	Geração Y
806	f	1961-05-24	2021-08-29	da Costa	AL	Geração X
807	m	1967-09-30	2022-08-16	Duarte	MA	Geração X
808	m	1985-11-03	2021-12-01	Teixeira	RJ	Geração Y
809	f	1995-03-01	2023-09-28	Fogaça	BA	Geração Y
810	f	1982-02-16	2022-03-07	Monteiro de da Conceição	GO	Geração Y
811	f	1981-04-08	2022-01-12	Rodrigues	PI	Geração Y
812	f	1925-09-08	2021-12-20	da Cunha	DF	Geração Veterana
813	f	1962-06-29	2023-03-26	da Rosa de Fogaça	MS	Geração X
814	f	1958-05-10	2023-06-23	Gomes do Norte	SE	Geração Baby Boomers
815	f	1996-11-28	2021-12-08	Ramos	RS	Geração Z
816	m	1975-02-16	2021-07-06	Monteiro de Goiás	MT	Geração X
817	m	1948-10-14	2020-10-10	Ferreira de Sales	MA	Geração Baby Boomers
818	m	1994-04-01	2021-03-26	Carvalho do Galho	PR	Geração Y
819	m	1962-09-17	2021-07-23	Moura	RJ	Geração X
820	m	1969-01-17	2023-02-10	Monteiro	GO	Geração X
821	f	1953-08-26	2023-09-04	Fogaça do Campo	SC	Geração Baby Boomers
822	f	1926-12-31	2021-07-13	Viana de Monteiro	SP	Geração Veterana
823	m	1982-10-17	2020-12-13	Campos	CE	Geração Y
824	m	1990-03-05	2021-04-20	da Mota das Flores	RS	Geração Y
825	f	1937-11-30	2022-08-02	Cunha do Campo	TO	Geração Veterana
826	f	1971-08-23	2022-12-20	Cardoso de Porto	RS	Geração X
827	m	1999-07-31	2021-01-15	Costa dos Dourados	RJ	Geração Z
828	m	1997-12-16	2022-04-16	Carvalho	MS	Geração Z
829	f	1935-08-28	2022-09-30	Porto	CE	Geração Veterana
830	m	1975-05-31	2023-03-11	Gonçalves das Pedras	PA	Geração X
831	f	1987-02-01	2021-04-27	Fernandes	MA	Geração Y
832	f	2005-07-22	2021-01-12	Castro do Campo	PA	Geração Z
833	f	1976-03-16	2023-09-05	Cardoso da Prata	GO	Geração X
834	f	1997-04-10	2021-04-20	Vieira Verde	GO	Geração Z
835	m	2003-10-12	2020-12-29	Souza	RJ	Geração Z
836	f	1957-05-18	2023-10-01	da Mota	AL	Geração Baby Boomers
837	f	1958-04-19	2023-04-14	Carvalho da Praia	ES	Geração Baby Boomers
838	f	1988-02-29	2021-12-31	Cunha da Mata	AP	Geração Y
839	f	1975-10-27	2023-09-29	da Mota	CE	Geração X
840	m	1963-12-02	2023-01-08	da Rosa de da Rosa	RR	Geração X
841	m	1977-05-21	2020-10-20	Alves	MG	Geração X
842	m	1943-09-25	2023-04-24	Dias	MG	Geração Baby Boomers
843	m	2002-05-14	2023-03-15	Silveira	SC	Geração Z
844	m	1985-12-22	2020-11-05	da Cruz	MS	Geração Y
845	m	1988-03-10	2021-09-08	Souza	PA	Geração Y
846	f	1954-10-20	2020-12-18	Gonçalves Grande	CE	Geração Baby Boomers
847	m	1938-11-14	2022-05-21	Mendes do Amparo	DF	Geração Veterana
848	m	1939-04-07	2021-07-28	Teixeira	RR	Geração Veterana
849	m	1987-07-13	2022-11-12	da Rosa de Ribeiro	AM	Geração Y
850	m	1926-02-24	2021-06-27	da Mota	PE	Geração Veterana
851	m	1944-08-07	2023-01-30	Pinto Alegre	MT	Geração Baby Boomers
852	f	1952-08-17	2020-11-09	da Mata Grande	PR	Geração Baby Boomers
853	f	1928-02-20	2023-01-15	Freitas	MA	Geração Veterana
854	f	1954-11-13	2021-03-12	Cardoso	MT	Geração Baby Boomers
855	f	1944-11-12	2023-07-20	Barbosa Alegre	PI	Geração Baby Boomers
856	f	1953-02-16	2022-02-01	Dias de Correia	SC	Geração Baby Boomers
857	f	1952-07-22	2022-12-24	Martins de Caldeira	SP	Geração Baby Boomers
858	f	1952-12-20	2022-02-14	Porto	SE	Geração Baby Boomers
859	m	1976-08-14	2022-09-28	Mendes de Lima	RR	Geração X
860	f	2004-02-18	2023-05-10	Melo do Oeste	DF	Geração Z
861	f	2001-07-04	2022-11-01	Fernandes de Mendes	RR	Geração Z
862	m	1937-10-26	2022-01-09	Martins	PI	Geração Veterana
863	f	1938-03-17	2021-02-04	Carvalho Verde	MG	Geração Veterana
864	f	1967-01-09	2023-07-20	da Mota	RN	Geração X
865	f	2001-12-07	2022-11-27	Duarte	AP	Geração Z
866	m	1989-12-23	2022-01-13	das Neves	SP	Geração Y
867	f	1964-04-06	2022-08-14	Moraes	PR	Geração X
868	m	1998-01-25	2021-11-20	Farias	MA	Geração Z
869	m	1984-03-27	2022-11-09	Alves do Amparo	DF	Geração Y
870	m	1953-11-04	2023-08-29	da Cruz	PE	Geração Baby Boomers
871	m	1945-08-30	2020-12-24	Freitas	RN	Geração Baby Boomers
872	f	1974-02-22	2021-06-05	Duarte do Galho	MG	Geração X
873	f	1948-11-28	2022-07-24	Gomes da Prata	PA	Geração Baby Boomers
874	m	1967-01-24	2022-11-19	Alves	AM	Geração X
875	f	1947-06-18	2021-10-17	da Luz	PA	Geração Baby Boomers
876	f	1966-05-28	2021-06-22	da Conceição	SE	Geração X
877	m	1952-05-24	2021-05-27	Aragão	AL	Geração Baby Boomers
878	m	1940-07-23	2022-11-19	Almeida de da Cruz	AM	Geração Veterana
879	m	1963-09-28	2022-04-24	Cardoso do Sul	TO	Geração X
880	m	1944-04-08	2023-02-21	Nascimento	AC	Geração Baby Boomers
881	f	1929-02-10	2023-07-15	Sales	AM	Geração Veterana
882	m	1976-06-11	2022-10-04	Costa de Vieira	SC	Geração X
883	f	1928-04-20	2020-11-09	Azevedo	PE	Geração Veterana
884	m	1957-08-19	2021-03-23	Araújo da Serra	PA	Geração Baby Boomers
885	f	1944-03-28	2020-12-05	Novaes	SC	Geração Baby Boomers
886	f	1997-08-01	2022-03-02	Campos do Norte	RR	Geração Z
887	m	1947-10-01	2020-11-14	Fernandes dos Dourados	PB	Geração Baby Boomers
888	m	1962-02-19	2023-07-04	Gonçalves	ES	Geração X
889	m	1964-04-29	2022-04-23	da Conceição de da Mota	PA	Geração X
890	m	1937-02-10	2022-08-04	Moraes	RR	Geração Veterana
891	m	1942-07-19	2023-05-13	Fernandes	AC	Geração Baby Boomers
892	f	1963-08-29	2023-03-15	Mendes do Amparo	TO	Geração X
893	f	1951-03-11	2022-09-18	Nogueira	PI	Geração Baby Boomers
894	m	1983-03-18	2021-12-05	Alves	TO	Geração Y
895	f	1995-10-12	2021-08-14	Farias	PI	Geração Y
896	f	1958-10-10	2021-12-09	Monteiro	BA	Geração Baby Boomers
897	f	1986-10-24	2022-10-16	Almeida	AL	Geração Y
898	m	1948-10-24	2022-07-09	Costela	DF	Geração Baby Boomers
899	f	1943-01-10	2023-06-12	Oliveira	PR	Geração Baby Boomers
900	m	1992-04-06	2021-10-13	Gonçalves	MG	Geração Y
901	m	1979-12-14	2022-10-29	Martins do Oeste	SC	Geração X
902	f	1993-05-22	2020-10-10	Lima Paulista	MG	Geração Y
903	f	1979-11-08	2021-01-18	Azevedo Paulista	AM	Geração X
904	f	1956-04-06	2023-07-19	Barros	RJ	Geração Baby Boomers
905	f	1968-11-20	2023-07-28	Rodrigues	PE	Geração X
906	f	1969-08-29	2022-12-24	Souza do Amparo	PR	Geração X
907	f	1994-12-04	2023-01-22	Araújo	GO	Geração Y
908	m	1970-10-27	2022-09-30	Nascimento do Amparo	RN	Geração X
909	m	1985-04-28	2021-01-11	Castro	RJ	Geração Y
910	m	1960-04-13	2022-12-22	Caldeira de das Neves	MG	Geração X
911	f	1970-11-19	2023-09-26	Gomes	MG	Geração X
912	f	1934-03-20	2021-05-06	Lopes de das Neves	MS	Geração Veterana
913	m	1979-10-02	2020-12-25	Alves da Praia	RS	Geração X
914	f	1984-08-10	2023-03-09	Correia	TO	Geração Y
915	f	2003-12-13	2022-02-15	Novaes do Galho	SP	Geração Z
916	m	1979-07-09	2022-01-12	Martins	RS	Geração X
917	m	1985-12-06	2022-08-15	Barros Alegre	PR	Geração Y
918	m	1988-06-17	2022-01-18	Barbosa	PI	Geração Y
919	m	1953-11-22	2023-05-14	da Paz	MG	Geração Baby Boomers
920	f	1966-05-05	2022-01-28	Moura de Lopes	MT	Geração X
921	m	1927-01-08	2021-07-03	Caldeira Paulista	PI	Geração Veterana
922	f	1958-11-09	2022-10-14	da Conceição	RN	Geração Baby Boomers
923	f	1985-10-29	2023-05-03	Pinto	AM	Geração Y
924	f	1952-02-05	2023-01-26	Ribeiro	BA	Geração Baby Boomers
925	f	1944-08-21	2021-09-08	Campos	AC	Geração Baby Boomers
926	m	1949-04-16	2023-05-12	Farias	BA	Geração Baby Boomers
927	m	1928-02-17	2021-06-01	da Rosa	PA	Geração Veterana
928	m	1970-09-12	2021-12-23	Viana	PA	Geração X
929	f	1932-01-17	2022-07-31	Caldeira Verde	DF	Geração Veterana
930	f	2002-01-11	2022-06-26	Souza da Prata	SP	Geração Z
931	m	1954-04-15	2022-02-08	Castro	SP	Geração Baby Boomers
932	f	1954-10-20	2021-01-03	Silveira da Mata	CE	Geração Baby Boomers
933	m	1992-07-13	2022-07-13	da Rosa	AC	Geração Y
934	f	1948-03-15	2021-12-31	Cardoso	MA	Geração Baby Boomers
935	m	1962-04-23	2022-09-07	da Costa de Goiás	ES	Geração X
936	f	1982-06-07	2021-07-09	Caldeira	RS	Geração Y
937	f	1954-06-25	2023-04-22	Pinto do Galho	MS	Geração Baby Boomers
938	f	1936-12-15	2023-05-24	Barbosa	MA	Geração Veterana
939	f	1930-08-15	2022-04-21	Nascimento	CE	Geração Veterana
940	m	1948-09-16	2022-05-29	da Mata	PE	Geração Baby Boomers
941	f	1997-04-09	2023-03-22	Lima de Porto	SP	Geração Z
942	m	1947-08-12	2022-09-02	Caldeira	CE	Geração Baby Boomers
943	f	1957-07-08	2023-08-22	da Rosa	GO	Geração Baby Boomers
944	m	1954-11-06	2022-09-11	Freitas do Norte	GO	Geração Baby Boomers
945	m	1979-07-14	2021-04-10	Nunes	MS	Geração X
946	m	1948-11-08	2022-10-20	Cunha	DF	Geração Baby Boomers
947	f	1962-08-21	2022-09-13	Pereira das Pedras	PI	Geração X
948	f	1968-09-29	2022-12-14	Pinto de Santos	BA	Geração X
949	m	1999-07-27	2023-05-06	Dias	RR	Geração Z
950	f	1997-01-26	2021-07-01	Gomes do Amparo	TO	Geração Z
951	m	1978-12-19	2022-11-22	Nogueira da Prata	RS	Geração X
1999	m	1981-08-16	2023-06-05	Nunes	AM	\N
952	m	1927-02-09	2022-09-08	Silva da Prata	AL	Geração Veterana
953	f	1945-06-21	2023-02-10	Moraes	RO	Geração Baby Boomers
954	f	1943-07-20	2021-09-27	Peixoto de Moraes	AC	Geração Baby Boomers
955	m	1966-10-28	2023-09-27	Nunes	MT	Geração X
956	m	1976-11-14	2023-07-13	Vieira da Prata	MS	Geração X
957	m	2004-05-07	2020-11-30	Fogaça	MT	Geração Z
958	f	1970-10-18	2022-09-18	Correia de da Paz	SE	Geração X
959	f	1943-10-23	2021-02-02	Teixeira das Flores	AC	Geração Baby Boomers
960	m	1999-06-17	2021-03-28	da Costa do Amparo	AL	Geração Z
961	m	1949-02-17	2022-05-06	Monteiro	CE	Geração Baby Boomers
962	m	1985-05-12	2022-02-06	da Costa Alegre	DF	Geração Y
963	m	1967-03-15	2023-07-10	Novaes	PE	Geração X
964	f	1978-08-11	2020-11-16	Cardoso	MS	Geração X
965	f	1944-12-04	2023-09-12	Pinto	PA	Geração Baby Boomers
966	f	1964-05-31	2021-12-19	Cavalcanti de Santos	MG	Geração X
967	m	1929-05-30	2023-05-28	Moreira das Pedras	SP	Geração Veterana
968	m	1980-03-03	2020-11-06	Peixoto Alegre	BA	Geração Y
969	m	2001-02-26	2021-10-11	Ferreira	MA	Geração Z
970	m	1970-07-31	2021-01-07	Caldeira da Mata	CE	Geração X
971	m	1963-06-06	2022-01-25	Pinto do Sul	ES	Geração X
972	m	1958-03-02	2023-08-17	Cunha de Dias	SP	Geração Baby Boomers
973	f	1963-08-11	2022-05-16	Novaes	PA	Geração X
974	m	1965-10-23	2021-05-13	Nogueira	GO	Geração X
975	f	1995-11-08	2020-12-22	Almeida	RS	Geração Y
976	m	1970-09-01	2023-06-10	Peixoto	AM	Geração X
977	f	1972-07-06	2020-12-18	Nascimento de Minas	DF	Geração X
978	m	1999-02-24	2022-02-01	Campos do Norte	PR	Geração Z
979	f	1940-01-20	2021-03-11	Pires do Norte	ES	Geração Veterana
980	m	1925-06-30	2022-06-30	Campos	MG	Geração Veterana
981	f	2000-10-24	2022-03-07	Costela de Goiás	PA	Geração Z
982	f	1999-10-15	2022-03-25	Freitas	SE	Geração Z
983	m	1927-06-06	2022-04-05	Costa	MS	Geração Veterana
984	f	1974-07-02	2023-06-30	Lopes	MA	Geração X
985	m	1969-10-28	2021-09-05	Jesus	PB	Geração X
986	f	1970-12-02	2021-05-28	Souza da Serra	MA	Geração X
987	m	1959-04-05	2022-01-18	da Rocha	BA	Geração Baby Boomers
988	m	1960-10-25	2021-01-22	Araújo da Praia	PB	Geração X
989	m	1993-12-29	2021-07-30	Novaes Verde	RJ	Geração Y
990	f	1994-10-28	2023-09-11	Souza de Goiás	CE	Geração Y
991	f	1926-05-09	2022-08-21	Alves da Prata	PI	Geração Veterana
992	f	1935-01-18	2021-09-22	Mendes	RO	Geração Veterana
993	m	1983-02-19	2022-09-22	Rodrigues Alegre	PR	Geração Y
994	f	1951-05-20	2023-05-07	Cardoso de Souza	RR	Geração Baby Boomers
995	m	1964-11-14	2023-09-26	Peixoto da Mata	AP	Geração X
996	m	1925-08-28	2022-04-19	Rodrigues da Prata	AM	Geração Veterana
997	m	1984-06-11	2021-02-23	Aragão	PA	Geração Y
998	m	1983-08-23	2022-07-11	Gonçalves do Amparo	AL	Geração Y
999	f	1987-10-28	2021-06-10	Ribeiro da Prata	RR	Geração Y
1000	m	1929-04-02	2022-09-23	da Cunha da Serra	GO	Geração Veterana
2000	m	1949-08-01	2021-12-19	da Mata	CE	\N
\.


--
-- TOC entry 4803 (class 0 OID 16558)
-- Dependencies: 220
-- Data for Name: jogos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogos (id, data_jogo, hora_jogo, time_casa, time_fora, gols_time1, gols_time2) FROM stdin;
1	2023-10-08	19:00:02	Internacional	Gremio	3	2
2	2023-10-08	19:00:30	Fluminense	Botafogo	0	2
3	2023-10-08	19:01:49	Palmeiras	Santos	1	2
4	2023-10-08	21:30:10	Atletico Mineiro	Coritiba	1	2
5	2023-10-08	21:30:21	Fortaleza	América Mineiro	3	2
6	2023-10-08	21:30:25	Atletico Paranaense	Bragantino-SP	1	1
7	2023-10-08	19:00:02	Internacional	Gremio	3	2
8	2023-10-08	19:00:30	Fluminense	Botafogo	0	2
9	2023-10-08	19:01:49	Palmeiras	Santos	1	2
10	2023-10-08	21:30:10	Atletico Mineiro	Coritiba	1	2
11	2023-10-08	21:30:21	Fortaleza	América Mineiro	3	2
12	2023-10-08	21:30:25	Atletico Paranaense	Bragantino-SP	1	1
\.


--
-- TOC entry 4801 (class 0 OID 16535)
-- Dependencies: 218
-- Data for Name: resultado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resultado (id, clientes_id, data_acesso, buyin, winning, rake) FROM stdin;
2	2	2023-09-11	981.25	846.9	134.35
4	4	2023-07-20	270.56	946.02	-675.46
5	5	2023-10-08	339.89	1153.62	-813.73
6	6	2023-02-10	669.42	1176.82	-507.4
7	7	2023-07-23	636.35	1040.12	-403.77
11	11	2023-06-09	906.47	1818.18	-911.71
12	12	2023-07-06	976.81	1421.95	-445.14
13	13	2023-06-09	944.58	446.01	498.57
14	14	2023-05-21	355.34	5.59	349.75
15	15	2022-10-10	118.17	548.96	-430.79
16	16	2023-06-29	965.66	1783.81	-818.15
17	17	2023-05-25	422.66	318.27	104.39
18	18	2022-10-23	918.88	287.51	631.37
19	19	2023-03-07	416.47	1275.23	-858.76
20	20	2023-04-13	253.35	779.58	-526.23
21	21	2023-06-21	996.29	1931.08	-934.79
22	22	2023-08-26	750.91	354.41	396.5
23	23	2022-10-19	529.79	135.77	394.02
77	77	2023-03-14	656.57	212.32	444.25
78	78	2023-01-02	863.6	47	816.6
79	79	2023-03-31	857.34	1371.12	-513.78
80	80	2022-11-23	978.78	597.09	381.69
81	81	2023-09-19	711.19	1450.02	-738.83
82	82	2023-07-01	968.45	1939.94	-971.49
83	83	2023-04-15	234.75	1012.74	-777.99
84	84	2023-08-08	432.6	1222.01	-789.41
85	85	2023-01-10	868.38	1270.86	-402.48
86	86	2023-04-15	349.51	110.19	239.32
87	87	2023-03-22	992.18	1132.6	-140.42
88	88	2022-11-03	538.82	664.11	-125.29
89	89	2022-12-30	335.82	141.83	193.99
90	90	2023-07-04	926.24	642.68	283.56
91	91	2023-09-06	962.24	675.78	286.46
92	92	2023-06-26	403.35	29.57	373.78
93	93	2023-03-15	345.83	1226.49	-880.66
94	94	2023-07-22	809.44	1487.7	-678.26
95	95	2023-01-10	731.47	1614.27	-882.8
96	96	2023-04-01	814.77	651.97	162.8
97	97	2022-12-20	180.1	667.14	-487.04
98	98	2023-03-27	765.28	1480.06	-714.78
99	99	2023-04-05	673.83	1298.6	-624.77
100	100	2023-04-24	496.38	9.82	486.56
101	101	2023-06-23	205.27	4.01	201.26
102	102	2023-05-21	490.1	152.4	337.7
103	103	2023-04-19	338.76	1144.53	-805.77
104	104	2023-01-27	608.18	155.18	453
105	105	2023-04-16	793.27	1443.45	-650.18
106	106	2023-01-27	608.55	1259.04	-650.49
107	107	2022-11-11	888.59	1733.81	-845.22
108	108	2023-08-14	365.75	720.52	-354.77
109	109	2023-02-04	696.49	123.05	573.44
110	110	2022-12-07	232.89	1133.01	-900.12
111	111	2022-10-30	821.13	1677.4	-856.27
112	112	2022-12-17	724.83	50.37	674.46
113	113	2023-07-19	331.66	1097.86	-766.2
114	114	2023-02-14	684.71	73.37	611.34
115	115	2023-01-25	589.88	1107.33	-517.45
116	116	2023-02-10	442.42	169.95	272.47
117	117	2023-06-26	423.16	163.73	259.43
118	118	2023-06-07	129.87	303.77	-173.9
119	119	2023-09-13	235.27	26.1	209.17
120	120	2023-08-26	650.92	798.89	-147.97
121	121	2023-10-06	554.14	321.05	233.09
122	122	2023-05-28	884.52	62.29	822.23
123	123	2023-04-27	153.42	924.55	-771.13
124	124	2023-02-15	830.52	1435.43	-604.91
125	125	2023-07-14	892.36	1722.03	-829.67
126	126	2022-10-22	810.58	550.94	259.64
127	127	2023-09-13	356.96	59.05	297.91
128	128	2023-01-14	721.51	345.53	375.98
129	129	2022-10-21	185.62	513.07	-327.45
130	130	2023-06-09	107.34	857.98	-750.64
131	131	2022-11-20	121.97	486.66	-364.69
132	132	2023-01-25	318.11	942.48	-624.37
133	133	2023-01-31	861.56	134.79	726.77
134	134	2023-04-24	264.12	149.24	114.88
135	135	2022-12-05	841.24	1741.48	-900.24
136	136	2023-08-31	265.21	380.73	-115.52
137	137	2022-10-27	721.25	1147.62	-426.37
138	138	2023-01-14	250.6	974.16	-723.56
139	139	2023-06-14	811.9	643.4	168.5
140	140	2022-10-23	999.6	1137.5	-137.9
141	141	2023-07-11	754.3	1749.11	-994.81
142	142	2023-08-04	914.6	1266.78	-352.18
143	143	2023-08-25	966.39	727.18	239.21
144	144	2023-06-07	609.79	54.99	554.8
145	145	2023-08-24	895.53	1836.89	-941.36
146	146	2023-06-27	232.97	839.78	-606.81
147	147	2023-01-20	100.8	494.23	-393.43
148	148	2023-03-09	396.75	267.67	129.08
149	149	2023-02-25	517.79	768.4	-250.61
150	150	2023-03-11	753.55	614.36	139.19
151	151	2022-10-28	408.26	259.72	148.54
152	152	2023-05-28	821.11	504.15	316.96
153	153	2023-08-18	461.9	1143.26	-681.36
154	154	2023-07-01	112.21	1.49	110.72
155	155	2022-10-18	312.29	659.38	-347.09
156	156	2023-01-10	614.8	778.06	-163.26
157	157	2023-03-10	288.65	1179.61	-890.96
158	158	2023-07-05	747.19	1742.21	-995.02
159	159	2022-11-10	833.74	1479.85	-646.11
160	160	2023-04-16	649.31	42.06	607.25
161	161	2022-11-15	557.94	992.87	-434.93
162	162	2023-04-20	798.83	1715.07	-916.24
163	163	2023-03-06	115.72	375.6	-259.88
164	164	2023-10-05	694.34	987.59	-293.25
165	165	2023-07-30	647.29	155.6	491.69
166	166	2023-07-23	660.72	1258.26	-597.54
167	167	2023-06-14	390.43	95.22	295.21
168	168	2022-10-22	739.49	1125.19	-385.7
169	169	2023-01-30	324.15	955.71	-631.56
170	170	2022-11-05	739.59	59.05	680.54
171	171	2023-08-12	192.27	84.44	107.83
172	172	2023-04-05	251.65	45.74	205.91
173	173	2023-03-12	363.64	1236.49	-872.85
174	174	2022-10-29	816.73	345.01	471.72
175	175	2023-03-03	866.37	1057.09	-190.72
176	176	2023-07-24	885.37	697.76	187.61
177	177	2023-08-22	944.82	660.59	284.23
178	178	2023-03-01	295.4	118.72	176.68
179	179	2023-01-24	473.47	353.45	120.02
180	180	2023-08-08	742.28	471.71	270.57
181	181	2022-11-11	862.59	442.49	420.1
182	182	2023-01-12	591.38	466.48	124.9
183	183	2023-07-15	359.88	656.88	-297
184	184	2023-05-22	226.35	83.79	142.56
185	185	2023-07-13	698.16	84.96	613.2
186	186	2023-05-24	966.41	1917.11	-950.7
187	187	2023-07-25	408.9	793.39	-384.49
188	188	2022-11-23	679.67	1206.82	-527.15
189	189	2023-06-04	608.24	380.1	228.14
190	190	2022-12-11	138.91	24.17	114.74
191	191	2023-07-14	248.92	38.26	210.66
192	192	2023-09-20	198.5	12.2	186.3
193	193	2023-05-07	198.96	94.79	104.17
194	194	2023-06-22	353.22	188.62	164.6
195	195	2023-01-06	319.48	1043.54	-724.06
1001	\N	2023-07-14	887.41	1152.56	-265.15
1002	\N	2023-10-05	584.87	200.61	384.26
1003	\N	2023-06-27	354.51	20.32	334.19
1004	\N	2023-09-30	426.41	118.37	308.04
1005	\N	2023-08-30	798.72	70.25	728.47
1006	\N	2023-01-13	151.1	353.54	-202.44
1007	\N	2023-01-25	230.57	683.17	-452.6
1008	\N	2023-01-17	552.19	812.31	-260.12
1009	\N	2023-01-20	271.14	29.91	241.23
1010	\N	2023-04-12	824.86	615.69	209.17
1011	\N	2022-11-22	884.49	106.63	777.86
1012	\N	2023-09-24	778.41	1039.35	-260.94
1013	\N	2023-09-03	498.38	288.14	210.24
1014	\N	2022-12-06	357.73	26.34	331.39
1015	\N	2022-10-19	944.34	1045.82	-101.48
1016	\N	2023-08-04	946.47	188.33	758.14
1017	\N	2023-09-19	180.85	338.08	-157.23
1018	\N	2022-12-17	388.94	239.97	148.97
196	196	2022-11-18	818.26	1453.41	-635.15
197	197	2022-12-25	556.7	1240.73	-684.03
198	198	2023-07-04	291.27	871.81	-580.54
199	199	2023-06-04	122.31	568.96	-446.65
200	200	2022-11-12	473.73	284.31	189.42
201	201	2023-01-23	375.42	226.36	149.06
202	202	2023-03-11	600.52	783.34	-182.82
203	203	2022-12-17	679.7	500.54	179.16
204	204	2023-02-19	628.99	267.67	361.32
205	205	2023-02-02	820.2	389.91	430.29
206	206	2023-05-16	621.69	145.49	476.2
207	207	2023-08-21	966.73	1376.4	-409.67
208	208	2023-09-21	872.21	1319.67	-447.46
209	209	2023-06-28	289.65	959.32	-669.67
210	210	2023-06-20	843.98	651.36	192.62
211	211	2023-03-10	340.28	3.74	336.54
212	212	2023-09-03	805.89	490.2	315.69
213	213	2023-06-10	532.1	1143.53	-611.43
214	214	2023-07-18	574.33	1399.63	-825.3
215	215	2023-07-22	550.59	826.76	-276.17
216	216	2023-07-16	515.25	69.24	446.01
217	217	2023-02-24	227.73	126.27	101.46
218	218	2023-05-05	819.75	45.7	774.05
219	219	2023-02-09	536.65	1410.85	-874.2
220	220	2023-07-07	372.7	267.13	105.57
221	221	2023-02-21	425.37	1318.38	-893.01
222	222	2023-04-30	119.85	234.12	-114.27
223	223	2023-01-15	425.75	719.76	-294.01
224	224	2023-07-31	703.34	1046.4	-343.06
225	225	2023-06-27	231.18	121.33	109.85
226	226	2023-01-29	757.44	1744.16	-986.72
227	227	2022-11-19	190.19	55.98	134.21
228	228	2023-07-07	129.39	9.61	119.78
229	229	2023-06-14	311.27	1142.9	-831.63
230	230	2023-01-23	524.65	122.12	402.53
231	231	2023-04-29	595.98	361.17	234.81
232	232	2023-07-05	323.73	107.99	215.74
233	233	2022-12-29	326.99	110.6	216.39
234	234	2022-11-30	539.53	995.72	-456.19
235	235	2023-09-01	836.5	1587.04	-750.54
236	236	2023-07-18	626.55	1595.97	-969.42
237	237	2023-09-21	323.95	638.62	-314.67
238	238	2022-12-30	459.76	628.85	-169.09
239	239	2023-03-10	117.75	8.49	109.26
240	240	2023-07-20	102.33	1.28	101.05
241	241	2023-05-19	365.7	1099.01	-733.31
242	242	2023-07-06	724.71	183.62	541.09
243	243	2022-10-15	166.63	565.96	-399.33
244	244	2023-04-21	659.82	466.3	193.52
245	245	2023-06-06	739.64	1227.85	-488.21
246	246	2023-09-13	273.59	1123.17	-849.58
247	247	2023-08-26	472.59	152.04	320.55
248	248	2023-02-17	158.77	29.67	129.1
249	249	2023-08-31	527.11	172.25	354.86
250	250	2023-04-20	748.14	218.98	529.16
251	251	2022-11-11	632.29	74.76	557.53
252	252	2022-12-14	997.61	1195.57	-197.96
253	253	2023-03-18	818.38	1087.88	-269.5
254	254	2023-02-12	868.92	1857.51	-988.59
255	255	2023-03-24	131.1	15.07	116.03
256	256	2023-03-22	787.37	62.34	725.03
257	257	2023-04-24	437.54	1283.62	-846.08
258	258	2023-01-07	559.94	188.26	371.68
259	259	2023-06-13	718.23	558.24	159.99
260	260	2023-01-22	804.84	156.48	648.36
261	261	2023-08-12	226.54	79.47	147.07
262	262	2023-02-23	514.16	191.57	322.59
263	263	2023-03-01	133.3	989.99	-856.69
264	264	2023-04-14	136.54	253.41	-116.87
265	265	2023-02-25	850.94	432.53	418.41
266	266	2022-11-24	769.46	575.19	194.27
267	267	2023-03-30	168.63	1151.37	-982.74
268	268	2023-03-17	505.94	121.43	384.51
269	269	2022-12-31	102.14	215.74	-113.6
270	270	2023-07-02	174.11	1121.93	-947.82
271	271	2023-01-08	699.17	179.69	519.48
272	272	2023-04-23	903.48	1701.84	-798.36
273	273	2023-03-01	442.76	1186.16	-743.4
274	274	2023-05-16	146.36	980.18	-833.82
275	275	2023-04-26	357.82	77.88	279.94
276	276	2022-11-19	888.75	1332.08	-443.33
277	277	2023-08-11	754.13	1390.89	-636.76
278	278	2023-06-29	436.13	1040.36	-604.23
279	279	2023-09-29	757.44	326.61	430.83
280	280	2023-09-12	591.32	1000.59	-409.27
281	281	2023-01-24	478.17	157.06	321.11
282	282	2022-11-30	646.1	177.35	468.75
283	283	2023-03-14	257.4	109.72	147.68
284	284	2023-03-17	393.2	47.83	345.37
285	285	2023-08-25	165.41	34.88	130.53
286	286	2022-10-31	387.13	230.68	156.45
287	287	2023-10-05	789.34	97.78	691.56
288	288	2023-01-25	581.6	77.06	504.54
289	289	2022-11-17	318.54	17.48	301.06
290	290	2023-09-27	590.16	367.14	223.02
291	291	2022-12-02	973.32	791.59	181.73
292	292	2022-11-01	355.63	243.01	112.62
293	293	2023-07-07	719.67	432.79	286.88
294	294	2022-11-09	544.63	1496.38	-951.75
295	295	2023-09-18	810.17	1086.89	-276.72
296	296	2023-09-21	137.39	667.64	-530.25
297	297	2023-05-06	660.77	150.71	510.06
298	298	2023-09-18	494.34	896.73	-402.39
299	299	2023-07-19	374.77	1275.23	-900.46
300	300	2023-05-24	480.8	19.76	461.04
301	301	2023-07-16	962.46	487.93	474.53
302	302	2023-02-06	295.12	51	244.12
303	303	2022-12-07	287.83	425.84	-138.01
304	304	2022-12-09	531.47	190.3	341.17
305	305	2023-06-23	608.76	411.48	197.28
306	306	2023-02-26	501.81	1346.73	-844.92
307	307	2023-09-27	665.19	1266.67	-601.48
308	308	2023-06-07	836.69	1214.21	-377.52
309	309	2023-07-24	405.1	1398.65	-993.55
310	310	2022-10-26	827.36	142.27	685.09
311	311	2023-01-17	808.69	30.91	777.78
312	312	2023-09-15	150.39	623.38	-472.99
313	313	2023-09-24	755.88	917.95	-162.07
314	314	2023-09-03	200.87	1193.11	-992.24
315	315	2023-04-24	359.72	944.35	-584.63
316	316	2023-01-04	380.79	1270.77	-889.98
317	317	2023-01-17	776.91	1365.24	-588.33
318	318	2023-08-10	744.59	1078.28	-333.69
319	319	2023-01-24	986.96	1335.57	-348.61
320	320	2023-04-03	247.46	714.78	-467.32
321	321	2023-03-25	524.96	909.68	-384.72
322	322	2022-12-07	124.31	431.19	-306.88
323	323	2023-03-02	460.4	88.14	372.26
324	324	2023-06-10	414.8	538.66	-123.86
325	325	2022-10-23	460.34	214.6	245.74
326	326	2023-04-20	845.76	543.62	302.14
327	327	2022-11-30	247.29	988.01	-740.72
328	328	2023-03-11	738.53	71.08	667.45
329	329	2023-03-02	728.88	1398.63	-669.75
330	330	2023-03-01	317.75	84.47	233.28
331	331	2023-06-05	913.35	271.95	641.4
332	332	2023-06-15	984.28	1945.98	-961.7
333	333	2022-10-24	758.98	63.92	695.06
334	334	2023-07-11	938.97	1042.11	-103.14
335	335	2022-10-17	394.19	958.24	-564.05
336	336	2022-10-26	696.26	216.71	479.55
337	337	2023-02-07	392.11	280.79	111.32
338	338	2023-08-12	283.58	34.85	248.73
339	339	2023-01-15	799.91	1502.8	-702.89
340	340	2023-03-09	148.3	20.18	128.12
341	341	2023-01-15	808.19	1257.47	-449.28
342	342	2023-07-19	391.32	27.44	363.88
343	343	2022-12-29	894.38	1477.53	-583.15
344	344	2023-09-10	759.86	1263.96	-504.1
345	345	2023-05-21	156.25	416.17	-259.92
346	346	2022-12-11	467.31	1228.93	-761.62
347	347	2022-12-20	219.72	42.65	177.07
348	348	2022-10-14	755.37	927.45	-172.08
349	349	2023-10-08	684.89	313.34	371.55
350	350	2023-09-20	663.29	326.28	337.01
351	351	2022-12-05	202.88	980.97	-778.09
352	352	2023-10-04	731.26	1504.98	-773.72
353	353	2023-07-14	571.78	740.4	-168.62
354	354	2023-05-24	871.22	1422.36	-551.14
355	355	2023-06-10	202.94	589.15	-386.21
356	356	2023-09-09	421.72	529.9	-108.18
357	357	2023-03-11	911.22	1889.6	-978.38
358	358	2022-12-29	295.71	515.81	-220.1
359	359	2023-08-16	515.12	165.24	349.88
360	360	2023-05-20	715.75	303.98	411.77
361	361	2023-03-20	937.53	1095.93	-158.4
362	362	2023-08-06	804.63	387.47	417.16
363	363	2023-02-12	671.2	407.08	264.12
364	364	2023-02-20	591.98	1269.11	-677.13
365	365	2022-10-22	497.68	213.9	283.78
366	366	2023-07-25	570.98	1517.92	-946.94
367	367	2023-07-25	435.41	1198.11	-762.7
368	368	2023-07-02	812.68	1490.71	-678.03
369	369	2023-07-26	507.85	400.27	107.58
370	370	2023-01-10	151.42	6.96	144.46
371	371	2023-10-01	534.93	738.87	-203.94
372	372	2023-04-01	267.1	34.87	232.23
373	373	2023-10-03	979.84	426.68	553.16
374	374	2023-01-02	255.35	145.76	109.59
375	375	2022-11-17	871.17	1643.94	-772.77
376	376	2023-02-14	761.87	162.2	599.67
377	377	2023-04-04	657.13	403.75	253.38
378	378	2023-03-11	233.29	64.96	168.33
379	379	2023-10-06	409.2	294.13	115.07
380	380	2023-05-27	562.25	978.35	-416.1
381	381	2023-03-22	202.14	1046.27	-844.13
382	382	2023-03-25	318.38	796.14	-477.76
383	383	2023-03-24	797.13	544.78	252.35
384	384	2022-10-27	369.74	501.84	-132.1
385	385	2023-01-17	931.14	1816.4	-885.26
386	386	2023-08-11	359.73	788.25	-428.52
387	387	2023-04-12	228.2	89.52	138.68
388	388	2023-02-04	291.8	912.56	-620.76
389	389	2023-07-30	274.41	71.06	203.35
390	390	2022-11-15	434.32	912.96	-478.64
391	391	2022-12-16	530.15	426.27	103.88
392	392	2023-07-08	874.36	1709.65	-835.29
393	393	2023-03-25	674.19	154.13	520.06
394	394	2023-07-14	962.85	552.38	410.47
395	395	2023-03-03	170.24	58.18	112.06
396	396	2022-10-17	625.74	1234.75	-609.01
397	397	2022-11-23	121.93	450.83	-328.9
398	398	2023-01-08	399.72	1311.4	-911.68
399	399	2022-11-05	626.81	4.33	622.48
400	400	2022-12-12	594.35	197.5	396.85
401	401	2023-03-31	618.59	445.22	173.37
402	402	2023-07-25	720.61	316.35	404.26
403	403	2023-09-18	700.13	1596.49	-896.36
404	404	2022-12-18	995.16	1342.65	-347.49
405	405	2023-01-31	570.13	1315.33	-745.2
406	406	2023-08-31	721.3	1424.75	-703.45
407	407	2022-11-06	270.47	70.71	199.76
408	408	2023-07-20	614.15	11.04	603.11
409	409	2023-05-11	393.65	62.92	330.73
410	410	2023-05-29	103.3	310.45	-207.15
411	411	2023-06-30	801.9	1410.09	-608.19
412	412	2023-04-20	971.95	644.3	327.65
413	413	2023-05-12	559.29	336.32	222.97
414	414	2022-12-28	622.86	163.73	459.13
415	415	2023-09-19	280.73	160.22	120.51
416	416	2022-11-04	365.42	12.34	353.08
417	417	2023-03-26	256.71	1036.88	-780.17
418	418	2023-01-10	552.82	916.6	-363.78
419	419	2022-12-18	783.83	90.33	693.5
420	420	2023-04-06	456.59	1312.98	-856.39
421	421	2023-10-05	758.54	953.05	-194.51
422	422	2023-02-05	538.32	380.16	158.16
423	423	2023-06-01	496.8	149.52	347.28
424	424	2023-03-30	432.2	213.8	218.4
425	425	2023-09-02	258.74	89.02	169.72
426	426	2022-10-09	605.21	175.42	429.79
427	427	2022-12-01	232.79	664.93	-432.14
428	428	2023-04-13	694.38	1401.31	-706.93
429	429	2023-05-09	515.78	1267.77	-751.99
430	430	2023-02-12	581.27	440.16	141.11
431	431	2023-01-02	853.94	1769.18	-915.24
432	432	2022-10-22	364.86	224.44	140.42
433	433	2023-07-27	211.57	79.32	132.25
434	434	2023-08-12	265.25	111.1	154.15
435	435	2022-12-16	623.99	1620.45	-996.46
436	436	2023-07-23	519.22	356.75	162.47
437	437	2023-08-28	575.54	800.72	-225.18
438	438	2022-12-30	577.36	1152.82	-575.46
439	439	2023-06-16	449.41	665.53	-216.12
440	440	2023-07-14	349.63	649.74	-300.11
441	441	2023-09-19	566.81	255.9	310.91
442	442	2023-09-03	990.82	1671.63	-680.81
443	443	2023-07-18	482.68	826.34	-343.66
444	444	2023-03-02	751.88	616.58	135.3
445	445	2023-02-08	577.71	1047.48	-469.77
446	446	2023-09-04	559.45	1288.44	-728.99
447	447	2023-08-07	221.36	58.41	162.95
448	448	2023-01-02	193.31	402.31	-209
449	449	2023-10-08	878.13	653.27	224.86
450	450	2023-09-02	976.67	1749.27	-772.6
451	451	2022-10-26	595.46	493.82	101.64
452	452	2022-10-09	354.37	31.74	322.63
453	453	2022-12-20	455.58	78.71	376.87
454	454	2023-03-04	751.41	1029.73	-278.32
455	455	2023-05-11	488.45	848.54	-360.09
456	456	2023-05-07	850.64	169.45	681.19
457	457	2023-01-02	439.2	160.63	278.57
458	458	2023-09-15	267.46	143.56	123.9
459	459	2022-12-31	998.3	1166.31	-168.01
460	460	2023-05-10	545.15	919.57	-374.42
461	461	2023-07-26	646.12	501.38	144.74
462	462	2023-05-06	789.41	527.58	261.83
463	463	2022-12-04	443.41	791.35	-347.94
464	464	2022-12-08	122.97	11.7	111.27
465	465	2023-10-09	350.72	187.16	163.56
466	466	2022-10-22	544.11	47.92	496.19
467	467	2023-09-18	899.46	663.79	235.67
468	468	2023-04-07	900.26	651.37	248.89
469	469	2023-07-14	254.99	6.62	248.37
470	470	2023-01-05	454.14	1174.75	-720.61
471	471	2023-08-04	810.74	923.54	-112.8
472	472	2023-08-26	581.76	137.81	443.95
473	473	2023-07-18	927.13	319.54	607.59
474	474	2022-10-25	577.25	1368.19	-790.94
475	475	2023-07-31	175.76	3.75	172.01
476	476	2022-10-20	710.49	458.73	251.76
477	477	2023-02-09	396.71	207.04	189.67
478	478	2023-06-22	921.29	1304.73	-383.44
479	479	2023-07-30	545.73	709.16	-163.43
480	480	2023-05-26	417.38	175.05	242.33
481	481	2022-10-27	788.3	243.34	544.96
482	482	2023-05-12	908.36	1297.78	-389.42
483	483	2023-09-23	145.81	31.82	113.99
484	484	2023-06-29	639.71	1142.65	-502.94
485	485	2023-07-04	895.6	1852.59	-956.99
486	486	2022-11-20	615.15	452.88	162.27
487	487	2023-06-27	579.79	245.84	333.95
488	488	2023-07-31	287.36	1097.54	-810.18
489	489	2023-06-29	819.17	489.61	329.56
490	490	2023-10-09	805.55	407.49	398.06
491	491	2023-05-08	886.61	1554.85	-668.24
492	492	2023-02-23	693.79	1574.35	-880.56
493	493	2022-12-19	314.78	565.52	-250.74
494	494	2023-04-26	477.43	23.71	453.72
495	495	2023-01-09	427.77	97.18	330.59
496	496	2023-03-04	293.25	999.09	-705.84
497	497	2023-04-18	479.18	247.75	231.43
498	498	2023-06-20	831.43	1783.23	-951.8
499	499	2023-04-18	126.99	0.8	126.19
500	500	2023-10-02	974.46	1937.69	-963.23
501	501	2023-01-05	503.69	18.97	484.72
502	502	2023-06-10	624.48	79.92	544.56
503	503	2023-03-01	753.78	99.42	654.36
504	504	2022-12-06	744.82	607.99	136.83
505	505	2023-06-11	536.43	321.54	214.89
506	506	2023-08-05	663.65	1512.99	-849.34
507	507	2023-02-23	914.43	1651.29	-736.86
508	508	2023-03-10	597.36	293.99	303.37
509	509	2022-12-07	502.77	297.21	205.56
510	510	2022-10-22	141.35	19.56	121.79
511	511	2023-03-10	639.27	745.3	-106.03
512	512	2023-07-04	292.96	564.08	-271.12
513	513	2022-11-13	984.1	132.57	851.53
514	514	2023-02-09	491.28	78.41	412.87
515	515	2023-05-17	855.47	966.78	-111.31
516	516	2023-10-08	247.73	115.41	132.32
517	517	2023-08-25	482.92	301.92	181
518	518	2022-10-27	299.86	880.46	-580.6
519	519	2023-05-03	167.5	16.74	150.76
520	520	2022-10-11	306.18	541.52	-235.34
521	521	2023-09-12	334.6	215.44	119.16
522	522	2023-07-05	783.95	357.76	426.19
523	523	2023-09-10	443.64	229.44	214.2
524	524	2023-03-15	358.1	255.9	102.2
525	525	2023-06-23	913.17	1826.06	-912.89
526	526	2023-09-01	862.49	608.43	254.06
527	527	2023-08-31	835.96	996.36	-160.4
528	528	2023-08-11	719.57	348.53	371.04
529	529	2023-07-10	297.7	1079.68	-781.98
530	530	2023-04-14	887.3	1152.37	-265.07
531	531	2023-03-31	621.89	78.07	543.82
532	532	2023-02-14	711.91	12.42	699.49
533	533	2022-10-20	120.79	620.43	-499.64
534	534	2022-12-19	613.62	1400.68	-787.06
535	535	2023-03-16	877.61	273.04	604.57
536	536	2023-08-18	921.97	169.65	752.32
537	537	2023-05-13	860.63	509.53	351.1
538	538	2023-09-30	124.47	20.46	104.01
539	539	2023-08-19	747.74	1495.53	-747.79
540	540	2023-09-11	918.9	231.55	687.35
541	541	2023-09-30	180.33	739.34	-559.01
542	542	2022-10-15	737.36	427.08	310.28
543	543	2022-12-13	978.15	245.93	732.22
544	544	2023-03-26	381.6	1347.37	-965.77
545	545	2022-12-01	116.57	445.7	-329.13
546	546	2023-07-08	469.73	297.49	172.24
547	547	2023-04-30	232.3	113.41	118.89
548	548	2023-01-16	908.49	1852.48	-943.99
549	549	2022-11-28	492.13	923.85	-431.72
550	550	2022-11-15	233.58	105.89	127.69
551	551	2023-07-04	284.62	119.89	164.73
552	552	2023-02-23	578.76	960.55	-381.79
553	553	2023-07-28	130.69	372.36	-241.67
554	554	2023-02-18	599.11	489.54	109.57
555	555	2023-01-03	355.31	158.33	196.98
556	556	2023-06-18	653.53	1413.06	-759.53
557	557	2022-11-08	672.9	1092.97	-420.07
558	558	2023-09-03	804.83	109.36	695.47
559	559	2023-06-06	387.29	13.45	373.84
560	560	2023-07-05	448.79	741.01	-292.22
561	561	2023-03-14	701.75	88.68	613.07
562	562	2023-02-17	453.91	353.01	100.9
563	563	2022-12-27	171.44	642.38	-470.94
564	564	2023-05-12	391.29	1083.96	-692.67
565	565	2023-07-19	819.28	1817.84	-998.56
566	566	2022-10-09	189.79	56.71	133.08
567	567	2023-05-04	768.22	627.28	140.94
568	568	2022-11-29	747.57	1236.12	-488.55
569	569	2022-11-30	410.23	1238.08	-827.85
570	570	2023-01-07	801.91	644.2	157.71
571	571	2023-09-06	902.7	1153.95	-251.25
572	572	2023-05-21	654.1	841.21	-187.11
573	573	2022-12-12	201.92	101.25	100.67
574	574	2023-07-18	263.16	453.65	-190.49
575	575	2023-04-24	424.88	235.72	189.16
576	576	2023-02-14	942.75	814.49	128.26
577	577	2023-05-06	235.69	557.28	-321.59
578	578	2023-06-14	819.11	507.18	311.93
579	579	2023-08-28	173.41	60.08	113.33
580	580	2023-04-20	782.73	478.07	304.66
581	581	2022-10-31	695.32	1365.07	-669.75
582	582	2023-03-27	584.46	1120.91	-536.45
583	583	2022-12-08	798.65	1232.51	-433.86
584	584	2023-09-30	537.77	353.61	184.16
585	585	2023-01-06	969.4	327.88	641.52
586	586	2023-09-30	483.94	789.84	-305.9
587	587	2022-11-29	329.26	143.57	185.69
588	588	2022-11-28	670.52	304.31	366.21
589	589	2023-03-19	654.25	88.78	565.47
590	590	2022-11-28	227.32	42.24	185.08
591	591	2023-05-05	546.61	229.56	317.05
592	592	2022-10-30	994.21	1103.96	-109.75
593	593	2023-07-22	222.92	108.16	114.76
594	594	2023-01-06	805.73	448.81	356.92
595	595	2023-08-14	444.76	621.96	-177.2
596	596	2022-11-11	169.38	23.93	145.45
597	597	2023-08-24	770.7	1504.95	-734.25
598	598	2022-12-29	912.36	1498.49	-586.13
599	599	2023-05-16	258.25	112.5	145.75
600	600	2022-12-25	493.41	622.56	-129.15
601	601	2023-02-25	296.55	102.88	193.67
602	602	2023-04-18	968.42	241.6	726.82
603	603	2022-12-06	425.94	1075.81	-649.87
604	604	2023-02-19	547.66	123.58	424.08
605	605	2023-04-28	430.25	160.34	269.91
606	606	2023-08-08	395.57	967.31	-571.74
607	607	2023-08-04	308.54	143.74	164.8
608	608	2022-12-29	720.1	355.5	364.6
609	609	2023-07-04	493.75	733.09	-239.34
610	610	2023-04-12	244.37	697.17	-452.8
611	611	2022-11-12	200.52	98.32	102.2
612	612	2022-10-17	236.84	69.17	167.67
613	613	2023-01-23	343.24	109.69	233.55
614	614	2023-04-10	169.9	1106.84	-936.94
615	615	2023-10-07	497.34	336.62	160.72
616	616	2023-06-03	483.35	188.08	295.27
617	617	2022-10-27	155.97	22.86	133.11
618	618	2023-08-05	285.69	26.38	259.31
619	619	2022-11-27	392.35	64.22	328.13
620	620	2023-06-27	275.35	697.32	-421.97
621	621	2022-11-11	992.67	1926.05	-933.38
622	622	2023-01-03	218.28	643.08	-424.8
623	623	2022-10-10	582.98	1404.91	-821.93
624	624	2023-01-12	226.95	37.05	189.9
625	625	2023-02-15	261.74	77.14	184.6
626	626	2023-01-13	294.3	650.64	-356.34
627	627	2023-02-11	977.56	268.57	708.99
628	628	2023-07-16	250.41	996.2	-745.79
629	629	2023-06-20	880.89	1147.05	-266.16
630	630	2022-12-09	948.27	1260.32	-312.05
631	631	2023-07-26	311.17	186.9	124.27
632	632	2023-02-13	699.97	25.41	674.56
633	633	2022-12-25	840.37	1314.02	-473.65
634	634	2022-10-30	591.1	385.73	205.37
635	635	2023-03-21	330.74	40.75	289.99
636	636	2023-03-24	564.94	1458.41	-893.47
637	637	2023-03-27	701.98	1020.11	-318.13
638	638	2022-12-27	659.51	87.91	571.6
639	639	2023-06-21	346.5	8.69	337.81
640	640	2023-01-25	376.53	1296.23	-919.7
641	641	2023-04-15	541.66	65.49	476.17
642	642	2023-01-07	345.26	107.88	237.38
643	643	2023-09-07	764.36	10.07	754.29
644	644	2023-04-26	390.79	1001.29	-610.5
645	645	2023-02-22	237.42	432.78	-195.36
646	646	2023-07-23	971.67	777.84	193.83
647	647	2023-08-13	747.55	86.81	660.74
648	648	2023-07-21	972.68	1887.79	-915.11
649	649	2023-08-31	637.29	1375.44	-738.15
650	650	2023-08-31	657.7	1194.6	-536.9
651	651	2023-01-01	142.97	0.24	142.73
652	652	2023-01-16	121.63	567.12	-445.49
653	653	2022-11-25	324.99	1003.35	-678.36
654	654	2023-07-31	439.22	670.38	-231.16
655	655	2023-07-13	260.12	59.59	200.53
656	656	2023-10-03	524.92	360.05	164.87
657	657	2022-10-27	166.1	40.93	125.17
658	658	2023-09-23	256.73	830.71	-573.98
659	659	2023-06-06	753.52	75.43	678.09
660	660	2022-11-12	199.72	46.86	152.86
661	661	2023-08-25	614.92	209.53	405.39
662	662	2023-08-02	340.99	2.2	338.79
663	663	2023-08-11	457.28	11.03	446.25
664	664	2023-01-30	302.96	139.62	163.34
665	665	2023-03-30	147.53	8.31	139.22
666	666	2022-12-07	692.63	972.14	-279.51
667	667	2022-12-26	640.72	1360.76	-720.04
668	668	2023-10-02	377.23	133.36	243.87
669	669	2023-09-13	618.87	1028.56	-409.69
670	670	2023-08-21	276.65	120.75	155.9
671	671	2023-09-20	816.45	1119.66	-303.21
672	672	2023-06-16	879.35	1613.02	-733.67
673	673	2023-02-09	250.74	1066.55	-815.81
674	674	2023-06-25	775.35	932.2	-156.85
675	675	2023-08-02	758.14	1105.17	-347.03
676	676	2023-10-07	668.9	1218.47	-549.57
677	677	2023-09-01	443.47	608.65	-165.18
678	678	2022-12-22	897.52	460.56	436.96
679	679	2023-07-01	156.59	678.37	-521.78
680	680	2023-04-30	665.16	91.17	573.99
681	681	2023-09-08	478.66	112.13	366.53
682	682	2023-02-24	495.27	1149.55	-654.28
683	683	2023-05-18	483.77	303.24	180.53
684	684	2023-02-02	640.55	300.46	340.09
685	685	2023-02-08	439.8	715	-275.2
686	686	2022-12-17	973.71	1145.45	-171.74
687	687	2023-06-13	388.94	170.93	218.01
688	688	2023-06-04	762.48	990.24	-227.76
689	689	2023-02-18	395.44	140.25	255.19
690	690	2023-07-14	955.27	1280.56	-325.29
691	691	2023-02-15	986.89	823.48	163.41
692	692	2022-11-15	786.78	1246.94	-460.16
693	693	2022-11-24	199.88	742.63	-542.75
694	694	2023-01-13	260.72	52.17	208.55
695	695	2023-10-06	355.14	945.91	-590.77
696	696	2023-04-25	401.18	1283.66	-882.48
697	697	2022-11-20	626.57	1591.93	-965.36
698	698	2022-12-13	331.66	997.48	-665.82
699	699	2023-08-16	233.21	104.73	128.48
700	700	2023-09-15	159.52	6.72	152.8
701	701	2022-12-22	205.63	624.46	-418.83
702	702	2023-01-10	348.66	935.96	-587.3
703	703	2023-09-21	174.73	283.39	-108.66
704	704	2023-03-09	267.36	15.34	252.02
705	705	2023-03-05	828.67	1429.1	-600.43
706	706	2022-10-29	847.81	1691.58	-843.77
707	707	2023-08-29	693.27	1219.44	-526.17
708	708	2023-08-25	660.62	1217.36	-556.74
709	709	2022-12-24	895.96	1107.39	-211.43
710	710	2023-01-10	872.92	330.75	542.17
711	711	2023-06-03	284.76	110.64	174.12
712	712	2023-03-11	702.29	123.07	579.22
713	713	2023-03-26	820.76	1000.73	-179.97
714	714	2023-04-03	558.91	1054.3	-495.39
715	715	2023-05-12	264.52	119.09	145.43
716	716	2023-09-13	377.84	186.89	190.95
717	717	2022-11-20	264.28	118.04	146.24
718	718	2023-02-11	276.13	801.6	-525.47
719	719	2022-10-10	454.36	1397.05	-942.69
720	720	2023-06-28	144.3	1052.73	-908.43
721	721	2023-06-13	230.89	1.28	229.61
722	722	2023-08-11	942.75	148	794.75
723	723	2023-06-10	825.83	533.34	292.49
724	724	2023-09-06	394.48	972.02	-577.54
725	725	2023-01-01	102.3	336.38	-234.08
726	726	2022-12-19	745.83	1520.25	-774.42
727	727	2023-08-07	100.8	0.62	100.18
728	728	2023-07-07	254.99	539.91	-284.92
729	729	2023-07-01	121.51	521.1	-399.59
730	730	2023-06-09	944.42	1166.84	-222.42
731	731	2023-07-23	314.25	875.12	-560.87
732	732	2023-05-16	499.87	1282.35	-782.48
733	733	2023-04-07	753.77	1653.31	-899.54
734	734	2023-08-31	753.37	498.57	254.8
735	735	2022-12-15	922.35	0.14	922.21
736	736	2023-08-01	407.23	1141.75	-734.52
737	737	2023-01-03	215.71	113.48	102.23
738	738	2023-05-31	984.9	1525.03	-540.13
739	739	2023-07-06	181.61	54.91	126.7
740	740	2023-03-17	921.33	1198.95	-277.62
741	741	2023-05-13	358.67	1184.21	-825.54
742	742	2023-01-17	237.57	639.85	-402.28
743	743	2023-08-25	556.41	982.37	-425.96
744	744	2023-08-11	742.41	493.04	249.37
745	745	2023-04-12	711.19	141.35	569.84
746	746	2023-09-26	823.77	583.98	239.79
747	747	2023-01-12	152.26	17.48	134.78
748	748	2023-02-03	891.6	1131.48	-239.88
749	749	2023-02-02	692.97	1520.1	-827.13
750	750	2023-07-13	620.84	1367.14	-746.3
751	751	2023-09-30	789.42	63	726.42
752	752	2023-09-04	117.3	3.22	114.08
753	753	2023-01-30	353.3	163.21	190.09
754	754	2023-03-13	115.66	832.76	-717.1
755	755	2023-06-20	215.37	396.34	-180.97
756	756	2022-12-30	881.58	1116.17	-234.59
757	757	2023-08-13	992.74	124.32	868.42
758	758	2023-03-11	508.62	884.56	-375.94
759	759	2023-03-02	478.71	231.28	247.43
760	760	2023-10-07	749.6	520.41	229.19
761	761	2022-10-30	203.59	1060.58	-856.99
762	762	2023-05-21	517.67	821.19	-303.52
763	763	2023-03-27	505.83	161.2	344.63
764	764	2022-10-14	877.4	385.11	492.29
765	765	2023-04-10	283.54	149.58	133.96
766	766	2023-03-28	407.46	554.84	-147.38
767	767	2023-02-18	270.9	1099.34	-828.44
768	768	2023-01-14	558.18	140.86	417.32
769	769	2023-04-12	598.59	171.15	427.44
770	770	2023-09-26	764.83	457.46	307.37
771	771	2023-06-27	978.3	1224.81	-246.51
772	772	2023-06-23	950.88	1299.66	-348.78
773	773	2022-11-24	110.48	245.8	-135.32
774	774	2022-11-01	277.96	436.51	-158.55
775	775	2023-08-08	508.88	251.1	257.78
776	776	2023-06-26	548.49	380.24	168.25
777	777	2023-04-19	434.45	1302.97	-868.52
778	778	2022-12-10	877.57	634.23	243.34
779	779	2023-09-04	103.35	1090.53	-987.18
780	780	2023-05-13	984.17	548.73	435.44
781	781	2022-12-13	675.99	1265.31	-589.32
782	782	2022-11-01	193.35	439.18	-245.83
783	783	2023-01-10	833.75	721.46	112.29
784	784	2022-11-11	929.74	637.12	292.62
785	785	2022-11-25	830.1	292.14	537.96
786	786	2023-10-07	186.82	1141.43	-954.61
787	787	2023-01-25	288.42	872.05	-583.63
788	788	2022-12-21	514.69	1381.63	-866.94
789	789	2023-09-28	985.54	1700	-714.46
790	790	2023-03-28	441.31	15.43	425.88
791	791	2022-11-08	832.71	36.74	795.97
792	792	2023-08-09	113.21	5.93	107.28
793	793	2023-07-02	183.84	925.72	-741.88
794	794	2022-11-24	679.15	204.35	474.8
795	795	2023-01-27	446.92	904.57	-457.65
796	796	2023-03-03	795.77	1285.11	-489.34
797	797	2023-06-21	743.9	1583.02	-839.12
798	798	2023-05-17	442.25	890	-447.75
799	799	2023-05-03	623.32	34.58	588.74
800	800	2023-03-19	897.71	1177.84	-280.13
801	801	2023-09-05	291.29	160.78	130.51
802	802	2023-09-18	963.6	1587.54	-623.94
803	803	2023-02-24	984.32	1251.03	-266.71
804	804	2023-03-08	619.91	308.41	311.5
805	805	2023-03-23	165.77	3.49	162.28
806	806	2022-11-08	157.46	484.58	-327.12
807	807	2023-02-21	321.95	179.2	142.75
808	808	2022-10-18	468.56	276.25	192.31
809	809	2022-11-19	404.28	1035.46	-631.18
810	810	2022-12-05	838.72	1035.98	-197.26
811	811	2023-06-02	683.23	1608.77	-925.54
812	812	2023-02-09	853.63	322.99	530.64
813	813	2023-03-18	613.64	1557.04	-943.4
814	814	2022-10-22	428.83	1183.07	-754.24
815	815	2023-03-09	972.93	1903.05	-930.12
816	816	2023-06-02	397.82	250.65	147.17
817	817	2023-04-09	587.25	730.55	-143.3
818	818	2023-06-08	292.61	1084.62	-792.01
819	819	2023-01-21	673.92	506.93	166.99
820	820	2023-09-14	475.21	332.37	142.84
821	821	2023-08-12	443.46	335.28	108.18
822	822	2022-10-13	145.13	272.54	-127.41
823	823	2023-05-05	920.98	1568.43	-647.45
824	824	2023-07-17	648.58	134.19	514.39
825	825	2023-07-28	381.72	1021.63	-639.91
826	826	2023-03-21	996.62	1500.43	-503.81
827	827	2023-06-23	582.74	133.68	449.06
828	828	2023-09-26	808.5	1050.23	-241.73
829	829	2023-01-01	648.32	326.99	321.33
830	830	2023-01-25	216.27	41.14	175.13
831	831	2023-09-10	248.44	132.09	116.35
832	832	2023-08-29	861.87	160.87	701
833	833	2023-06-12	120.94	1047.92	-926.98
834	834	2023-01-11	691.56	516.52	175.04
835	835	2022-12-13	814.14	272.9	541.24
836	836	2023-06-07	378.13	487.96	-109.83
837	837	2023-04-07	240.19	80.5	159.69
838	838	2023-01-06	295.75	1123.73	-827.98
839	839	2023-01-02	495.35	1304.63	-809.28
840	840	2023-07-20	854.87	1707.09	-852.22
841	841	2023-07-01	789.1	1787.34	-998.24
842	842	2023-01-27	870.43	707.72	162.71
843	843	2023-07-17	571.48	849.56	-278.08
844	844	2023-06-01	182.78	26.02	156.76
845	845	2023-03-07	140.42	5.98	134.44
846	846	2023-08-24	299.35	27.22	272.13
847	847	2023-02-04	689.66	320.08	369.58
848	848	2023-01-30	390.21	934.05	-543.84
849	849	2023-04-19	707.6	224.8	482.8
850	850	2022-11-06	219.54	6.57	212.97
851	851	2023-08-11	976.81	1950.16	-973.35
852	852	2023-07-03	937.74	1772.82	-835.08
853	853	2023-07-20	922.77	1542.5	-619.73
854	854	2023-06-21	464.4	200.83	263.57
855	855	2022-12-21	275.59	1094.43	-818.84
856	856	2023-07-10	971.52	454.99	516.53
857	857	2022-12-31	306.98	1218.71	-911.73
858	858	2023-03-01	626.16	1258.93	-632.77
859	859	2023-04-28	702.49	1634.68	-932.19
860	860	2023-04-16	509.31	1061.5	-552.19
861	861	2023-10-02	746.18	1359.82	-613.64
862	862	2022-12-12	797.21	1232.2	-434.99
863	863	2023-08-08	682.66	1116.02	-433.36
864	864	2023-04-10	231.42	71	160.42
865	865	2023-09-20	674.15	313.22	360.93
866	866	2023-05-04	674.14	246.69	427.45
867	867	2023-04-15	846.95	1108.67	-261.72
868	868	2023-01-02	977.97	1325.06	-347.09
869	869	2023-03-28	495.21	301.12	194.09
870	870	2023-09-02	823.53	425.55	397.98
871	871	2023-04-25	728.92	1440.05	-711.13
872	872	2023-08-05	174.43	619.6	-445.17
873	873	2023-01-03	978.58	1616.24	-637.66
874	874	2023-07-13	648.58	159.79	488.79
875	875	2022-11-17	454.37	153.55	300.82
876	876	2023-09-13	753.73	1577.86	-824.13
877	877	2023-09-27	276.16	125.27	150.89
878	878	2023-09-25	498.57	294.41	204.16
879	879	2023-03-12	381.41	182.51	198.9
880	880	2023-07-23	602.72	326.48	276.24
881	881	2022-10-17	522.13	73.72	448.41
882	882	2023-04-04	375.32	208.46	166.86
883	883	2023-04-08	261.13	100.79	160.34
884	884	2023-06-20	576.13	1478.45	-902.32
885	885	2023-04-24	753.43	498.44	254.99
886	886	2023-08-22	578.3	316.78	261.52
887	887	2023-06-08	182.5	70.62	111.88
888	888	2023-06-28	726.37	529.77	196.6
889	889	2023-09-18	881.4	1130.07	-248.67
890	890	2022-11-23	835.64	1400.58	-564.94
891	891	2023-09-18	596.64	722.22	-125.58
892	892	2023-09-03	924.37	271.29	653.08
893	893	2023-01-27	937.87	1600.83	-662.96
894	894	2022-10-26	125.71	605.12	-479.41
895	895	2023-05-28	357.78	1314.2	-956.42
896	896	2023-05-29	204.58	811.25	-606.67
943	943	2022-12-20	911.7	732.9	178.8
944	944	2023-08-19	639.92	1005.88	-365.96
945	945	2023-05-26	756.47	287.01	469.46
946	946	2022-11-21	662.92	184.52	478.4
947	947	2022-12-02	327.58	140.42	187.16
960	960	2023-06-08	801.23	1686.78	-885.55
961	961	2023-04-23	856.18	1195.54	-339.36
962	962	2023-04-11	867.42	691.56	175.86
963	963	2022-10-16	234.28	113.28	121
964	964	2023-01-27	338.4	558.03	-219.63
965	965	2022-12-25	984.75	1857.83	-873.08
966	966	2023-08-15	864.18	1819.76	-955.58
967	967	2023-05-17	486.15	620.02	-133.87
968	968	2023-04-18	853.54	387.38	466.16
969	969	2023-06-19	681.71	842.55	-160.84
970	970	2023-09-14	188.98	1153.53	-964.55
971	971	2023-08-04	636.46	151.58	484.88
972	972	2023-09-22	228.73	48.57	180.16
973	973	2023-06-13	949.33	197.62	751.71
974	974	2023-08-27	506.98	149.94	357.04
975	975	2022-12-29	761.76	950.02	-188.26
976	976	2023-06-22	417.52	718.35	-300.83
977	977	2023-06-19	505.18	43.53	461.65
978	978	2022-11-18	911.7	1848.11	-936.41
979	979	2023-07-10	128.44	10.57	117.87
980	980	2022-11-12	889.85	353.27	536.58
981	981	2022-11-06	918.97	649.59	269.38
982	982	2023-01-19	723.84	25.82	698.02
983	983	2023-01-19	673.53	452.42	221.11
984	984	2023-05-12	163.15	550.1	-386.95
985	985	2023-01-20	239.89	35.01	204.88
986	986	2023-06-25	231.95	66.28	165.67
987	987	2022-11-10	926.72	1687.44	-760.72
988	988	2023-04-23	458.77	771.52	-312.75
989	989	2023-01-13	833.38	1603.83	-770.45
990	990	2022-11-07	209.23	31.66	177.57
991	991	2023-07-13	453.96	832.35	-378.39
992	992	2023-03-18	447.98	592.14	-144.16
993	993	2023-05-11	698.4	1168.32	-469.92
994	994	2023-02-06	208.5	87.69	120.81
995	995	2023-10-07	159.4	16.4	143
996	996	2023-07-03	533.66	4.89	528.77
997	997	2023-07-25	733.32	526.87	206.45
998	998	2023-09-21	620.21	1505.52	-885.31
999	999	2023-07-26	208.74	635.83	-427.09
1000	1000	2023-05-27	695.73	1181.41	-485.68
1019	\N	2022-10-26	230.98	73.96	157.02
1020	\N	2023-08-10	362.19	59.55	302.64
1021	\N	2023-02-22	313.7	102.82	210.88
1022	\N	2023-02-26	201.5	1105.1	-903.6
1023	\N	2023-10-03	603.33	972.21	-368.88
1024	\N	2023-08-24	620.53	358.11	262.42
1025	\N	2023-09-21	112.77	940.39	-827.62
1026	\N	2022-12-29	822.42	1757.68	-935.26
1027	\N	2022-10-10	536.38	1154.85	-618.47
1028	\N	2023-07-01	944.17	1529.9	-585.73
1029	\N	2022-11-26	553.71	151.22	402.49
1030	\N	2023-07-19	357.63	926.48	-568.85
1031	\N	2023-01-25	207.47	460.37	-252.9
1032	\N	2023-01-29	741.84	247.15	494.69
1033	\N	2023-03-22	468.89	22.62	446.27
1034	\N	2023-07-15	262.44	600.4	-337.96
1035	\N	2023-05-04	913.69	1636.06	-722.37
1036	\N	2022-11-20	806.28	1686.39	-880.11
1037	\N	2023-02-18	277.62	89.64	187.98
1038	\N	2023-07-13	876.86	1337.41	-460.55
1039	\N	2023-06-07	417.21	1040.71	-623.5
1040	\N	2022-11-26	902.71	1012.49	-109.78
1041	\N	2023-01-17	973.94	748.64	225.3
1042	\N	2023-09-07	911.31	1522.26	-610.95
1043	\N	2023-03-07	995.23	1992.23	-997
1044	\N	2023-04-25	375.93	881.65	-505.72
1045	\N	2022-11-08	946.22	79.04	867.18
1046	\N	2023-03-17	783.8	405.52	378.28
1047	\N	2023-04-17	759.98	1111.1	-351.12
1048	\N	2022-11-03	774.5	391.1	383.4
1049	\N	2023-07-31	273.82	86.06	187.76
1050	\N	2022-10-13	528.63	240.57	288.06
1051	\N	2022-11-12	977.79	1392.95	-415.16
1052	\N	2023-05-20	874.22	508.75	365.47
1053	\N	2023-03-07	325.87	32.93	292.94
1054	\N	2023-08-15	372.21	78.67	293.54
1055	\N	2022-11-10	771.71	1174.98	-403.27
1056	\N	2023-02-26	930.1	687.82	242.28
1057	\N	2023-09-07	256.63	837.33	-580.7
1058	\N	2023-02-06	885.86	1100.35	-214.49
1059	\N	2023-06-25	550.11	107.2	442.91
1060	\N	2023-07-18	935.19	1714.65	-779.46
1061	\N	2023-01-24	181.69	740.65	-558.96
1	1	2023-07-18	613.11	368.32	244.79
3	3	2023-01-12	655.28	136.59	518.69
8	8	2023-06-19	424.19	1163.31	-739.12
9	9	2023-05-04	462.37	224.44	237.93
10	10	2023-04-12	795.47	552.13	243.34
24	24	2022-11-30	917.36	714.24	203.12
25	25	2022-12-29	904.23	411.75	492.48
26	26	2023-07-11	116.17	14.36	101.81
27	27	2023-06-05	313.66	166.27	147.39
28	28	2023-02-22	775.53	141.15	634.38
29	29	2023-08-25	289.11	116.24	172.87
30	30	2022-12-06	772.39	1010.59	-238.2
31	31	2023-04-17	794.33	403.47	390.86
32	32	2023-03-16	788.95	505.15	283.8
33	33	2022-11-17	253.77	787.96	-534.19
34	34	2023-03-23	908.79	27.56	881.23
35	35	2022-11-26	190.92	24.12	166.8
36	36	2023-04-29	328.83	1019.01	-690.18
37	37	2022-11-14	791.86	1239.7	-447.84
38	38	2023-08-25	813.68	251.33	562.35
39	39	2023-04-12	862.77	1171.7	-308.93
40	40	2022-11-26	817.73	1250.18	-432.45
41	41	2023-04-11	815.15	169.34	645.81
42	42	2023-08-28	644.1	1302.09	-657.99
43	43	2023-08-20	570.99	1119.14	-548.15
44	44	2022-10-14	694.99	1234.76	-539.77
45	45	2023-01-21	431.31	741.02	-309.71
46	46	2023-02-15	764.62	597.92	166.7
47	47	2022-10-16	795.69	1490.29	-694.6
48	48	2023-07-25	117.9	5.76	112.14
49	49	2022-12-09	396.57	528.25	-131.68
50	50	2023-01-25	970.45	1324.64	-354.19
51	51	2022-12-21	795.3	465.87	329.43
52	52	2023-02-24	949.31	737.46	211.85
53	53	2023-08-28	781.52	1084.86	-303.34
54	54	2023-07-15	193.36	22.05	171.31
55	55	2023-06-07	790.24	425.7	364.54
56	56	2023-01-22	112.75	3.07	109.68
57	57	2023-09-26	633.3	152.99	480.31
58	58	2022-11-30	739.12	920.08	-180.96
59	59	2023-02-12	878.64	701.5	177.14
60	60	2022-11-08	425.6	565.21	-139.61
61	61	2023-01-28	930.23	30.19	900.04
62	62	2023-02-13	700.31	216.98	483.33
63	63	2023-01-01	981.54	1182.09	-200.55
64	64	2023-08-19	456.33	1009.92	-553.59
65	65	2022-12-17	603.2	1361.74	-758.54
66	66	2023-07-06	692.36	1449.72	-757.36
67	67	2023-09-28	637.65	836.06	-198.41
68	68	2022-11-13	756.76	450.05	306.71
69	69	2023-06-29	568.54	430.72	137.82
70	70	2023-10-08	828.17	442.3	385.87
71	71	2023-04-08	745.56	1637.19	-891.63
1062	\N	2023-08-18	671.44	542.84	128.6
1063	\N	2023-01-26	354.7	710.44	-355.74
1064	\N	2023-08-07	336.88	879.42	-542.54
1065	\N	2022-11-21	873.91	1646.14	-772.23
1066	\N	2023-07-23	722.96	434.91	288.05
1067	\N	2023-06-29	824.87	303.33	521.54
1068	\N	2023-09-09	989.93	421.05	568.88
1069	\N	2023-02-11	894.54	1407.15	-512.61
1070	\N	2023-04-29	782.27	22.47	759.8
1071	\N	2023-06-09	915.16	1359.92	-444.76
1072	\N	2022-11-07	511.56	909.7	-398.14
1073	\N	2022-10-18	534.14	1091.44	-557.3
1074	\N	2023-04-05	981.92	22.09	959.83
1075	\N	2023-04-03	542.81	1512.67	-969.86
1076	\N	2023-01-10	660.8	1179.74	-518.94
1077	\N	2023-03-23	418.31	1057.13	-638.82
1078	\N	2023-08-24	158.59	513.62	-355.03
1079	\N	2023-06-18	879.88	1025.93	-146.05
1080	\N	2022-10-15	236.66	28.85	207.81
1081	\N	2023-03-14	716.99	499.67	217.32
1082	\N	2022-11-22	683.77	1398.58	-714.81
1083	\N	2023-09-09	748.91	54.88	694.03
1084	\N	2023-08-27	676.83	1100.55	-423.72
1085	\N	2023-07-16	541.66	1151.75	-610.09
1086	\N	2023-08-18	543.21	1388.72	-845.51
1087	\N	2023-03-23	887.15	1317.54	-430.39
1088	\N	2022-12-04	670.82	90.84	579.98
1089	\N	2022-11-29	258.93	47.44	211.49
1090	\N	2023-02-23	134.45	7.05	127.4
1091	\N	2022-12-26	629.81	442.76	187.05
1092	\N	2023-04-19	534.6	1171.37	-636.77
1093	\N	2023-06-04	480.38	322.07	158.31
1094	\N	2023-03-13	360.79	885.59	-524.8
1095	\N	2023-05-23	150.75	1014.1	-863.35
1096	\N	2023-01-04	643.64	434.11	209.53
1097	\N	2023-03-03	960.59	1886.7	-926.11
1098	\N	2022-11-14	279.97	57.3	222.67
1099	\N	2023-03-03	838.39	1624.9	-786.51
1100	\N	2023-09-27	188.78	40.82	147.96
1101	\N	2023-07-10	747.39	863.3	-115.91
1102	\N	2023-02-23	414.12	549.69	-135.57
1103	\N	2023-01-17	707.58	601.09	106.49
1104	\N	2023-09-11	264.79	99.21	165.58
72	72	2023-07-28	842.64	222.48	620.16
73	73	2023-02-07	815.91	1686.65	-870.74
74	74	2022-11-13	451.38	182.36	269.02
75	75	2023-09-03	511.24	272.24	239
76	76	2023-01-31	998.93	667.55	331.38
1105	\N	2022-11-08	650.26	1434.03	-783.77
1106	\N	2022-12-16	959.27	788.2	171.07
1107	\N	2022-11-25	278.87	89.54	189.33
1108	\N	2022-12-15	123.8	13.48	110.32
1109	\N	2023-07-20	237.73	85.12	152.61
1110	\N	2022-10-30	762.84	1716.94	-954.1
1111	\N	2023-03-08	896.65	99.13	797.52
1112	\N	2023-08-04	609.62	1370.69	-761.07
1113	\N	2023-01-21	458.98	581.46	-122.48
1114	\N	2023-08-16	824.72	101.24	723.48
1115	\N	2023-05-29	312.55	642.92	-330.37
1116	\N	2023-06-20	111.4	365.84	-254.44
1117	\N	2023-02-10	817.32	540.77	276.55
1118	\N	2022-11-19	774.17	658.41	115.76
1119	\N	2023-10-01	342.65	1313.53	-970.88
1120	\N	2023-06-20	456.42	92.56	363.86
1121	\N	2023-07-12	719.16	1536.27	-817.11
1122	\N	2022-12-12	284.51	1148.92	-864.41
1123	\N	2022-11-21	651.37	257.93	393.44
1124	\N	2023-06-24	340.33	170.28	170.05
1125	\N	2023-07-04	242.77	525.94	-283.17
1126	\N	2023-05-09	459.63	98.92	360.71
1127	\N	2023-01-06	869.23	384.09	485.14
1128	\N	2023-07-16	358.91	183.86	175.05
1129	\N	2023-04-12	800.83	584.03	216.8
1130	\N	2023-07-09	666.9	1501.4	-834.5
1131	\N	2022-12-04	623.51	230.2	393.31
1132	\N	2023-04-15	281.59	163.33	118.26
1133	\N	2023-02-11	623.5	1619.19	-995.69
1134	\N	2023-06-02	328.48	159.73	168.75
1135	\N	2023-01-10	812.85	1479.9	-667.05
1136	\N	2023-06-22	430.87	1181.42	-750.55
1137	\N	2023-04-09	152.29	795.83	-643.54
1138	\N	2023-03-22	965.9	1209.33	-243.43
1139	\N	2023-03-26	238.21	530.69	-292.48
1140	\N	2023-08-10	936.87	288.28	648.59
1141	\N	2023-05-16	322.31	487.51	-165.2
1142	\N	2023-06-02	383.44	508.74	-125.3
1143	\N	2023-05-22	173.18	32.73	140.45
1144	\N	2022-12-21	188.76	67.36	121.4
1145	\N	2023-05-09	146.78	40.47	106.31
1146	\N	2023-01-05	423.46	247.46	176
1147	\N	2023-02-10	686.7	1448.55	-761.85
1148	\N	2023-02-08	257.3	21.87	235.43
1149	\N	2023-06-23	589.58	1080.88	-491.3
1150	\N	2023-09-15	204.97	323.33	-118.36
1151	\N	2023-07-06	762.25	49.73	712.52
1152	\N	2023-03-17	574.14	75.44	498.7
1153	\N	2023-05-03	176.96	23.14	153.82
1154	\N	2023-09-05	476.91	171.03	305.88
1155	\N	2022-11-27	958.74	1241.58	-282.84
1156	\N	2023-01-22	929.67	123.28	806.39
1157	\N	2023-08-13	923.43	1072.53	-149.1
1158	\N	2023-08-08	884.4	1457.9	-573.5
1159	\N	2023-06-03	895.31	613.96	281.35
1160	\N	2023-09-10	836.95	1048.66	-211.71
1161	\N	2022-11-02	266.31	662.28	-395.97
1162	\N	2023-09-07	583.49	196.53	386.96
1163	\N	2022-10-30	128.6	237.64	-109.04
1164	\N	2023-03-14	680.77	1105.88	-425.11
1165	\N	2023-06-19	309.42	79.05	230.37
1166	\N	2022-10-16	335.8	121.82	213.98
1167	\N	2023-02-03	197.3	54.24	143.06
1168	\N	2023-01-17	695.37	188.18	507.19
1169	\N	2022-10-22	382.73	808.11	-425.38
1170	\N	2023-07-10	309.37	582.85	-273.48
1171	\N	2022-10-21	357.58	681.48	-323.9
1172	\N	2023-05-26	283.69	889.37	-605.68
1173	\N	2023-06-22	315.59	42.08	273.51
1174	\N	2022-12-28	977.85	108.12	869.73
1175	\N	2023-09-12	105.57	1.47	104.1
1176	\N	2022-10-24	980.19	538.24	441.95
1177	\N	2023-01-29	687.81	258.7	429.11
1178	\N	2023-09-21	493.82	666.9	-173.08
1179	\N	2023-07-30	917.28	720.09	197.19
1180	\N	2023-05-22	848.31	1401.25	-552.94
1181	\N	2023-05-09	516.5	1279.62	-763.12
1182	\N	2023-01-23	817.67	1469.81	-652.14
1183	\N	2022-12-27	446.79	958.72	-511.93
1184	\N	2022-10-10	553.7	1275.8	-722.1
1185	\N	2023-01-31	878.88	1436.71	-557.83
1186	\N	2022-12-07	791.27	1042.32	-251.05
1187	\N	2023-09-11	728.6	1462.12	-733.52
1188	\N	2022-10-13	674.36	450.64	223.72
1189	\N	2023-07-17	866.66	1568.28	-701.62
1190	\N	2022-12-25	210.15	1209.73	-999.58
1191	\N	2022-11-02	904.57	1281.98	-377.41
1192	\N	2023-10-07	646.54	1196.27	-549.73
1193	\N	2022-10-12	893.33	788.94	104.39
1194	\N	2023-03-14	200.7	883.45	-682.75
1195	\N	2023-07-03	443.33	616.63	-173.3
1196	\N	2023-03-26	985.74	1267.71	-281.97
1197	\N	2023-04-28	597.6	1010.02	-412.42
1198	\N	2022-11-07	955.69	355.58	600.11
1199	\N	2023-05-23	512.89	252.45	260.44
1200	\N	2023-08-01	266.1	1018.88	-752.78
1201	\N	2023-02-03	653.54	129.16	524.38
1202	\N	2023-04-23	325.2	101.26	223.94
1203	\N	2023-06-29	481.86	1177.47	-695.61
1204	\N	2023-01-05	900.5	233.01	667.49
1205	\N	2023-06-28	911.97	1696.86	-784.89
1206	\N	2022-12-09	393.29	914.46	-521.17
1207	\N	2023-04-07	381.2	1317.31	-936.11
1208	\N	2023-03-24	722.93	1680.66	-957.73
1209	\N	2022-11-09	430.64	1175.7	-745.06
1210	\N	2023-03-22	151.49	2.95	148.54
1211	\N	2022-10-29	228.49	92.21	136.28
1212	\N	2023-03-15	390.76	783.68	-392.92
1213	\N	2022-12-16	145.93	475.53	-329.6
1214	\N	2023-08-09	212.51	964.8	-752.29
1215	\N	2023-02-11	849.52	528.42	321.1
1216	\N	2023-01-26	895.24	701.02	194.22
1217	\N	2023-09-19	438.35	98.5	339.85
1218	\N	2023-01-26	440.54	1302.84	-862.3
1219	\N	2023-09-24	960.38	1900.21	-939.83
1220	\N	2023-07-19	155.93	39.63	116.3
1221	\N	2023-04-25	746.62	91.39	655.23
1222	\N	2023-05-06	330.98	225.94	105.04
1223	\N	2023-03-17	348.65	1227.29	-878.64
1224	\N	2023-03-17	740.22	1136.84	-396.62
1225	\N	2023-04-06	341.33	984.09	-642.76
1226	\N	2023-01-21	153.68	452.22	-298.54
1227	\N	2022-10-30	881.34	1746.99	-865.65
1228	\N	2023-09-27	660.83	1203.04	-542.21
1229	\N	2023-02-11	282.53	15.48	267.05
1230	\N	2023-08-06	944.56	1717.96	-773.4
1231	\N	2023-06-23	319.6	671.9	-352.3
1232	\N	2022-11-03	295.63	37.51	258.12
1233	\N	2023-08-25	510.81	1404.94	-894.13
1234	\N	2023-01-08	598.2	1583.79	-985.59
1235	\N	2023-03-10	143.27	609.85	-466.58
1236	\N	2023-02-21	602.95	751.55	-148.6
1237	\N	2023-06-13	819.46	15.13	804.33
1238	\N	2022-10-25	820.92	265.23	555.69
1239	\N	2023-04-17	779.15	1603.33	-824.18
1240	\N	2023-06-16	281.73	4.67	277.06
1241	\N	2023-02-19	268.1	1211.54	-943.44
1242	\N	2023-02-05	592.26	1579.02	-986.76
1243	\N	2022-11-06	693.62	217.33	476.29
1244	\N	2023-03-23	726.98	1557.34	-830.36
1245	\N	2023-08-06	619.49	516.21	103.28
1246	\N	2023-05-01	532.81	959.45	-426.64
1247	\N	2023-05-08	545.18	711.4	-166.22
1248	\N	2023-02-19	576.4	160.6	415.8
1249	\N	2023-03-21	120.87	3.55	117.32
1250	\N	2023-09-11	341.13	196.94	144.19
1251	\N	2022-12-20	127.51	8.1	119.41
1252	\N	2023-06-21	857.46	972.06	-114.6
1253	\N	2023-07-24	881.33	1142.54	-261.21
1254	\N	2023-06-30	119.9	16.68	103.22
1255	\N	2023-02-25	675.19	1581.82	-906.63
1256	\N	2023-02-06	634.26	426.75	207.51
1257	\N	2023-03-14	120.9	314.03	-193.13
1258	\N	2022-11-13	906.72	1060.72	-154
1259	\N	2023-08-06	465.82	195.21	270.61
1260	\N	2023-07-15	660.9	813.29	-152.39
1261	\N	2022-10-14	404.31	798.99	-394.68
1262	\N	2023-01-04	537.89	1109.04	-571.15
1263	\N	2022-10-17	379.14	123.47	255.67
1264	\N	2022-12-20	303.87	7.64	296.23
1265	\N	2023-07-26	205.98	70.88	135.1
1266	\N	2023-04-22	506.84	338.8	168.04
1267	\N	2022-12-03	582.57	304.43	278.14
1268	\N	2023-05-10	284.5	885.04	-600.54
1269	\N	2022-10-22	658.99	1237.02	-578.03
1270	\N	2023-04-09	349.95	70.64	279.31
1271	\N	2023-06-02	614.12	1097.14	-483.02
1272	\N	2023-05-04	800.53	401.84	398.69
1273	\N	2023-08-24	148.2	44.61	103.59
1274	\N	2023-05-20	783.19	205.96	577.23
1275	\N	2023-06-20	952.65	684.32	268.33
1276	\N	2023-01-16	884.46	285.52	598.94
1277	\N	2023-08-28	408.61	218.29	190.32
1278	\N	2023-05-08	483.39	167.19	316.2
1279	\N	2023-07-09	231.55	557.85	-326.3
1280	\N	2022-12-21	568.81	53.79	515.02
1281	\N	2023-01-11	401.41	270.16	131.25
1282	\N	2023-03-05	205.35	22.3	183.05
1283	\N	2022-11-15	601.39	1460.25	-858.86
1284	\N	2022-11-25	731.32	57.33	673.99
1285	\N	2022-12-14	712.46	178.56	533.9
1286	\N	2023-08-21	502.29	201.62	300.67
1287	\N	2023-02-16	146.58	6.31	140.27
1288	\N	2023-01-13	736.99	920.7	-183.71
1289	\N	2023-08-23	710.51	1593.4	-882.89
1290	\N	2023-06-24	824.6	437.13	387.47
1291	\N	2023-02-01	745.31	1164.1	-418.79
1292	\N	2023-01-30	151.89	547.54	-395.65
1293	\N	2023-10-04	942.95	1307.91	-364.96
1294	\N	2023-07-26	872.83	1394.05	-521.22
1295	\N	2023-09-03	588.55	827.68	-239.13
1296	\N	2023-02-22	321.5	200.17	121.33
1297	\N	2022-11-08	288.37	507.52	-219.15
1298	\N	2022-10-22	207.58	980.87	-773.29
1299	\N	2023-02-01	367.67	1057.52	-689.85
1300	\N	2023-07-03	678.25	880.67	-202.42
1301	\N	2023-05-16	869.78	641.01	228.77
1302	\N	2022-12-30	468.85	104.27	364.58
1303	\N	2023-04-09	145.6	1115.28	-969.68
1304	\N	2023-08-03	878.31	1605.23	-726.92
1305	\N	2023-03-31	488.9	1230.93	-742.03
1306	\N	2022-12-08	805.47	1186.61	-381.14
1307	\N	2023-01-23	785.57	98.75	686.82
1308	\N	2023-01-30	198.17	25.23	172.94
1309	\N	2022-11-20	310.31	71.3	239.01
1310	\N	2022-12-07	600.43	16.49	583.94
1311	\N	2023-05-08	534.83	57.84	476.99
1312	\N	2023-01-24	917.63	1371.95	-454.32
1313	\N	2022-11-06	385.17	85.93	299.24
1314	\N	2023-06-16	858.14	1321.51	-463.37
1315	\N	2022-12-24	258.42	1082.49	-824.07
1316	\N	2023-07-29	168.35	37.43	130.92
1317	\N	2023-08-26	226.17	52.58	173.59
1318	\N	2023-02-04	902.73	383.8	518.93
1319	\N	2023-05-19	426.51	318.33	108.18
1320	\N	2023-06-01	205.79	48.14	157.65
1321	\N	2023-02-26	885.93	1639.12	-753.19
1322	\N	2023-10-03	268.95	996.23	-727.28
1323	\N	2023-06-09	845.61	1289.74	-444.13
1324	\N	2022-11-10	750.82	1640.64	-889.82
1325	\N	2023-02-19	715.73	931.91	-216.18
1326	\N	2023-03-26	973.97	1899.21	-925.24
1327	\N	2022-10-13	111.69	3.37	108.32
1328	\N	2023-08-11	574.25	107.47	466.78
1329	\N	2023-03-27	807.22	284.14	523.08
1330	\N	2023-09-10	363.12	902.34	-539.22
1331	\N	2023-08-05	541.67	916.05	-374.38
1332	\N	2023-07-03	592.99	771.45	-178.46
1333	\N	2022-12-21	723.15	1119.65	-396.5
1334	\N	2022-10-21	165.67	47.78	117.89
1335	\N	2023-09-11	953.11	1833.35	-880.24
1336	\N	2023-05-05	555.83	1434.16	-878.33
1337	\N	2023-08-09	874.5	1109.69	-235.19
1338	\N	2023-08-16	895.27	367.28	527.99
1339	\N	2022-11-01	536.67	85.83	450.84
1340	\N	2023-04-28	995.11	134.99	860.12
1341	\N	2023-07-31	997.13	1920.43	-923.3
1342	\N	2022-11-30	862.12	1385.81	-523.69
1343	\N	2023-01-18	864.41	407.42	456.99
1344	\N	2023-02-23	625.97	104.84	521.13
1345	\N	2023-05-18	444.3	584.11	-139.81
1346	\N	2023-03-14	259.48	1091.17	-831.69
1347	\N	2023-03-18	678.74	46.03	632.71
1348	\N	2022-11-08	365.99	46.52	319.47
1349	\N	2023-07-18	682.57	404.26	278.31
1350	\N	2023-08-18	721.91	1311.08	-589.17
1351	\N	2023-05-29	709.14	603.69	105.45
1352	\N	2023-03-19	375.66	21.59	354.07
1353	\N	2022-12-25	554.79	193.62	361.17
1354	\N	2022-11-20	884.79	595.68	289.11
1355	\N	2023-06-18	871.25	1292.95	-421.7
1356	\N	2023-07-17	370.83	149.56	221.27
1357	\N	2023-03-19	536.61	1101.64	-565.03
1358	\N	2023-05-30	755.63	1268.57	-512.94
1359	\N	2023-02-16	692.72	450.09	242.63
1360	\N	2023-07-04	619.78	1596.79	-977.01
1361	\N	2023-09-24	591.76	291.84	299.92
1362	\N	2023-08-23	464.47	1361.88	-897.41
1363	\N	2022-10-18	478.81	151.03	327.78
1364	\N	2023-07-27	909.54	1479.91	-570.37
1365	\N	2023-01-03	821.51	1456.27	-634.76
1366	\N	2023-04-15	226.74	1084.7	-857.96
1367	\N	2023-05-29	648.24	173.64	474.6
1368	\N	2023-09-16	706.12	60.89	645.23
1369	\N	2023-09-03	993.67	1333.81	-340.14
1370	\N	2023-02-22	737.48	1369.51	-632.03
1371	\N	2023-02-18	887.22	485.72	401.5
1372	\N	2023-07-06	863.61	1722.9	-859.29
1373	\N	2023-07-04	547.34	146.43	400.91
1374	\N	2023-01-25	341.34	1311.02	-969.68
1375	\N	2023-05-02	273.43	124.85	148.58
1376	\N	2023-02-26	672.9	11	661.9
1377	\N	2023-02-24	451.54	647.24	-195.7
1378	\N	2022-10-26	195.5	705.81	-510.31
1379	\N	2023-08-21	692.95	1054.98	-362.03
1380	\N	2023-04-17	395.18	787.08	-391.9
1381	\N	2023-06-12	106.83	448.64	-341.81
1382	\N	2023-08-04	588.42	829.37	-240.95
1383	\N	2023-01-28	734.36	342.45	391.91
1384	\N	2023-07-21	708.6	1704.12	-995.52
1385	\N	2023-09-19	469.29	1111.55	-642.26
1386	\N	2022-11-29	846.62	1372.73	-526.11
1387	\N	2022-10-14	435.75	914.08	-478.33
1388	\N	2022-12-26	650.76	1169.46	-518.7
1389	\N	2023-06-22	760.79	280.81	479.98
1390	\N	2023-01-02	324.61	129.62	194.99
1391	\N	2023-04-12	768.54	1630.38	-861.84
1392	\N	2023-06-30	262.85	979.53	-716.68
1393	\N	2022-10-20	316.27	142.55	173.72
1394	\N	2023-05-26	904.99	608.19	296.8
1395	\N	2023-02-11	266.47	38.76	227.71
1396	\N	2023-01-21	179.22	368.26	-189.04
1397	\N	2022-12-18	795.25	133.13	662.12
1398	\N	2023-03-09	951.75	192.31	759.44
1399	\N	2023-09-20	146.32	36.94	109.38
1400	\N	2023-07-16	638.99	29.48	609.51
1401	\N	2023-04-29	463.73	131.38	332.35
1402	\N	2022-12-11	615.31	507.46	107.85
1403	\N	2023-04-28	401.68	119.82	281.86
1404	\N	2023-06-24	127.24	257.89	-130.65
1405	\N	2023-03-09	457.98	695.39	-237.41
1406	\N	2023-03-28	902.84	1469.33	-566.49
1407	\N	2023-02-22	884.99	1174.31	-289.32
1408	\N	2023-04-22	581.39	130.27	451.12
1409	\N	2022-11-07	611.74	1097.15	-485.41
1410	\N	2023-07-04	809.26	1533.74	-724.48
1411	\N	2023-05-23	482.65	1385.32	-902.67
1412	\N	2022-12-15	745.24	551.25	193.99
1413	\N	2023-06-08	326.22	4.83	321.39
1414	\N	2023-04-19	987.42	23.48	963.94
1415	\N	2023-03-01	783.28	370.37	412.91
1416	\N	2023-07-18	915.27	541.56	373.71
1417	\N	2023-08-15	551.12	168.97	382.15
1418	\N	2023-04-20	641.37	1032.68	-391.31
1419	\N	2023-03-11	836.67	1696.43	-859.76
1420	\N	2023-09-19	677.17	569.52	107.65
1421	\N	2023-08-12	958.63	1886.15	-927.52
1422	\N	2023-05-17	239.8	964.41	-724.61
1423	\N	2023-03-02	687.31	1165.13	-477.82
1424	\N	2023-05-07	973.57	758.16	215.41
1425	\N	2023-08-29	522.33	1330.64	-808.31
1426	\N	2022-12-01	695.28	1294.28	-599
1427	\N	2023-03-07	768.99	1588.5	-819.51
1428	\N	2023-05-03	123.96	20.43	103.53
1429	\N	2023-04-17	851.28	1434.92	-583.64
1430	\N	2023-02-25	880.19	350.56	529.63
1431	\N	2023-05-11	978.74	1361.72	-382.98
1432	\N	2023-09-14	382.62	669	-286.38
1433	\N	2023-05-28	311.42	85.43	225.99
1434	\N	2023-07-30	352.21	1156.05	-803.84
1435	\N	2022-11-12	471.96	366.34	105.62
1436	\N	2023-10-03	682.72	226.93	455.79
1437	\N	2023-03-25	541.71	179.33	362.38
1438	\N	2023-06-07	525.79	55.94	469.85
1439	\N	2023-05-29	855.53	550.55	304.98
1440	\N	2023-01-17	334.1	1266.81	-932.71
1441	\N	2022-12-07	500.48	339.88	160.6
1442	\N	2023-03-24	699.65	1651.13	-951.48
1443	\N	2022-12-24	235.78	99.7	136.08
1444	\N	2023-09-25	465.78	872.61	-406.83
1445	\N	2023-07-31	999.67	1567.89	-568.22
1446	\N	2023-07-02	630.5	853.77	-223.27
1447	\N	2023-04-28	214.62	46.43	168.19
1448	\N	2022-10-24	526.66	74.06	452.6
1449	\N	2023-08-03	210.61	57.26	153.35
1450	\N	2022-11-13	421.92	997.5	-575.58
1451	\N	2023-07-09	857.27	1156.22	-298.95
1452	\N	2023-05-09	639.23	861.62	-222.39
1453	\N	2023-03-04	742.52	1481.97	-739.45
1454	\N	2023-06-20	735.46	1429.37	-693.91
1455	\N	2023-08-09	747.89	1689.56	-941.67
1456	\N	2023-04-20	458.43	129.56	328.87
1457	\N	2023-04-22	757.64	349.79	407.85
1458	\N	2023-07-22	110.42	480.25	-369.83
1459	\N	2023-06-22	917.37	778.89	138.48
1460	\N	2023-05-13	509.68	1399.69	-890.01
1461	\N	2022-10-10	385.52	914.96	-529.44
1462	\N	2023-04-05	285.66	608.9	-323.24
1463	\N	2022-12-18	999.65	738.84	260.81
1464	\N	2023-08-02	515.25	741.12	-225.87
1465	\N	2023-02-13	607.18	395.71	211.47
1466	\N	2023-02-24	749.15	1470.11	-720.96
1467	\N	2022-12-20	568.5	895.01	-326.51
1468	\N	2022-12-09	455.36	314.19	141.17
1469	\N	2023-01-08	366.83	80.46	286.37
1470	\N	2023-05-14	639.99	993.15	-353.16
1471	\N	2023-01-14	603.12	1421.23	-818.11
1472	\N	2023-03-02	897.22	1534.42	-637.2
1473	\N	2023-02-06	305.13	76.8	228.33
1474	\N	2023-03-20	982.85	1727.78	-744.93
1475	\N	2023-05-19	977.32	571.58	405.74
1476	\N	2023-02-28	990.82	1227.17	-236.35
1477	\N	2023-06-22	799.95	1648.21	-848.26
1478	\N	2023-07-20	162.3	27.92	134.38
1479	\N	2023-10-06	259.99	8.94	251.05
1480	\N	2023-01-28	945.7	1194.04	-248.34
1481	\N	2023-02-10	297.8	984.09	-686.29
1482	\N	2023-04-17	433.79	262.78	171.01
1483	\N	2023-05-14	926.74	344.45	582.29
1484	\N	2023-09-25	749.88	1529.72	-779.84
1485	\N	2022-11-08	828.39	1370.24	-541.85
1486	\N	2023-09-19	714.72	174.5	540.22
1487	\N	2023-07-07	211.74	81.27	130.47
1488	\N	2023-10-07	994.43	704.22	290.21
1489	\N	2023-08-22	282.2	121.59	160.61
1490	\N	2023-08-21	571.13	878.24	-307.11
1491	\N	2023-09-16	579.22	1260.35	-681.13
1492	\N	2022-12-08	128.52	26.72	101.8
1493	\N	2022-12-25	476.54	264.42	212.12
1494	\N	2023-10-04	968.15	1736.1	-767.95
1495	\N	2023-07-06	191.15	75.14	116.01
1496	\N	2022-12-23	542.85	963.56	-420.71
1497	\N	2023-09-22	784.31	281.24	503.07
1498	\N	2023-03-20	671.74	1251.85	-580.11
1499	\N	2023-01-30	716.38	1502.75	-786.37
1500	\N	2023-07-24	158.76	296.42	-137.66
1501	\N	2023-08-10	625.51	1616.29	-990.78
1502	\N	2022-10-24	296.46	846.41	-549.95
1503	\N	2023-02-26	319.12	23.56	295.56
1504	\N	2023-06-14	714.51	131.63	582.88
1505	\N	2023-06-24	932.16	1710.34	-778.18
1506	\N	2022-12-01	399.32	517.54	-118.22
1507	\N	2023-07-04	831.53	501.92	329.61
1508	\N	2023-08-29	530.45	894.48	-364.03
1509	\N	2023-02-04	389.96	589.94	-199.98
1510	\N	2023-02-10	431.77	532.29	-100.52
1511	\N	2023-01-26	549.89	260.05	289.84
1512	\N	2023-01-18	987.98	1584.32	-596.34
1513	\N	2023-01-30	727.8	572.53	155.27
1514	\N	2023-08-01	539.57	1526.98	-987.41
1515	\N	2023-02-05	577.23	60.38	516.85
1516	\N	2023-10-02	346.86	1234.98	-888.12
1517	\N	2023-06-15	755.13	1736.22	-981.09
1518	\N	2023-05-12	777.42	501.72	275.7
1519	\N	2023-09-25	141.9	761.97	-620.07
1520	\N	2023-02-26	879.68	1552.59	-672.91
1521	\N	2023-09-06	491.94	1364.81	-872.87
1522	\N	2023-07-02	167.84	64.33	103.51
1523	\N	2023-07-05	435.37	137.67	297.7
1524	\N	2023-09-19	151.81	1145.57	-993.76
1525	\N	2022-12-21	228.35	41.3	187.05
1526	\N	2023-01-17	552.9	924.62	-371.72
1527	\N	2023-03-07	148.98	485.47	-336.49
1528	\N	2023-05-05	509.45	57.33	452.12
1529	\N	2022-12-30	249.24	1225.15	-975.91
1530	\N	2022-12-17	911.96	1082.26	-170.3
1531	\N	2023-05-18	308.24	871.54	-563.3
1532	\N	2023-02-23	682.23	55	627.23
1533	\N	2023-01-30	945.63	1895.62	-949.99
1534	\N	2023-03-09	167.63	23.94	143.69
1535	\N	2023-05-15	726.17	86.86	639.31
1536	\N	2022-11-04	297.33	839.95	-542.62
1537	\N	2023-06-01	431.58	246.63	184.95
1538	\N	2022-11-17	148.45	302.75	-154.3
1539	\N	2022-11-28	333.23	545.74	-212.51
1540	\N	2023-05-07	204.65	484.85	-280.2
1541	\N	2023-08-22	817.28	1591.34	-774.06
1542	\N	2023-08-20	160.38	51.71	108.67
1543	\N	2022-12-12	239.68	422.85	-183.17
1544	\N	2023-01-06	901.53	64.75	836.78
1545	\N	2023-09-21	877.18	197.65	679.53
1546	\N	2023-05-19	603.65	972.97	-369.32
1547	\N	2022-10-24	353.51	870.19	-516.68
1548	\N	2023-09-30	979.56	1142.95	-163.39
1549	\N	2023-03-15	574.6	260.95	313.65
1550	\N	2023-04-07	756.33	375.94	380.39
1551	\N	2022-12-30	369.65	174.02	195.63
1552	\N	2023-04-11	406.64	65.58	341.06
1553	\N	2023-04-27	704.39	167.86	536.53
1554	\N	2022-12-16	859.51	358.83	500.68
1555	\N	2023-01-12	153.45	10.97	142.48
1556	\N	2023-01-20	183.56	799.75	-616.19
1557	\N	2023-04-03	779.39	347.59	431.8
1558	\N	2022-10-29	254.47	975.73	-721.26
1559	\N	2022-11-11	456.51	24.06	432.45
1560	\N	2023-07-09	224.67	56.42	168.25
1561	\N	2023-03-24	875.75	213.65	662.1
1562	\N	2023-04-27	337.36	231.3	106.06
1563	\N	2023-02-13	474.14	76.79	397.35
1564	\N	2022-11-22	638.22	1471.71	-833.49
1565	\N	2023-06-04	251.78	123.48	128.3
1566	\N	2023-06-02	277.49	1016.2	-738.71
1567	\N	2023-07-18	208.59	14.58	194.01
1568	\N	2023-06-29	534.68	1315.74	-781.06
1569	\N	2023-01-02	684.15	1152.74	-468.59
1570	\N	2023-03-19	260.35	1063.24	-802.89
1571	\N	2023-04-23	249.33	531.25	-281.92
1572	\N	2023-01-25	297.18	687.79	-390.61
1573	\N	2023-08-18	828.86	1680.45	-851.59
1574	\N	2023-04-08	623.58	1556.58	-933
1575	\N	2022-12-25	353.4	1203.63	-850.23
1576	\N	2022-10-11	547.49	220.27	327.22
1577	\N	2023-02-03	611.43	121.72	489.71
1578	\N	2023-08-14	980.16	393.18	586.98
1579	\N	2022-11-23	591.94	165.18	426.76
1580	\N	2023-08-24	216.94	442.77	-225.83
1581	\N	2022-11-24	222.93	513	-290.07
1582	\N	2023-07-11	268.42	11.08	257.34
1583	\N	2023-06-15	987.47	209.13	778.34
1584	\N	2023-09-23	584.94	1456.94	-872
1585	\N	2022-11-14	312.14	200.36	111.78
1586	\N	2023-02-23	173.71	283.85	-110.14
1587	\N	2023-03-01	548.4	1345.29	-796.89
1588	\N	2022-12-12	278.85	777.39	-498.54
1589	\N	2023-05-03	164.41	64.02	100.39
1590	\N	2023-05-23	121.25	279.75	-158.5
1591	\N	2023-08-27	506.37	144.96	361.41
1592	\N	2022-11-14	195.33	0.95	194.38
1593	\N	2022-11-18	444.19	1251.27	-807.08
1594	\N	2022-12-14	420.6	27.72	392.88
1595	\N	2023-08-06	141.47	667.74	-526.27
1596	\N	2023-07-11	660.57	1483.88	-823.31
1597	\N	2023-06-20	387.16	176.29	210.87
1598	\N	2023-09-22	206.74	863.31	-656.57
1599	\N	2023-09-19	701.35	1353.42	-652.07
1600	\N	2023-06-01	379.75	240.75	139
1601	\N	2023-05-05	479.76	156.94	322.82
1602	\N	2023-09-11	628.93	1316.87	-687.94
1603	\N	2022-12-31	301.67	17.7	283.97
1604	\N	2022-11-30	528.9	1260.25	-731.35
1605	\N	2023-04-19	655.44	1631.11	-975.67
1606	\N	2022-12-18	600.55	143.82	456.73
1607	\N	2023-08-27	645.34	1105.48	-460.14
1608	\N	2023-06-01	884.79	1411.69	-526.9
1609	\N	2023-08-08	586.13	426.84	159.29
1610	\N	2023-01-11	876.99	397.35	479.64
1611	\N	2023-02-07	160.46	541.64	-381.18
1612	\N	2023-05-10	520.11	877.36	-357.25
1613	\N	2022-12-23	225.77	685.55	-459.78
1614	\N	2023-02-01	502.64	337.17	165.47
1615	\N	2023-06-29	648.93	240.57	408.36
1616	\N	2023-07-15	443.75	204.62	239.13
1617	\N	2022-11-23	748.64	219.07	529.57
1618	\N	2023-09-24	263.65	811.72	-548.07
1619	\N	2023-06-27	742.46	1362.99	-620.53
1620	\N	2023-04-04	607.87	320.18	287.69
1621	\N	2023-02-17	575.61	164.95	410.66
1622	\N	2023-09-03	685.86	1157.99	-472.13
1623	\N	2022-12-03	504.81	250.77	254.04
1624	\N	2023-06-19	460.3	1177.39	-717.09
1625	\N	2023-07-22	164.9	793.84	-628.94
1626	\N	2023-10-05	677.55	120.45	557.1
1627	\N	2023-08-17	709.76	925.38	-215.62
1628	\N	2023-09-08	601.55	892.32	-290.77
1629	\N	2023-05-05	841.14	1257.06	-415.92
1630	\N	2022-12-29	105.55	3.34	102.21
1631	\N	2023-06-19	908.4	626.81	281.59
1632	\N	2023-08-25	209.41	82.7	126.71
1633	\N	2023-08-16	641.91	342.89	299.02
1634	\N	2023-07-23	630.11	356.3	273.81
1635	\N	2023-08-08	430.66	39.52	391.14
1636	\N	2023-08-28	119.12	15.16	103.96
1637	\N	2022-12-28	410.65	1156.84	-746.19
1638	\N	2023-04-24	391.14	532.3	-141.16
1639	\N	2023-09-19	961.51	676.28	285.23
1640	\N	2023-09-27	466.59	1442.36	-975.77
1641	\N	2023-06-09	905.15	1685.21	-780.06
1642	\N	2023-09-04	119.21	517.23	-398.02
1643	\N	2022-12-25	591.64	1579.59	-987.95
1644	\N	2023-07-25	718.24	1326.08	-607.84
1645	\N	2023-06-21	692.81	501.87	190.94
1646	\N	2023-09-02	306.19	742.12	-435.93
1647	\N	2022-10-21	467.51	1121.7	-654.19
1648	\N	2023-02-17	955.22	627.27	327.95
1649	\N	2023-07-03	527.36	1183.17	-655.81
1650	\N	2023-06-15	457.12	239.7	217.42
1651	\N	2023-05-15	612.73	336.7	276.03
1652	\N	2023-02-05	974.74	22.58	952.16
1653	\N	2023-07-04	930.68	1206.86	-276.18
1654	\N	2022-12-07	344.14	86.77	257.37
1655	\N	2023-01-06	577.14	692.43	-115.29
1656	\N	2023-07-16	232.8	1221.75	-988.95
1657	\N	2023-02-26	384.52	85.62	298.9
1658	\N	2023-03-26	794.4	1146.28	-351.88
1659	\N	2023-03-13	550.54	883.8	-333.26
1660	\N	2023-08-31	819.11	79.26	739.85
1661	\N	2023-10-02	860.2	1084.57	-224.37
1662	\N	2023-09-14	894.24	130.79	763.45
1663	\N	2023-01-13	813.52	447.72	365.8
1664	\N	2023-01-22	762.23	335.06	427.17
1665	\N	2022-11-01	245.85	2.48	243.37
1666	\N	2023-03-01	665.22	92.74	572.48
1667	\N	2023-02-08	657.98	151.81	506.17
1668	\N	2022-10-25	862.22	1177.13	-314.91
1669	\N	2023-05-13	453.79	1128.39	-674.6
1670	\N	2023-07-12	929.86	351.08	578.78
1671	\N	2023-02-04	614.56	1590.13	-975.57
1672	\N	2022-12-04	298.1	21.04	277.06
1673	\N	2023-02-04	134.61	1092.54	-957.93
1674	\N	2022-12-27	331.6	42.23	289.37
1675	\N	2023-03-27	680.59	1368.47	-687.88
1676	\N	2023-06-22	229.5	112.93	116.57
1677	\N	2022-12-18	491.21	1487.53	-996.32
1678	\N	2023-02-02	878.53	341.87	536.66
1679	\N	2023-01-28	723.58	1215.14	-491.56
1680	\N	2023-02-10	230.94	432.17	-201.23
1681	\N	2023-09-14	579.27	18.64	560.63
1682	\N	2023-08-05	256.81	405.86	-149.05
1683	\N	2023-06-04	470.92	260.92	210
1684	\N	2023-02-26	316.64	126.63	190.01
1685	\N	2023-06-08	420.97	978.02	-557.05
1686	\N	2023-04-16	244.89	884.09	-639.2
1687	\N	2023-09-21	201.82	778.3	-576.48
1688	\N	2023-04-02	460.58	1325.08	-864.5
1689	\N	2023-08-05	735.41	1417.51	-682.1
1690	\N	2023-01-21	566.12	1133.79	-567.67
1691	\N	2023-07-17	613.81	1062.48	-448.67
1692	\N	2023-05-30	917.95	112.27	805.68
1693	\N	2023-02-24	214.14	4.78	209.36
1694	\N	2023-02-17	730.59	1602.23	-871.64
1695	\N	2022-11-27	730.43	1264.12	-533.69
1696	\N	2023-04-29	929.58	347.58	582
1697	\N	2023-05-10	864.64	1608.39	-743.75
1698	\N	2023-08-14	556.86	348.47	208.39
1699	\N	2023-03-01	250.5	92.22	158.28
1700	\N	2023-05-27	624.6	203.56	421.04
1701	\N	2023-06-13	817.55	571.05	246.5
1702	\N	2023-05-12	813.19	1561.32	-748.13
1703	\N	2023-03-18	872.86	1341.99	-469.13
1704	\N	2022-12-28	308.51	1074.09	-765.58
1705	\N	2023-07-15	794.16	658.41	135.75
1706	\N	2023-04-30	746.88	1163.66	-416.78
1707	\N	2023-07-02	644.49	383.47	261.02
1708	\N	2023-10-07	885.39	417.03	468.36
1709	\N	2023-08-19	789.96	1671.78	-881.82
1710	\N	2023-08-21	565.16	8.09	557.07
1711	\N	2023-07-17	817.18	26.04	791.14
1712	\N	2022-11-28	223.61	30.33	193.28
1713	\N	2023-09-05	191.66	686.29	-494.63
1714	\N	2023-09-28	981.35	1608.44	-627.09
1715	\N	2023-04-04	776.21	983.36	-207.15
1716	\N	2023-01-12	407.37	59.71	347.66
1717	\N	2023-03-26	960.16	1928.79	-968.63
1718	\N	2023-01-17	970.35	724.96	245.39
1719	\N	2022-12-04	807.5	1657.74	-850.24
1720	\N	2023-05-14	594.93	1086.68	-491.75
1721	\N	2022-11-03	502.5	236.59	265.91
1722	\N	2023-03-01	684.77	1649.66	-964.89
1723	\N	2023-01-07	963.24	550.9	412.34
1724	\N	2023-02-04	657.2	1120.92	-463.72
1725	\N	2023-06-11	280.88	577.07	-296.19
1726	\N	2023-08-13	513.66	105.22	408.44
1727	\N	2023-06-17	560.63	211.17	349.46
1728	\N	2023-08-27	411.61	1116.71	-705.1
1729	\N	2023-04-02	469.96	1153.52	-683.56
1730	\N	2023-03-25	319.76	856.35	-536.59
1731	\N	2023-07-14	208.69	98.17	110.52
1732	\N	2023-02-10	787.24	1569.71	-782.47
1733	\N	2023-09-24	213.25	376.43	-163.18
1734	\N	2022-10-15	382.61	270.89	111.72
1735	\N	2023-03-06	367.45	45.42	322.03
1736	\N	2023-03-09	607.94	1355.12	-747.18
1737	\N	2023-08-23	706.61	1174.25	-467.64
1738	\N	2023-05-05	423.99	3.55	420.44
1739	\N	2022-12-05	266.75	135.31	131.44
1740	\N	2023-05-28	280.14	416.71	-136.57
1741	\N	2023-02-18	435.25	1373.28	-938.03
1742	\N	2022-11-12	945.83	558.14	387.69
1743	\N	2022-11-20	842.3	1416.59	-574.29
1744	\N	2023-02-07	221.28	539.75	-318.47
1745	\N	2023-01-15	522.39	1450.24	-927.85
1746	\N	2023-06-07	525.99	230.81	295.18
1747	\N	2023-04-24	446.89	1115.48	-668.59
1748	\N	2023-03-24	282.49	396.25	-113.76
1749	\N	2022-10-12	262.4	428.02	-165.62
1750	\N	2023-09-22	298.53	719.37	-420.84
1751	\N	2023-02-09	743.57	1046.27	-302.7
1752	\N	2022-12-06	861.28	1544.81	-683.53
1753	\N	2023-07-13	117.78	5.59	112.19
1754	\N	2023-06-13	778.28	1697.27	-918.99
1755	\N	2022-12-19	612.41	312.98	299.43
1756	\N	2023-01-04	707.35	1407.81	-700.46
1757	\N	2023-04-28	696.88	1048.15	-351.27
1758	\N	2023-05-07	967.71	268.83	698.88
1759	\N	2023-10-03	342.38	235.82	106.56
1760	\N	2023-06-29	884.81	1618.58	-733.77
1761	\N	2023-03-20	242.37	135.73	106.64
1762	\N	2023-05-06	786.71	1306.66	-519.95
1763	\N	2023-07-19	784.9	1246.14	-461.24
1764	\N	2023-02-18	772.86	218.9	553.96
1765	\N	2023-04-09	538.68	98.97	439.71
1766	\N	2022-12-01	387.29	203.7	183.59
1767	\N	2023-02-09	605.71	212.68	393.03
1768	\N	2023-03-10	565.62	252.83	312.79
1769	\N	2023-03-09	916.67	142.43	774.24
1770	\N	2023-01-02	112.96	1.78	111.18
1771	\N	2023-06-24	332.6	224.23	108.37
1772	\N	2023-05-21	417.46	237.96	179.5
1773	\N	2023-06-19	506.38	61.89	444.49
1774	\N	2023-01-25	284.35	162.59	121.76
1775	\N	2023-08-02	550.57	1270.4	-719.83
1776	\N	2023-09-21	325.81	49.15	276.66
1777	\N	2023-04-14	460.92	144.48	316.44
1778	\N	2023-02-14	775.29	349.03	426.26
1779	\N	2023-09-25	392.23	281.92	110.31
1780	\N	2023-05-31	256.99	496.25	-239.26
1781	\N	2022-12-09	820.14	1588.93	-768.79
1782	\N	2023-04-14	264.15	43.48	220.67
1783	\N	2023-02-20	169.47	511.17	-341.7
1784	\N	2023-07-05	259.21	1016.87	-757.66
1785	\N	2023-06-22	775.42	330.32	445.1
1786	\N	2022-11-16	540.74	791.17	-250.43
1787	\N	2023-08-23	194.4	13.48	180.92
1788	\N	2023-02-14	658.84	477.93	180.91
1789	\N	2023-07-31	326.84	91.26	235.58
1790	\N	2023-05-14	534.86	313.96	220.9
1791	\N	2022-11-02	535.82	154.83	380.99
1792	\N	2022-11-12	691.97	243.51	448.46
1793	\N	2023-04-29	607.63	1309.78	-702.15
1794	\N	2023-06-17	608.15	1251.95	-643.8
1795	\N	2023-01-12	165.47	41.22	124.25
1796	\N	2023-09-02	279.19	69.13	210.06
1797	\N	2023-01-23	840.85	1218.57	-377.72
1798	\N	2023-03-02	519.65	416.76	102.89
1799	\N	2023-07-30	669.26	64.98	604.28
1800	\N	2023-10-02	217.46	606.99	-389.53
1801	\N	2023-07-16	179.89	74.4	105.49
1802	\N	2023-08-29	509.13	734.95	-225.82
1803	\N	2023-06-07	757.2	116.4	640.8
1804	\N	2023-04-02	160.11	26.17	133.94
1805	\N	2023-08-04	312.56	118.06	194.5
1806	\N	2023-08-22	249.11	494.77	-245.66
1807	\N	2023-06-27	704.88	968.4	-263.52
1808	\N	2023-04-28	281.91	100.44	181.47
1809	\N	2023-04-28	136.56	878.21	-741.65
1810	\N	2023-08-26	280.17	91.73	188.44
1811	\N	2022-12-27	517.88	243.01	274.87
1812	\N	2023-01-20	828.21	1611.01	-782.8
1813	\N	2023-02-03	147.27	1032.97	-885.7
1814	\N	2023-01-29	712.66	1676.4	-963.74
1815	\N	2023-07-20	740.9	1152.8	-411.9
1816	\N	2023-07-09	448.73	1177.28	-728.55
1817	\N	2023-04-16	419.3	1205.41	-786.11
1818	\N	2023-02-10	305.21	908.94	-603.73
1819	\N	2022-10-16	343.17	84.74	258.43
1820	\N	2023-06-12	720.37	1567	-846.63
1821	\N	2022-12-05	791.66	1239.38	-447.72
1822	\N	2023-05-12	605.35	1206.98	-601.63
1823	\N	2023-03-31	291.9	190	101.9
1824	\N	2023-03-18	497.9	1145.17	-647.27
1825	\N	2023-09-04	951.62	760.74	190.88
1826	\N	2023-09-16	130.32	1114	-983.68
1827	\N	2023-01-02	122.38	3.83	118.55
1828	\N	2022-12-05	261.52	1228.34	-966.82
1829	\N	2022-12-17	637.19	1609.57	-972.38
1830	\N	2023-06-30	335.3	153.39	181.91
1831	\N	2022-10-30	991.71	1875.11	-883.4
1832	\N	2023-02-26	889.16	1756	-866.84
1833	\N	2022-11-15	211.35	74.29	137.06
1834	\N	2023-06-16	101.1	1.01	100.09
1835	\N	2023-04-01	975.52	553.56	421.96
1836	\N	2023-08-20	807.89	1769.9	-962.01
1837	\N	2022-12-30	457.28	210.96	246.32
1838	\N	2023-02-25	747.13	993.18	-246.05
1839	\N	2023-05-10	658.23	924.09	-265.86
1840	\N	2023-10-10	501.42	89.01	412.41
1841	\N	2022-10-26	272.76	428.42	-155.66
1842	\N	2023-02-24	850.8	206.73	644.07
1843	\N	2022-11-02	782.77	1675.94	-893.17
1844	\N	2023-09-18	334.99	1226.77	-891.78
1845	\N	2023-08-17	818.58	1052.62	-234.04
1846	\N	2023-07-21	674.5	334.75	339.75
1847	\N	2023-08-28	461.16	809.43	-348.27
1848	\N	2023-06-13	925.26	1309.68	-384.42
1849	\N	2023-02-25	853.89	46.88	807.01
1850	\N	2023-04-16	488.87	1281.19	-792.32
1851	\N	2022-12-09	386.94	540.91	-153.97
1852	\N	2022-11-11	433.33	753.4	-320.07
1853	\N	2023-09-28	817.46	1494.54	-677.08
1854	\N	2023-05-02	370.79	248.11	122.68
1855	\N	2023-01-15	166.66	3.45	163.21
1856	\N	2023-06-07	181.65	64.19	117.46
1857	\N	2023-07-05	539.81	326.14	213.67
1858	\N	2023-10-04	908.75	1867.59	-958.84
1859	\N	2022-12-01	762.46	229.47	532.99
1860	\N	2023-07-06	730.6	1508.5	-777.9
1861	\N	2023-04-24	897.12	1735.06	-837.94
1862	\N	2022-10-28	502.13	29.99	472.14
1863	\N	2023-08-31	193.65	593.17	-399.52
1864	\N	2023-01-17	868.2	33.98	834.22
1865	\N	2023-04-13	290.49	1244.21	-953.72
1866	\N	2023-09-12	119.68	729.47	-609.79
1867	\N	2022-12-14	856.69	740.29	116.4
1868	\N	2023-07-28	636.86	450.06	186.8
1869	\N	2023-02-13	104.96	688.03	-583.07
1870	\N	2023-02-20	144.54	21.39	123.15
1871	\N	2023-05-26	648.99	26.7	622.29
1872	\N	2023-04-08	263.34	881.75	-618.41
1873	\N	2022-12-01	385.53	269.71	115.82
1874	\N	2023-09-10	115.8	1032.8	-917
1875	\N	2023-01-19	785.77	1360.31	-574.54
1876	\N	2023-06-13	440.15	959.85	-519.7
1877	\N	2023-07-01	505.27	675.48	-170.21
1878	\N	2023-03-04	448.6	1167.02	-718.42
1879	\N	2023-01-07	650.21	1387.26	-737.05
1880	\N	2022-11-06	520.18	365.32	154.86
1881	\N	2023-01-02	789.41	598.49	190.92
1882	\N	2022-12-02	993.32	1465.68	-472.36
1883	\N	2023-06-22	587.69	764.15	-176.46
1884	\N	2022-11-23	165.67	35.07	130.6
1885	\N	2023-01-20	976.71	358.9	617.81
1886	\N	2023-05-07	812.65	71.23	741.42
1887	\N	2023-06-13	121.31	17.2	104.11
1888	\N	2023-08-14	208.48	644	-435.52
1889	\N	2022-11-01	698.76	1539.3	-840.54
1890	\N	2023-04-14	669.16	1253.83	-584.67
1891	\N	2023-01-05	476.76	1347.03	-870.27
1892	\N	2023-04-20	520.26	329.29	190.97
1893	\N	2023-07-04	195.95	92.39	103.56
1894	\N	2023-06-12	313.37	836.67	-523.3
1895	\N	2023-09-28	596.88	1196.19	-599.31
1896	\N	2022-10-11	758.95	326.7	432.25
1897	\N	2022-12-01	129.32	303.55	-174.23
1898	\N	2023-03-25	356.58	106.04	250.54
1899	\N	2023-07-18	964.77	1168.39	-203.62
1900	\N	2023-02-05	306.94	109.7	197.24
1901	\N	2022-10-11	727.89	1661.83	-933.94
1902	\N	2023-01-06	244.4	98.88	145.52
1903	\N	2023-01-11	193.38	879.02	-685.64
1904	\N	2023-05-17	519.83	380.76	139.07
1905	\N	2023-05-23	242.31	4.68	237.63
1906	\N	2023-05-21	762.46	557.15	205.31
1907	\N	2022-12-06	643.62	1349.5	-705.88
1908	\N	2023-02-24	180.92	520.3	-339.38
1909	\N	2023-05-31	507.53	1071.31	-563.78
1910	\N	2023-08-18	369.1	137.44	231.66
1911	\N	2023-03-06	571.21	1473.84	-902.63
1912	\N	2023-03-04	343.6	207.2	136.4
1913	\N	2023-03-27	581.88	1116.65	-534.77
1914	\N	2023-09-08	484.27	91.37	392.9
1915	\N	2022-10-24	607.92	4.75	603.17
1916	\N	2022-12-09	443.8	1132.25	-688.45
1917	\N	2023-01-22	114.48	6.14	108.34
1918	\N	2023-01-07	170.34	39.48	130.86
1919	\N	2023-02-06	429.37	110.65	318.72
1920	\N	2023-04-29	823.27	1724.32	-901.05
1921	\N	2023-07-30	893.31	540.45	352.86
1922	\N	2023-05-29	583.62	1466.75	-883.13
1923	\N	2023-09-26	984.57	14.69	969.88
1924	\N	2022-11-04	173.66	22.34	151.32
1925	\N	2023-01-23	139.24	494.73	-355.49
1926	\N	2023-04-04	707.98	1121.09	-413.11
1927	\N	2023-02-08	987.75	874.64	113.11
1928	\N	2022-12-23	304.15	19.35	284.8
1929	\N	2023-01-06	756.22	1037.75	-281.53
1930	\N	2023-03-08	140.41	32.59	107.82
1931	\N	2023-07-29	462.94	737.45	-274.51
1932	\N	2022-12-11	627.85	250.24	377.61
1933	\N	2023-01-02	638.33	223.58	414.75
1934	\N	2023-07-16	817.45	1296.37	-478.92
1935	\N	2023-06-14	308.92	795.71	-486.79
1936	\N	2023-07-24	917.52	1319.88	-402.36
1937	\N	2023-07-26	330.35	121.28	209.07
1938	\N	2023-08-25	624.42	1133.93	-509.51
1939	\N	2023-02-08	743.17	3.11	740.06
1940	\N	2023-06-22	524.62	276.07	248.55
1941	\N	2023-09-19	703.46	1112.97	-409.51
1942	\N	2022-12-11	560.77	1242.64	-681.87
1943	\N	2022-12-10	874.97	1168.35	-293.38
1944	\N	2023-09-26	807.27	1291.17	-483.9
1945	\N	2023-05-19	817.57	1717.41	-899.84
1946	\N	2023-03-02	708.6	1016.52	-307.92
1947	\N	2023-05-30	593.3	439.76	153.54
1948	\N	2023-10-03	999.37	1187.54	-188.17
1949	\N	2023-05-01	811.78	481.82	329.96
1950	\N	2023-03-08	454.29	1221.23	-766.94
1951	\N	2022-10-28	951.1	546.67	404.43
1952	\N	2023-03-24	921.94	1850.3	-928.36
1953	\N	2023-04-11	777.16	321.26	455.9
1954	\N	2023-01-26	957.64	1511.68	-554.04
1955	\N	2023-06-09	398.63	830.36	-431.73
1956	\N	2023-05-30	132.99	638.57	-505.58
1957	\N	2022-10-12	206.93	1204.24	-997.31
1958	\N	2022-11-09	666.47	496.7	169.77
1959	\N	2023-07-20	209.14	1186.93	-977.79
1960	\N	2023-06-22	208.93	67.27	141.66
1961	\N	2023-07-29	351.63	580.21	-228.58
1962	\N	2023-07-05	922.6	812.02	110.58
1963	\N	2023-02-10	465.77	1181.21	-715.44
1964	\N	2023-01-31	822.97	979.87	-156.9
1965	\N	2023-01-15	189.6	32.76	156.84
1966	\N	2023-06-19	169.67	601.39	-431.72
1967	\N	2023-03-19	841.1	614.15	226.95
1968	\N	2023-04-16	484.25	357.68	126.57
1969	\N	2023-05-09	854.86	102.48	752.38
1970	\N	2023-04-01	210.69	82.68	128.01
1971	\N	2022-11-14	478.33	282.09	196.24
1972	\N	2022-11-27	586.17	1243.24	-657.07
1973	\N	2023-07-20	976.56	1672.53	-695.97
1974	\N	2023-07-01	534.29	191.2	343.09
1975	\N	2022-11-03	973.19	1846.52	-873.33
1976	\N	2023-01-24	419.29	653.65	-234.36
897	897	2023-08-26	208.7	680.48	-471.78
898	898	2023-06-08	325.42	23.39	302.03
899	899	2022-10-19	947.23	739.78	207.45
900	900	2023-01-16	731.25	336.01	395.24
901	901	2023-06-24	866.9	133.16	733.74
902	902	2023-04-21	988.81	1637.09	-648.28
903	903	2023-01-08	220.84	1000.13	-779.29
904	904	2023-02-15	511.92	931.34	-419.42
905	905	2023-09-01	973.85	1811.1	-837.25
906	906	2023-05-17	686.76	192.67	494.09
907	907	2023-09-05	412.53	278.59	133.94
908	908	2022-10-18	883.18	13.53	869.65
909	909	2023-02-24	392.55	679.24	-286.69
910	910	2023-04-14	116.4	4.54	111.86
911	911	2023-07-29	558.98	1466.09	-907.11
912	912	2023-08-24	870.3	1517.21	-646.91
913	913	2023-04-11	890.5	583.8	306.7
914	914	2023-09-17	372.76	181.33	191.43
915	915	2022-10-15	250.21	737.03	-486.82
916	916	2023-10-06	769.82	1128.35	-358.53
917	917	2022-10-13	803.28	1656.96	-853.68
918	918	2023-07-20	379.2	1165.22	-786.02
919	919	2023-09-11	868.92	1833.37	-964.45
920	920	2023-03-11	976.67	16.83	959.84
921	921	2023-01-05	435.2	114.43	320.77
922	922	2023-02-21	903.97	1045.87	-141.9
923	923	2023-03-07	998.59	780.19	218.4
924	924	2023-09-30	695.1	1032.74	-337.64
925	925	2023-07-11	613.6	906.18	-292.58
926	926	2023-01-14	863.72	1689.33	-825.61
927	927	2022-11-27	540.95	712.12	-171.17
928	928	2023-08-10	378.29	268.49	109.8
929	929	2023-03-19	196.22	79.06	117.16
930	930	2023-07-11	927.22	624.83	302.39
931	931	2022-11-29	939.2	580.62	358.58
932	932	2023-04-26	682.32	1651.33	-969.01
933	933	2023-01-05	546.62	846.26	-299.64
934	934	2022-11-25	462.19	173.89	288.3
935	935	2023-06-22	302.36	566.14	-263.78
936	936	2023-04-26	556.14	283.47	272.67
937	937	2023-07-04	337.98	778.11	-440.13
938	938	2023-06-27	159.72	580.08	-420.36
939	939	2022-10-25	153.74	728.4	-574.66
940	940	2023-01-11	457.42	620.21	-162.79
941	941	2023-07-21	506.79	1389.3	-882.51
942	942	2023-09-02	591.22	1507.91	-916.69
948	948	2023-08-31	360.54	1143.64	-783.1
949	949	2023-04-02	353.22	951.14	-597.92
950	950	2023-01-25	808.64	1694.14	-885.5
951	951	2023-06-15	387.7	56.27	331.43
952	952	2023-03-05	861.62	717.28	144.34
953	953	2023-03-09	307.87	1145.4	-837.53
954	954	2023-09-15	119.98	736.8	-616.82
955	955	2023-06-04	438.49	210.26	228.23
956	956	2023-08-05	785.39	269.29	516.1
957	957	2023-09-10	238.32	475.16	-236.84
958	958	2023-03-27	385.65	31.96	353.69
959	959	2023-05-28	368.16	229.48	138.68
1977	\N	2022-11-22	664.4	357.15	307.25
1978	\N	2022-12-31	630.43	1364.9	-734.47
1979	\N	2022-12-13	280.56	1052.64	-772.08
1980	\N	2023-04-20	453.19	1071.4	-618.21
1981	\N	2023-07-21	225.98	870.55	-644.57
1982	\N	2023-07-11	956.48	143.69	812.79
1983	\N	2022-12-14	299.39	771.05	-471.66
1984	\N	2022-11-03	604.22	813.02	-208.8
1985	\N	2023-07-28	191.2	49.22	141.98
1986	\N	2023-02-03	953.96	1882.77	-928.81
1987	\N	2023-07-25	443.19	549.84	-106.65
1988	\N	2022-12-22	154.73	594.4	-439.67
1989	\N	2023-07-09	681.23	1553.12	-871.89
1990	\N	2022-11-28	221.97	931.62	-709.65
1991	\N	2023-04-08	866.22	1322.32	-456.1
1992	\N	2023-08-20	418.19	134.42	283.77
1993	\N	2022-12-30	593.31	312.48	280.83
1994	\N	2023-03-11	586.44	203.62	382.82
1995	\N	2022-11-10	471.44	37.47	433.97
1996	\N	2023-08-09	682.68	250.76	431.92
1997	\N	2023-07-25	688.84	1402.17	-713.33
1998	\N	2022-10-28	138.89	12.41	126.48
1999	\N	2023-09-16	748.72	475.29	273.43
2000	\N	2023-05-08	138.57	2.93	135.64
\.


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 2000, true);


--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 219
-- Name: jogos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jogos_id_seq', 12, true);


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 217
-- Name: resultado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resultado_id_seq', 2000, true);


--
-- TOC entry 4649 (class 2606 OID 16533)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4653 (class 2606 OID 16565)
-- Name: jogos jogos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogos
    ADD CONSTRAINT jogos_pkey PRIMARY KEY (id);


--
-- TOC entry 4651 (class 2606 OID 16540)
-- Name: resultado resultado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultado
    ADD CONSTRAINT resultado_pkey PRIMARY KEY (id);


--
-- TOC entry 4654 (class 2606 OID 16541)
-- Name: resultado fk_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultado
    ADD CONSTRAINT fk_clientes FOREIGN KEY (clientes_id) REFERENCES public.clientes(id);


-- Completed on 2023-10-11 15:32:45

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-10-11 15:32:45

--
-- PostgreSQL database cluster dump complete
--

