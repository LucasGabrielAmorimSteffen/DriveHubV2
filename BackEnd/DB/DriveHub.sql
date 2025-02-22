--
-- PostgreSQL database cluster dump
--

-- Started on 2025-02-22 10:24:38

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






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

-- Dumped from database version 13.16
-- Dumped by pg_dump version 13.16

-- Started on 2025-02-22 10:24:38

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

-- Completed on 2025-02-22 10:24:38

--
-- PostgreSQL database dump complete
--

--
-- Database "DriveHub" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.16
-- Dumped by pg_dump version 13.16

-- Started on 2025-02-22 10:24:38

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
-- TOC entry 3133 (class 1262 OID 58072)
-- Name: DriveHub; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "DriveHub" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


\connect "DriveHub"

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
-- TOC entry 216 (class 1259 OID 66944)
-- Name: talunos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talunos (
    id_aluno integer NOT NULL,
    nome_aluno character varying(255),
    cpf_aluno character varying(14),
    data_nascimento date,
    renach character varying(50),
    sexo character(1),
    cat_pretendida character varying(2),
    rg character varying(20),
    emissor character varying(20),
    uf character varying(2),
    cat_cnh character varying(2),
    local_nascimento character varying(100),
    uf_nascimento character varying(2),
    nacionalidade character varying(100),
    foto_aluno bytea,
    telefone character varying(21),
    email character varying(255),
    ativo boolean
);


--
-- TOC entry 215 (class 1259 OID 66942)
-- Name: talunos_id_aluno_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talunos_id_aluno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 215
-- Name: talunos_id_aluno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talunos_id_aluno_seq OWNED BY public.talunos.id_aluno;


--
-- TOC entry 220 (class 1259 OID 91548)
-- Name: taulasfotos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taulasfotos (
    id_aula integer NOT NULL,
    id_aluno integer NOT NULL,
    nome_aluno character varying(255) NOT NULL,
    id_instrutor integer NOT NULL,
    id_veiculo integer NOT NULL,
    data_aula timestamp without time zone NOT NULL,
    duracao integer NOT NULL,
    foto_istrutorincial bytea NOT NULL,
    foto_alunoinicial bytea NOT NULL,
    video_aula bytea NOT NULL,
    foto_instrutorfinal bytea NOT NULL,
    foto_alunofinal bytea NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 66784)
-- Name: taulasinfo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taulasinfo (
    id_aula integer NOT NULL,
    id_aluno integer NOT NULL,
    id_instrutor integer NOT NULL,
    id_veiculo integer,
    data_aula timestamp without time zone NOT NULL,
    duracao integer NOT NULL,
    status character varying(50) DEFAULT 'pendente'::character varying,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 208 (class 1259 OID 66782)
-- Name: taulasinfo_id_aula_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taulasinfo_id_aula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 208
-- Name: taulasinfo_id_aula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taulasinfo_id_aula_seq OWNED BY public.taulasinfo.id_aula;


--
-- TOC entry 210 (class 1259 OID 66839)
-- Name: taulasvid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taulasvid (
    id_aula integer NOT NULL,
    id_aluno integer NOT NULL,
    nome_aluno character varying(255) NOT NULL,
    id_instrutor integer NOT NULL,
    id_veiculo integer NOT NULL,
    data_aula timestamp without time zone NOT NULL,
    duracao integer NOT NULL,
    status character varying(50) DEFAULT 'pendente'::character varying
);


--
-- TOC entry 205 (class 1259 OID 66740)
-- Name: tdispositivos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tdispositivos (
    id_dispositivo integer NOT NULL,
    descricao character varying(255) NOT NULL,
    tipo character varying(50) NOT NULL,
    status character varying(50) DEFAULT 'ativo'::character varying,
    data_cadastro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 204 (class 1259 OID 66738)
-- Name: tdispositivos_id_dispositivo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tdispositivos_id_dispositivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 204
-- Name: tdispositivos_id_dispositivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tdispositivos_id_dispositivo_seq OWNED BY public.tdispositivos.id_dispositivo;


--
-- TOC entry 207 (class 1259 OID 66768)
-- Name: tempresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tempresa (
    id_empresa integer NOT NULL,
    nome_empresa character varying(150) NOT NULL,
    cnpj_empresa character varying(19) NOT NULL,
    logradouro character varying(255),
    telefone_empresa character varying(15),
    email_empresa character varying(255),
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fantasia_empresa character varying(150) NOT NULL,
    numero_endereco character varying(5),
    bairro_endereco character varying(50)
);


--
-- TOC entry 206 (class 1259 OID 66766)
-- Name: tempresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tempresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 206
-- Name: tempresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tempresa_id_empresa_seq OWNED BY public.tempresa.id_empresa;


--
-- TOC entry 203 (class 1259 OID 66728)
-- Name: tinstrutores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tinstrutores (
    id_instrutor integer NOT NULL,
    nome_instrutor character varying(100) NOT NULL,
    cpf_instrutor character varying(11) NOT NULL,
    data_nascimento date NOT NULL,
    telefone character varying(15),
    email_instrutor character varying(255),
    data_admissao date NOT NULL,
    status character varying(50) DEFAULT 'ativo'::character varying,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 202 (class 1259 OID 66726)
-- Name: tinstrutores_id_instrutor_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tinstrutores_id_instrutor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 202
-- Name: tinstrutores_id_instrutor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tinstrutores_id_instrutor_seq OWNED BY public.tinstrutores.id_instrutor;


--
-- TOC entry 212 (class 1259 OID 66870)
-- Name: tsaldos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tsaldos (
    id_saldo integer NOT NULL,
    id_aluno integer NOT NULL,
    saldo_atual numeric(10,2) DEFAULT 0.00 NOT NULL,
    data_atualizacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 211 (class 1259 OID 66868)
-- Name: tsaldos_id_saldo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tsaldos_id_saldo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 211
-- Name: tsaldos_id_saldo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tsaldos_id_saldo_seq OWNED BY public.tsaldos.id_saldo;


--
-- TOC entry 214 (class 1259 OID 66885)
-- Name: ttransferencias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ttransferencias (
    id_transferencia integer NOT NULL,
    id_aluno_origem integer NOT NULL,
    id_aluno_destino integer NOT NULL,
    valor numeric(10,2) NOT NULL,
    data_transferencia timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    descricao character varying(255)
);


--
-- TOC entry 213 (class 1259 OID 66883)
-- Name: ttransferencias_id_transferencia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ttransferencias_id_transferencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 213
-- Name: ttransferencias_id_transferencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ttransferencias_id_transferencia_seq OWNED BY public.ttransferencias.id_transferencia;


--
-- TOC entry 219 (class 1259 OID 66976)
-- Name: tusuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tusuarios (
    id_usuario integer NOT NULL,
    nome_usuario character varying(100) NOT NULL,
    email_usuario character varying(255) NOT NULL,
    senha_usuario character varying(255) NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer NOT NULL,
    licenca_acesso character varying(15) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 66974)
-- Name: tusuarios_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tusuarios_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 218
-- Name: tusuarios_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tusuarios_id_empresa_seq OWNED BY public.tusuarios.id_empresa;


--
-- TOC entry 217 (class 1259 OID 66972)
-- Name: tusuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tusuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 217
-- Name: tusuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tusuarios_id_usuario_seq OWNED BY public.tusuarios.id_usuario;


--
-- TOC entry 201 (class 1259 OID 66716)
-- Name: tveiculos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tveiculos (
    id_veiculo integer NOT NULL,
    modelo character varying(100) NOT NULL,
    marca character varying(50) NOT NULL,
    ano_fabricacao integer NOT NULL,
    placa character varying(7) NOT NULL,
    data_aquisicao date NOT NULL,
    status character varying(50) DEFAULT 'ativo'::character varying,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 200 (class 1259 OID 66714)
-- Name: tveiculos_id_veiculo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tveiculos_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 200
-- Name: tveiculos_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tveiculos_id_veiculo_seq OWNED BY public.tveiculos.id_veiculo;


--
-- TOC entry 2932 (class 2604 OID 66947)
-- Name: talunos id_aluno; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talunos ALTER COLUMN id_aluno SET DEFAULT nextval('public.talunos_id_aluno_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 66787)
-- Name: taulasinfo id_aula; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasinfo ALTER COLUMN id_aula SET DEFAULT nextval('public.taulasinfo_id_aula_seq'::regclass);


--
-- TOC entry 2918 (class 2604 OID 66743)
-- Name: tdispositivos id_dispositivo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdispositivos ALTER COLUMN id_dispositivo SET DEFAULT nextval('public.tdispositivos_id_dispositivo_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 66771)
-- Name: tempresa id_empresa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tempresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.tempresa_id_empresa_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 66731)
-- Name: tinstrutores id_instrutor; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tinstrutores ALTER COLUMN id_instrutor SET DEFAULT nextval('public.tinstrutores_id_instrutor_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 66873)
-- Name: tsaldos id_saldo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsaldos ALTER COLUMN id_saldo SET DEFAULT nextval('public.tsaldos_id_saldo_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 66888)
-- Name: ttransferencias id_transferencia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ttransferencias ALTER COLUMN id_transferencia SET DEFAULT nextval('public.ttransferencias_id_transferencia_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 66979)
-- Name: tusuarios id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tusuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.tusuarios_id_usuario_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 66981)
-- Name: tusuarios id_empresa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tusuarios ALTER COLUMN id_empresa SET DEFAULT nextval('public.tusuarios_id_empresa_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 66719)
-- Name: tveiculos id_veiculo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tveiculos ALTER COLUMN id_veiculo SET DEFAULT nextval('public.tveiculos_id_veiculo_seq'::regclass);


--
-- TOC entry 3123 (class 0 OID 66944)
-- Dependencies: 216
-- Data for Name: talunos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.talunos (id_aluno, nome_aluno, cpf_aluno, data_nascimento, renach, sexo, cat_pretendida, rg, emissor, uf, cat_cnh, local_nascimento, uf_nascimento, nacionalidade, foto_aluno, telefone, email, ativo) FROM stdin;
1	Lucas Gabriel Amorim Steffen	05378492114	2006-09-13	668165804	M	B	300400	SSP	MT	B	Sinop	MT	Brasileiro	\\xffd8ffdb0084000201010101010201010102020202020403020202020504040304060506060605060606070908060709070606080b08090a0a0a0a0a06080b0c0b0a0c090a0a0a01020202020202050303050a0706070a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0affc0001108028001e103012200021101031101ffc401a20000010501010101010100000000000000000102030405060708090a0b100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9fa0100030101010101010101010000000000000102030405060708090a0b1100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fdfca28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28c8f5a323d6800a46381d29722b23c57e31f0cf8374a935cf126b56d616d0f325c5d3ed51fe714059bd8d5049185142820f35f31fc55ff0082a87ecbde0357b6d0bc5d65af5cab6d31dbdd145cf3df69c74eb8a8be127fc14b7e14fc45b07d5b54d434ad182360db4da9199f6fae760fcab3955a7176b9b2c35571e6b1f51d15e21a07edcdf033c51ac2e91a2f8dec6762fb3292679fa57ad689e28d2b5bb55bcb3b94950f464e94d5483764c874e695da3568a6a488ea194f1da9d5640514641e868a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002918646334b919c669aeea173b87503f1a02d710e1475c8349210474c73dbbd7877ed2ff00f0501fd9aff65db84b0f88fe33592f9c809a769ea2690374038fbbef9e457e72fed9bff05d5f8b7e385bbf04fc04b08fc31a34aad14ba8c8e5af2453fc48dd54fd307d08ac6a6228d2f8b73a29612b556b9763f593e23fc5bf86bf08bc3f73e28f897e35d2f45b1b58c497335fdc2a045cf048ebf90af90be39ffc173ff64bf01e9938f84dacc7e34d4f0a2d96de631dbcc4e70158292c0639e3f1afc57f167c64f1f78cf59fed6f13f8bf5cd5ae8bfc97faa6ad24aefeb90eeecbed93f4ac069f59bbb38e3f3d99d482c5a424e0939eb5c33cc657f70f4a196d3b7ef0fd01f8b1ff0005fefda53c6da54ba6f843c37a5786e29c388dad55bcf041c1e656cf19f415f34fc42fdb83f696f8c8ff00d8be3ef8d3addf598b83bad19d4804e318c76eb5e322c592394dbb6d531feff79e18ff005a6596a7630dc19ede42aa53e658061010319c7af3fad724f1152a6e74d2a3878bb53e875ba86a17f292875495ae9238fcc8dfab025f049a9ecfc6de20b3b47b3b4d5a4c043bc34857637b5738b78b768f0a9901923448b07ef94c804ffdf5576db467594b4d14cdf30dc913f43ea7fcf7acf99bd8ea4937a9daf84be24f8a74fd6526b5f164fa7949a42648f9c36f3f3e7fcf5afa77f67eff00828df8ff00e115dc293fc44bdd46d62950c914e72b27ce3240f5c66be4637fa7e97e62e214c100990f238f5a886b715b5b0f261ca24bfbb90275241e334f9aa4751f252eba9fb25f0aff00e0b6bfb2eeb261d3bc6daddc69bbd136dc3461951b90411d7d4f1cd7d43f06ff00698f821f1db4b4d57e167c47b1d59256d8b1c7956cff00b8df37e3d2bf9c9b6bbd16791a77b1d8ac099e40bce7ff00d75b9e10f1d78fbc25145a9f80bc69ab6973c27e592c75468a5273d50860738f7aeaa58f9c5a52d8f33118155277842c7f4bb02c48c42e149ea9dbeb521741d5c7e75f84df04ff00e0b0ff00b607c2231417ff001246b965688638b4df1126e1ecd23edde4e7a7cfc9afb63f677ff82ef7ecf7e3c863d2fe3be9d73e17d577a246fa759cd756f2e700bc8366e8467d78f7af4296229d4d8f3ab612a515767e81515ce7c3af89fe03f8a1a3c3e20f0378b34fd52dae220f1cb657218e0f62b9ca9fa8ae8f23d6ba0e50a2804119068a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a0903a9a424639a005c81d4d3642361e6a1b8beb6801deca31dcd735e34f8abe15f055b79bab6ab0c4464932bed55f5c9edc526d455d8d45cb447507014973d39eb583e2ff008a1e05f02597f6878bfc4b69631019679e5000edfe15f25fed2fff000550f879f0eb41ba5f076bef7f7cacd1daff0066cc8ecb276ca9ea3eb5f99bfb477ed9ff0017ff00684d45b51f881e299ef23427cbb782436fe53e7ee301c30c579f5730a70d16e7a786cb2a54dcfd6af1dffc153ff669f06dedce972ebfe7cb6ea4f991e023fa60f7fc2be3cfdabffe0b79e36f11e9d73e18f805a2fd82192178e4d46f30b20e3ac78fe23d01ed9cd7e7bea7ae35c6c105f808304452cc64901cf2a1ba018e6b2afe19ef62973766dd59898d24f9f763afd2b86ae3eb34d23d4a59751a2d396e6cf89fe30eadaaf89ee7c43e24852fb51b9944a649a725b691d5bb17ddc935e7b79ab5c6b5ad5c5dea9248a2673b70f9005695bf85efeeef1e5b2b59e4631ed8e5893680c7807278ab8fe14b9d2a156d535386368cee1e610e550f18200f5ae4e752d65b9b4e34d3b983672786a0b659ee06f7590fc8e3d3be2abea3e2313652d605f2dc8cae3a8a6788a35b8d589b591250a70c5176f1507913dbdacd23011fcb9859f9dbcd1ed2e45b9f524b9996381259ae102b7fab5eb8f5fc6a19af208d55e588364ffab8c72ebddbaf6feb4c6b6b364dd0bac8acedb59d4f391f36dc773501d32e510fd9eca531c477465f19c1f426a83d9a2fc3ae7d908fb17cae8dba2778f1b7d89cd3e6f1aeb9b84d26aa8496fdec76d163b75fe55916f034e3171bb970ec980323ebf8d4b6fa53c6d73736cf2b6e940dc46762e0f1cf6ce280f6696a6936afac5bc665b9767dcd9932a0e4f6fd292d7c49a92dabceb78aa449d00c90bee0f4ac892724cbbd824813646d839ce41e9f81a8a25b92af0c7705c160cecabcb1f4fca819d3c3e28412b1fb42178d8024b1e723a56c69dabcf25bb44661b77a83185006ddd96faf15c6dbd9492bb626644623702bc63db15711ef6d6f2482e4f9abd23646c11f5f6a01ec746492cc2648caabb160afd493f274f415269b16ac4061030232d31899b9504672075c8ac6d2756b9b62e26f28019c151f30fc6bb0f0deb42ea08c8b3562146d66c8279e945eda94d2942cce97e1a7c73f8a1f06bc4f67e32f03ebd75a75edbdc168d63b994460eece4a061bb2b81ce7a57e89fecd9ff05e3165a22687fb45782e79aee043236af60e76ba7000284707e99cf7afce9bd8ed25789eeb475462ac0c9e6f43b4e3ad62df3d8dbc210eaec1e183f79105e77103906b68e32bc17bbb1c73c1d29bb9fd077ecf3fb6a7c02fda4ed049e04f185bc5784853a5ea132c5740119076e79079c63d0d7afc2d1966f9c6060633c835fcd1f837e246b3e14d4a1d6bc3faf347776cecf1c827f2cc4001f36e1c93e807bd7dd1fb1cff00c163fe24fc3d9068df1cbc5373e26818482dacae9045294f31b0e92f462075dc73d2bd5a38c8ce1796e7975b05253bc363f5e015e808e3af342edec2bce3f67bfda6fe10fed15e1a1e21f871e28b7b993607bdb16b956b8b6ff7d41c81db7631c57a2a49160b29006339cf18f5aec8b5257471ca3caecf71f452065270181e3d696992145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500148e4852452e475cd23ed28437208a035232405dc476ef5cf7c46f88ba1fc39f0dcfe22d6af1214862662d23000607bd64fc4af8c1e1af035d43a5ea5ac416ed244cecef920015f991ff000559ff00828ad978caca5f859f0e357ba78e024dd5e5ab7cadea3dfe95857aea945d8efc260a5555dec7a6fc77ff0082c5f83bc39adfd9bc337f1de3a336f854643919180457c35fb43ffc1447e30fc7cd46f74e3a94f61a6dc3318ed219d848a077dde9c57ce37dafc97b2f92d28691d84cb33364aaee190714db5f10b2470dbd82bc3e6c4639c88f76e058e793d3d7e95e24f1356a6a7bf87c2d2a51d3a1bf73e26bcb7325d4b70669599482f3ef2e71ea3f3ac8bbd4e7d42792e6e9898f616544939127e35cd4576d7de5869183a4afb0acca14ed6c0ce0fa66b425d4246952d84c371738748f3b4e0e38efcf19fc6b9e4b9ddcd233f79169b57b87786608caa40048501724e307d4d6d59dd58476e5b5194b9462cb1290bbb8e9cd732baac3648d24722ab93b5cb8dcbbf3c91e9e9525b41752d989162cf9eec7733673819e3df8ac25b9d4e77474faaf8a22b9060d3f4b36f188c798be7f427e9c1f7158fad5c4f33332cbbfcdb7dace3395c74e0f5cfad6ce93a146b6c26bd40d119418580e73b707355e675f3b68b18e52c8176b1e400a7934cc9eaac60c3a517ba324b70a7cd7070e87b0e0d54d4f4e784233200e1c956e7047b83d4574505d14559a44815cb6d11a8cb103d2b32f2d1ee312dc232233e54382405240dd9f4a0c79353261b58213bef2d0ee32075646057807ee8cfca39e948d656d7168b62caff7039d8b82bce7a835b3a6d92ea4823b7313a640f30a15ea33800f5adbbcf09430587dbd5439688960a300118ea6ba15f9558ce54f5392b8b29b4c1f66b5811a35650b2bf2780463e9c5519659e595a397e7746dcb1c4d85ce31f31e98e738f615b7a95cda42d259464bcaea098c8fba7dbf3a65cdac06248a30159d86e509825b06a9f3db51b8591cdcd12c42055cddb5b87f32743fc441e7df1d3f1ab9676b6d1daab3805962556ba0d81b9b8e9df009ab76be1d96de259af0ac3106264c03cae0fa5104f0ac4d71b5234872be547164919e320f7e86a496afa1496d25338892eb7c684a3303b482a38f96a68a165844ae56e9ca6e8c3363be304f7fa536f0460b4edbda62cac8d9001cfd3da96f16058a4b748a4591dd4c4124002af727f1a05c896a5ab08c22a4696ebbe4dc594838e074c9e2a5d3ccf03732cb1a85dc1d98e3767a0ac9b6d6af6dd21369749b72cb3606e380739fff00556fe8be2ed0e742da85b4d1ccff002c3209176023b906819b7a3f88af2ea58cb5e4cfd4166c12a07f773fae6b46eadacb52b39a48e068256ef11dca40ee73d0f3f4ac97bed2e152f710acd3601565420007bf15ad67a7c52956f3096f2f74b6ab950ea7b64d00635ed83d82acd003194755f3255e013ec3ae715a7a05f5bc96b2437cdb8990895c291b71ec7a75a82fac2e6d67fb35dd9f932055ddba70769392aca4f19c564417a975349717b2bc1711b1501bef3edfe36f5ebd075cd1cca3a8d2e6763d03c11e3ff885f08bc4f6be33f851f116e745bab7903fdaedae5fcc8ce0ec70a082c465803d016cf35f767ec89ff05d6f1d786574af04fed07e15bdd66c8158ae7c4379708b75128ce4b6dff5adc825987231d715f9cb6d34da83949a5876aa29241f98939c1e3a038e9ed562de1ba12af9712c73ef1e6e241b4af38ce6ba68e32b537e4635b09427177dcfe92fe05fc69f85bf1dbc171f8f7e13f8b6d357d36e1b225b576cc6dfdd756f995bafb1c715da82a32770c7d6bf9ccfd9a3f6b2f8a7fb2e78e2cfc6ff000f75abe87ec575fbdd3bed0c60b94dd964906080a403c1001f5e2bf62bf611ff008299fc17fdb02da2f0f4f3c7a378c1e057bbd2263989caa00de5484296e727691f4c8af568e2a9d695ba9e2627092c3bd363ea90ca49008c8eb4b515b3a32901f241c11e9ed52820f435d471851451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400507918a2918e0139ed43d0040400431c7d6b99f897e3ad33c09e1a9b5abeb9019226689430f98819c01deba2988f28b3938c726be09ff0082cc7c53f16f847c076f6161a84b6766f282f756d210cac47cb8c7506b871b8974295d753a70747dbd5e53e4ff00f82857eddb79f137c737767a0ea773646dd96326de6c0590e415e3b7afa57c47e2af1149a84af35d4334f2b3967769b25b3eb4ff001bebf73aadedcea0f2f99248f1be5db2496fbc4fbfad60436771a8de2c170d19333046550772f7fe95e14f10ea3d4fada1429c2972db625b3b102c1f50bb8b2554a05dbb4af7fc6b1d655becec631387c45b5fef7f919ad6f156a0cb23d9e9b2ed8a2b72af8889dedea0d61c33b4504caec8f2304dacbf747d0fad2215f9d92cd1319e49642b0c51a6d6409c1e3a83f5a6c97d6ad3c04dd95314458b843c90095fd71505f1452b15c5c3e1c60c6a339cd6639916e444885d420e18e3033c13e833412dfbc8b7a7efd42f109f2ff770b4b70cb920166c631fdee7a5753a03b6a370a350610ac4408d94e02a7f78fb9ac5d2ad4fd99ee9af19598112bac3f28fa1ef53da5dac16c96f6f0b33cd2047daf969067a8aca5b9bdd1d6eafabcd736ef2595c95b2b560a823c02c4f058d739ac78861d4648e0862758f956677c3107a938e72299e29f13d8450c7a369d66a91c670d3a2316671ce091c7d6b1b4eba8b52d423fb41900670a36467bfad3d84f6d0eef43d0a76d21b59be9fc98e20000464607dd23be4f7ab5e338b4d834287ec45599d3cb531f523a8e3d2b1352f164975a147a55b5f18fc96e3cb0332283dbd451a878897508e1495df6451006272031f623a8fad6729be72173a7ab24d36e9d248c48aeab0c3d03000b718feb57b57f11cd7ba4bdadaee445015dcb8da5b23bd615c6a30dbc2d7a519a4501608073b327a7fb46ab41f6dd7276b6789bca7918f970ff7b1919c7d2b4e72e5aa34618f4e490b1d41e49669882224058363a7b2f5e7e94c16ef77aaacd6f6df67689be7032db971d73d3d2b4b4ad3acacae2349e751388e3768c0f99588391ec471d6b7859ff66c097d3dc98c10777da80dec3d38ed4d49b62947447146daea0592e3549f6c04be41192c3040007d71f955294ac4e66fb344ed14acc4608f31768c66bab974db0d46d7ed13ddb2319328148c9f6fa5675fe9f6703c975a9dbcb18593686233bb835a276773192bbb1c936ab116f2d2c9312a46594120e02af03d067f95556b7bb001163242ed23046136e18ce704d6e5fe9904f2c76f1894c4a0fef24202018e99f5aa66ce08edd461da4ddcc61f9fcaab9ee4b8a4517c2da324c111c9262e77607a7cbd2ac2b48268a2b7b490858170772eddc4f39a6c31bdc5f464accaa8c432b8002f1df34a625b5b59ee272ef37263dc72b8c8c63144be124dcb1b891dbcb59b7b63611e590463ebd6a54d6ef6c0adbdccb9018957995b771d8573fa65f5ac2c67be5421db74c15cee5058e0815aa35ab2bb8a4b3852162242124742485fafad34af1b05d2d59a1178a5f574696f25668c7caaa7a96ed81d6a6b58fedb6ed3230de14af98ac3e56efbbd3b5621fb22877b39262f1af2b20e14ff00787a0ab365a94fa5a94458d55a2cb3870c1d891934bd9a173c5e86d69ba8cb04b1a5efccea36baec009c7427f3fd6ba286296f0b84b65dce9947f2c95dbdf91c0ed5816b27f6aef8986c951f7bc813864c0c806ba0f07dd47a75e99d26409b48df29dc147a0f7a57b685276772918bec47ca82dd4367323480fef07a7357fc19e37d6bc19e28b1f15687a95ddadd69f319619ad9c6d2d8c60f201c0cf19eb5a5e2e06eed556355684e0c3295c9638ef8e83eb5c9457104f26d9ed85babbe1517237b0ee01ebebc55c67c8ee6728c66f53f753fe0999fb76dafed2ff0cedf40f1bea3643c47a728825686e08f3502811b3ab7dd91867819ce2beb1b70a54c8a4fcdd413d2bf9cbfd99bf680f11fc00f88fa67c48f0c4ce444fb4a161b2619c73cf54fbe3d48c57ef5feca5f1e7c39fb417c1fd33e2168faa452bdd5bab5c289b2c0e31b994fdc2c41257b1e2bddc2d7f6d4eecf0b1786f633bad8f4da2916446ced707070707bd2d751c6145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500148cc3612083c5293db35e77fb43fed09e0ffd9e7c0b73e39f17dd288203f22160a090338fd47e7532928c6ec718ca6ec8eabc75e32d07c0fe17baf11788f5482cedede224cd3ca1143638193dc9afc30ff8280fed4fe2ff008e7f14f55d1351f11acfa25bdf3bd85ac378d25b2be705d31d0ff749e335bdfb7eff00c147fc7ffb4debd3f86b40d7af2c741203369d69705623b49e491cb1ff0066be499751b948d6d6ea4df2c7b049e6291b413cf5ea6be7731c742a2e447d4e5981961e3cd333359b88cdecd6f711ba18e60aeae40383dfe94ff07c96c2f9aeda52e633b5d42e413eb9fa545aa416c3509e488f992aae0b2c64f98dfecfa9a6e849736f7ac9044089177951f7b27d07ad714a77a68f4a69b7ee9957f7b6f2de5dca2dd918ccef12b3606d2718e6b36d8cf6d2c9be124f5405c119ad0d6ad6fec35292f0c29e6427e400e481ee3f1acfb986d849be0836a98c176df93bc9e87d29c1a466d6852b82b15efc80cb23ca9e602d85c6e1f74d456696ee1442b0ac8cbb5fcd5249c65b83d3a153f423d6acea564209619e0474746e48ea2a5b4b726e04521ca40aa19fcd192405e71ee100fc69cea6a62a0ae6a6993410786640e63f3518fc89c100f1fd6b2d2e6ea49432ef06001955482739f4a9bc9962b792e834823b89babb7ca83d0fd3ad5bb3d1f6592abec95e498721b1b933f7b3e9ef53653d4d3d9987a8a3b5fa284dd11ccc4bb6064f079f6ab56064b2b6f36d9d54a8439073b78a9174e85310946454621bccee3767f5a9a4b6b287ccb5462aea37b9ff0067b0a6a31b87258769566354d49eee692348436e666703ca4ee08ec7be2a6b86fedcba9a68a63e445fbb86464dace3dbd7eb55efafa56667494dbac279545c315231cfd6a3fed7fde33c713aa0c04698e006ff001a1c1735c89ebb1ad6d169566edba39ae1910312ae4018ebc8efed572d7c5335b7996da743e57c84c7b98b633dce475cd72b06a979085b7bc91dd9a53be543b4a820f07d8d3f41bcc4b75713491ed0cf97917eea86240cfbf156dc6db17513e546dd9cd74f21b8b8918486424ccc31923a8ad0d3ee5eea7749ee9e585872d336141c8e84fb66b99835d80aca6d622de5a0972633c163c9fc3fad5eb0d45dae7edb797d0b2821573163391d31f5acdbb208ec75e755d1d3501a1e830cf22e42090af064233c13d4706a0bdd3f50d4eec69db1440ec0cd2329deadff00ea35774bfb0e996b05f6bf77e5cf0296f931b597a8cfa1e07355b56f13595d5cc9a6a4611fcdc08eddf24af2a33e9f7455424da264aecabe21d32c649ce9da0c4d205203ceedb493df8aa7a9783adb4e885feb17f3084fcca6261f31c763debaa6fed7b0d297528acd6de355da10fcc5b3fd6b1e2b19351b954bf824b8541928ad8039e9f5f6ab7b13c872973637f30fb3c7bcac9968cb0e7a743ef550c52bc3e68b756f263287cd6da15bfc7dabafd76ef4eb68a6b7169382ae366d232b5ce5e6a08245b8b995c46b29f91c71f77bfbd6b0d8ca50b3b99682d3ec8649263948c1d863c64ff5155e12d948642e0365c3a7cbc9ec4d4d34f25cf9915cae242aa61017b639aad710ca0449b88320259bb6074c5549d912d6859b3babd0c4ab952411fbc5dc24191c71f5abc196449655821699b263201f901dbdab9e7b82062e8cfe6ae70224f91874049ed827357ecf5792da585a4b6886f6fddc04e4853cff002207e15118dddd92b73add2a79a42931b66641bd526120c963b780a3e95b3a48d4ad6e1a468b7e5c96e3efa1fe203d060d72fa16a369148f3c05994be1216888f29bbb1f415d7d947f6594ea9652a42e4ab7dd2c02376c7e07f3a9705cc6906b9b535a4d367bad3935dd32695d0c9b65420ed5e0e2b93d4e29b4e02dee67227c868db78010839c9cf418e3f1aeee3be4d2e31732c51bc13c4423c4a76b1ee71ea2b9ad7d6596712e957115c46f28474e03212338354a090df2396867e9dadab3aee9e35f31898f71dc233e800afb33fe0973fb775dfecc7f11174bf15eab772f84f596487528d4992388e4209157a8db9c923803ad7c4ed71279de4889c4bbcaa9520aa01d58d6b695adbc36ab247b83443fd1cc4a502ca181dc587cc73e83835bc2b7258e7ab46351389fd3af87f58d235fd26db57d12fe2b9b4b98565b6b88986d9508c8615a1c76af80bfe08e9fb71ea1f113c090fc16f89da9afdbac5d86997d3100dc21c61093cee04e003ce315f7d40e922178db23383f5af7a9c94e09a3e7aad274a6d31f45145599051451400514514005145140051451400514514005145140051451400514514005145140051451400504e013454725c42032f9a320738f7e94032bea9a85a58e9971a8ddceab1430348eecf8014024f22bf0e7fe0a7dfb777883f68cf89979e19f0ef8c649bc2161293650431ec4ba2bb0798cadf370470475afb97fe0ad7ff0500b7f819e08bdf82de03d4d23d7f528562d4275e96913a9c8423ab15c93e95f8c525d4f72e275cc8ef026e6ce4b11b4907d32735e3e67896a3c88f7728c25af52658bcbbb98641733baabba7c8563c8c7b9a82eb5ab69b109dc8f08216478f31b2f7509d449e84d436b389ed4cb1db4d85c3b7ef32ca0918600f6e94b3cf67e735ebc7336e95b2a5b951eb8af9ae767d04362b584714f72ce8acc5f7172d160a9f6f7a9e6175a55b26658f3ba3f29f3d477a97e4bc4584590b531a492170d9f33d030f7aad2c916c4ba959da3d9b46d7da013d2ba94ff0077a976b92eaf676babc92ba58925970df363cc38e003f5ac58f4aba9a29ae2381d085532206cfb0c7be6ba1d1ad6f6d51a29d8346d8904857715e7b1fa56a0f0c7d92dd2fadeea422455fba077cd66aad2bad06a9dcf3c934a6f33f7d04c8e32711307dec4602e0f7e69965a4cb753cae11de42c0a811a82368e738fcabbfbdf0fe908c2de6768a451bcb6fc877ec0fbd519fc30b6926cb4907cab9057f8c90491f9d156b538e88d7eae96a8e765d30dc8890c8c887929d0ee1c95fa9c63f1a9edec752891634b6f2a170581f33202f4e7d306baef0ff83ef6fa1b5312af98640551979249dbfd6b5b4ed05ad3535b6d402348e0a4aa83a2eeea3e95942a684fb29f73ceae7c27a9c23ce4837344048a073e60ed8acdbcd12eeca3f3eeec1da6b96df2acb95181d31f4afa26cfc1dff09069b1a59e91b24490c7e71e7f77d9b1e9c8ac5f19785f45b6b36d22eed22b992003371687737fbbf8f4ad63520de884e9e966783ead6264b58fed2fbe75272447b87b2e075aa970a44e8b76db9259f8451b557eb5dedd5ba5c5cc905958ab44fb8c03a38e31cd72573a5b59cd2c31b332a62466639dbcd6dcd738ea41c5d910dbd8cad2c896fe699247c22a8f4a935b78edae0697673e43a0f318104138e69f7f2c6f3b416d36c5c961bb82d91dab35e079d67babb8c6026e89430dc817824fe75a4ad644a8d4beac8ace5b82c621133fcd86da98e07ad753e16b492292196ee6259fe73118f80bdab2b4ed30daa5bb413448d3fcee1de424a0e4f078e781ebcd685d6a21561b091768ba0ccaca325064631f4feb5948d545b62eabacdeea724e930626d67d9803efaf3fa55fd1a6d3b4488cafe6b3851e63f5673c723db23ff1e158b689732492da45379d21b80892b0d85860e47bd6ff0087bc38d15ca5bdc7ef250c595d17383fdd27bf19a8751ad11a2a669cfaceafe2658e1b9b693c84c08d41eb9e071eb5a91786b7c2965717ad1f9600395e1d89e066afcb269da25a5ab5cdb021936c4186368cf53ef9abfa2451591946b33aa665f35194e48006467da8e79f71ca2ac70de21d0aee195964748e146db1c6bc1f33dcf7fa572f751c6678c5dcd3233124f924337d00aecbe2278aad35601b4e5fdf3c6c24d83f8cb63a7a81cd71d6f6292ea6b793cb3853b4328e3046411fd6b684da471ce0d3ba35f49f0a9b810dd5de9b9560db49938da47073ebed53c7e0fb0b5b270558bc68fb5dce542f7e6a1b496f6e6eca5cda33f96aaabf364000751e86b760bcd627d34c17f612bd92676846f98b76fc3d6b4f6a64e326accf3cbbd1f4781c450ca4c7221c4a7a67eb542eb4fbab5453e62b00bb5c37f74ff23e9f8d765a96936f71035f6dc21751b339c30ce7fa566dee911acef756b23a2bb85dfb88c1ec001d49aa4afa92a0ae67e917bfd96b242d904c60290b9445f73eb5bb61e26b492d23b6b91b6e14810cc39493be2b9cbf96ef4f92412ce3cb04a2b4ce7716ee1b3d3b62986d5adee465d524902865497ee9e483fcc7e34c5085ae7a5cfa86a5ad787d5aca2532bb832003031b481b7ebcd73377757305dddc2f1b5bbc643cbe61c6170071ee7b566e97e2dd4b4cb026dc198f9c197e7c84561c7f2fd6ae4fac2dd79b3b85df2851310721b3d2806f41d16a33dc2f993c61b0034649c305febef53daddd85cca9781f2cec176ab7ca39e4d678db1dc0bb6282203670320f14fd302bc420b39886cb1f2e34ebf5a2c4c7567aff00ecfbf183c43f083e2168be2cf0ceaf2a358ea3e65c46ae4adc28390871d3ae47d2bfa0dfd983e38786ff00683f82fa37c52f0fea2938d46dd7ed217831cc07cc847622bf9b5f0b5f4166559d58972c56589f6b2718c83ea0f38f4afd17ff0082357edb777f0f7e23c5f077c7daa06d33c4f35bdb59492ca004bb395463d816551f5af4f01552f759e7e3e93a8b99743f5d1595d4323020f42296a388811fcaf9ec7ea38a746720f3debd5e878cf7b0ea28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a0f20d0023b0542c7b0cf35c7fc5ff0089ba17c1af86bacf8ff5d667b5d1ac5a596355c96603207eabf9d75efc467233f2f435f15ffc16e3e3b7fc2b4fd9424f879a5dd95d53c637eb6216361bd630acc5c8ebb728066a66d462d9a52a7ed2691f92dfb507c71d77e3efc5bd7be23f88f5232fda6e1bca53f2803cdd91851ea179af388585aca5638b6c81773ece5b1ee3b53eea38afde58124411b4c3332a740bc83f89abba4c71b891a1b77862240594ae44b8f5f6af94c439d4a8ddcfb0c3c54297210c763fb816af207e804918f9976e48ff00d0bff1da8e388b136f12a2ab9dacce080dfef1ec2b5a3d42de1bc78e567c2ef62608b1c63ae6a4babcb8be1e77f64877384292bf55fa0ef5c2a2ae74c5348ca9dadf4a9198ccf7322c41a5b6272369e9f5068bdb587568162b3b67b799d530cb6e762e3ad5ebab62d74f0bdbf91288cf0070557eee6b52ce4b97b45f2ef259b6cb8398c0dab83c8ad5b562e127b330ed7c37791c4d1c32b490ac7bc0965dbbb9e78ee2b5746d2659e384a5b314e55e16ce09ceefd315a1a668b7f1c0b7f2d8c5282000256da4a9e98ae8748d1658ed234991b99589577fba30471f8d70d4763b29c13d86d9783ed6f2dbce922491c48432bae5938ec3bf51f9d361f87c5e559adac65575621d560e471fe7f0cd76da1785ec2366b88ae66cc8ecced229dce30319c741915d568fa199130e3f7854e3008edd0fa64715c552adae75d3a7738cf0d781d7fb3a169a584488992cfc6f60d9503f102b5d3c17a45a4e3506b6825b869b64810f623391f8e2bb5d0740b3b7b48b758a142f992245c88c75cab7e209f6adad37c31a223cf1b462547915d7208c0c8e79ace18a763a23855267898d46e12568e3ba9a0db232a889770e02f047e04541278534cf115bc97377b62b99d59635dbb43fa9e7d2bd67c61f0f3494d4e296cf4f448e54d920233b5c1cf6ee45737acfc35b5d72ecd93a24b0d961e22a1a37523aae7deb7a78b7d453c146e7cd9e2df0c4fa5ea2c88112299982e3aae476fa75ae6fc45a26f8156e46e8ca33c6cdf7b18fbbc7a75afa8f5df851a46ad656d0e9b6855d70645b8187e17e6507bfd2b8ff0088bf07e3b3f0dff6859e9593129da8222bb7271823bfd6ba3eb57d8e5a980b9f377f63aaa5b3c1147297f9d9589f9579c7e7cfe54eb4d2ade083eded6f12acd952ead9010fff005c0aed6eed92cac5f4cbdd31e39ed0bac7346b8f3071f2fea7f2accd5346b13671adb420a1183140dcb00463afe35d14b14ddae79f53093a6f73963726323c9197f30a47fbcdb95c7201fe9515b432cd326e65f2e320972725549cf5ada9f4ab700aac698123ecdc7fd59c7438ef496d6f325ba45958c0871287877023be3deb79544e2ec11a724b56259cd0c65a155530492b060bf7883cee1f956b68fab8b376d5657212d54f9181d474e6b32d2d6da3958dbd894dca40799b6ae38e47e9424539ba8a111676a32edcee52d8cf4ae672691d108a5b97df59d535ab899ef248f31a0d83192a09cffc04e3bd5dbbd571691b25e0dd1c7886390e5f1df7377fa5655ec324b1456d004081034be5ae1e5201ce3e950bd8269ec6ee7db215400066f9c03d0114a153de22a422f45b9a1a7e9ed770bc91a20913127944e5893dc51a6c3a6595d48fa96acc21f33748a1465bfd95f7152d83c3a75b4fa8472c6a1986d24f51b7a7e7591a4dadc6abbee2e57e569bab21200ee6bba1512dce19d0a8b566c43aee9905ebc9a5e9abf668dcbf9f72f8671e87daa77f10c9abdcac96fbc46016f24731afb83ef546fd2da600218954b945544232b8eb5369b15a69a9f68321241c2a273900679a1d6a6e5a192a4fb174786efb5f8cb5bdd04858869224600ae0f53597abf853ec924b16a318c2b9df299f0a8c31b73f9d6b5bf88b5233a5de9b2a42b2950cb25b00157aee27f2ad21677fae593cd7f656b3b14692660d9ee00f97bf02b68544f4329d369dec79a5ed9c4c59ef157cc77da58c59538e841ee4e6a88b3d399e31e6b47224b9dcf1f4c75cd77baff83ace79669a5516e933ed10c6f839c0c36dfe1ac0d53c332d9406e6e2413260c78c9c8c29e47d6b5335a339cfb13da9305cc65f6c31b3a32e14f0003c7d69d05d79b1948614dac00209fba723a54f0b7d9526904d36e52b1f4e472840e7d81a7491c0aa6662a01607ce8fefafcdce69adcc67b8d795fcd0e9232059ce599fe55fc3bfff005aadda5cb97709726492406350abb3af391eb54155207713a008652c246930493d38157212000ead28756c8cbe0553d895b9a7a348429960b431bac7cfeff6e0ab73cfbfa576de15d7350d2efa3bbd0db12c48f279911d8f6ecca364aa7bb29efec6b88b1b7692065923556420820ee2ddeb534dbd8a1d46297ed32839561118b1e62e7057f9d10d25a94fe1d51fd097fc138ff6a2b3fda87f66dd37c537b72ffdada530d3b565b861e649246a144f8feec9f781ef9af7e88820e3d6bf173fe08e9fb554ff0004be3e43f0f755976e91e29296b32ca008e360e4a3824e036e703e9cf4048fda0b572eac0af420673d7815efe1e7ed295cf03154fd9d5b12d14515b1ce14514500145145001451450014514500145145001451450014514500145145001451474a006cb9f29b0a18ed3852719afc7dff0082f0f8ea4d5bf697d37c1ada86f8b4ad02ddd108dbb1dda404e47507383debf60a49230a771edd315f803ff0511f1d6a7e37fda8fc6fa96a3aa8b99e2d6ae2de290c670112570ac33d14a6401eb5c58e9b8523bf2f873d5bf63e7978254944574ab8f270228dcf273deb4acfed3259c70da1658e3041676242b7603d6aac705d07326e0d36dc043c7d3ad6f68b67b34c48eddb36fb7ce97fbdb876af9ba87d35368cab9d6787b75dd184900566182dea7e951c1abeb532bdbd95f344cd2852e5d7206339181e94ed504b3ea6de4146010b43b94f0d46976f00876dc4f1ab3f246002a42e339fad72a3ade858d36d7c85637ff6bbb9251feb99b22b637cf7113477560c163185488e196a9d85e3c56f14c970c8c728015e7f0f5fc2ade9771bef4f9568f975cfef893f374c9c76a9a80a3ceaecbda77876fe6b78e2b85924db1970fe7632188c01f4aef7c37a0470a472477aeae9232ec68c38c963c7e46b97d1d6eccc96cd29664ca0f3071d3040af41f0f4126936915c21859a2895002c3e55dc3ae7bd70549db73d2c2c158e8acad560b58a5b783318380b21c03ee40ed9adb853c86121b858e49003234638dbe9f8f4fc6b234d9ee5bcb9199766e601bb649ce31f4ad2b495e6792345d8e08019ba15ef8af3673bc99e9c295d58d8d3215820436d0a00d85f20b772a8324fe7f88abc8ef1c59961122924e4b12405e78c76e2b3ecd0cb1b6245658ca98867a1c8ce6b5b4d9bc9681e0b8cb084fdcc1e58f4fc466b8a755c1e87ab86c3439772ec9a7c378d74f0c0b212049120ce785c9aa3a76930c8a658de459090d729227cea3b7b60d6c59b4d034d22cd36d690953280012570578e78a59f4b974cbb372aa49bb406e2256c92074c7a52789958b9e1a37386f1468bae69d791ce111e3f33312a8f9914fae2a9eac973a9d9c70f932b168d8384191b4fb1f7c57a7da59e9babd9032a794245211472ebe9d2b15bc2b3c92c3a6e9f35c1d96f9788c23257775dc2b486264b7156c3c3956a7ccbf103c0b3ade2d96a71a0214c96ae22e642490cbf5181d6b9c1f0da59b47967802c0187ca42856c8238e6bea6f11780b4867845e6980b461b799588600b7bd41a7fc3bf09d9c634bd634049d24cb5ac84b7ca3d718ce6bae38b9729c55305092e667c7f7de0a4b5764fb5ac93cd2169e25e5a23db3c77fe95852787aea2d4048c64f2e29543fcbc0c919fd33f957d31e24f85da43ea3a98f0ddfb233a9fddc91ae4b0e701b3c700fe55c1eabf067c55a3c325cff66c6eb21c37ce4befce307b7ad74d2c5b39ab612934ac8f246d07538e682408cf941bf72600396f97eb80a69f2f87d6cb6dc64f993f388467693c60fa0e6bd0aebc1faecd14c06f89a2e1d31d31d7afa67ad4b61e18b69acc4136af1c6a8e99658fef12780481d3fc2ba3eb2e4ac60b0d14cf369345b9b2510c815c31d992992b93c9e2aaea9a35f34fb911408d76c8a1319ecb9fe75eb3e20f869756490ea7713c72655d9fecd9c6cce39fd2b9d8fc38433453a288c60060f92c339dc7dbb54aaf183bb6454c2a8ea8e29b49ba82c519a34416ea04a426e2fcfe9577c1f62b7da9c9673d83a8901c00fd38ce702ba9d7fc253dac4520b67733202a88d82d9e981dfe955b42b392dee0ea2b2b413a6d68e19536175c63ebf9d75c3194e5a18ba0e4ad631757f08dcd85e1bb11b9cc798adc839241e1b9e315962cef4ca332084336e94a92bb98820f5ec38fcebd875bd465f12d9c77b73638816109e645d548ef5ccea1a7c3208b4fd5ac3ce88ee649bcb2588c0c0e071f8d4bad1bdd2319e11c637b1c33785ee279364b092ac0046697e5c003ae2aed9786261725349d42eeca4484796a1f2a4e79c67f0ae9a2f0d8bcb092e74dbff2591804873b8a73819c7a9a7dd5f5edbe9d141aa58c6cb8c24ebf29932076ebe9d6b784eeaf7d4e0a9466b739ad4b55babb0dfdaf7d6ed3c52f12245b5b000c16ec7ffd758baa2df5c445ef2f848eae77e3a0054ed231d6b75ec1752596eb4db2d830cb22302f923dbad72baaa5de96eec6f5e26500ac4c831180093f9e3f4aeba7292dd9c52825230b568228c4af3caeea8c4863d0e40fc7b55783ced3a2961447dc3e4c1e4124f3f91e2aedfdc5bcf36f90996463977d981fdd23f5cfe15424b79b042cc1502ec24bf208e7240eb92715b294ae73ca0ae11dbd9c919b954566c95694370a47078f635a1044a96d248ede6009b1524230f9e73eb54a242b09177b809625728b181b1b1c9f7ec6af2476f29051d5880a1a4718c13d056d094b9b5265049685cd3efa0b32891b20e46f1263238eded5644acd2a95916656385f9f2473dbdab36d2eeced660e246226936e473918ea38e9576290dc44b0a3cad22129976000e73ed54ecd94aea2777e1dd6f53d29f4fbcb2b86b736af2932478ca3941186ce7b2c8cdff6cf1fc55fd17fecddf15749f8c9f04fc3bf10f4b73b6ff4d8ccc09ced99142cab9ef870c33df15fcdd785e77f9b49be9815942a10a010416e493d8e01fcabf6a7fe0883f13ef3c5ff00b2acbe14bbc93e1ed4d61405892ab2812739f5f98f1c715ea6026dab1e6669083b492f99f6aab0650ca78238a5a65bbb491ee64dbf3118f6cd3ebd13c60a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a3ad14d90911b11d769c50065f8c359b4d07c31a96b579722186d2ca5924949c040aa4e6bf9d3fda2bc487c73f16bc41add8dc330d5b56ba904dd7e40f205607a7248fcebf78bf6e3f104de1dfd93bc75a9d95c2a4a741ba442ec07de4651fcebf00fc54a9113e62a318b7ed01c7dd639c803dfd6bcbcc64dae53dbcae9bf67291837ca26d4a1b3671e5c650493375073e9d4d749a7eaf6771a7b801222902f1823257b7e35c8ea97e86e1e178f7488eaad267181e956ed642b69e40b58e763f75164f9bf0ec6bc2a9a6e7b94e0917eda20156fdddc92198263a8fc7ad52bacc6e1af5195b61f254a2919ed9e69e3547fb6dbd8dd5d82909f90edc63fd9e6b1a6bcba9f5162f26595c95423b54c6292349cddcb76177a91b9494caaa59f11a444b63dc8edf85755a0430da5b39370598b0c3193e63cf6079ae62c2471731db59795e622e5e763807db35b9a5cb629711b3bef9a43b5a45208231d39e6b9666b4a4e5a1de68a2efcab69a38d0990b96c91bbad76fa2c6968fe67951636664130dc3078cfeb5c578666b0b509379bbc491846182426de87f1aedb4fbc892ed834d09411aabab29e738f6e78e7f0af23172773d9c2415ae741a6cc6d64214ed44253e751824632463a751f9d6eb46f24225b6424363cb551c8f5e6b134585e446251bcc32676ac6703bb75e3a62ba382091e449a00bb060866620019e72074e2bc8a9267ad496a89f44b7bb1e4ddf949144ec4168c82081d723dab6b4ab267dab1223b4654466051f3101bafe23f4acc8a0b285824688b17964061263e6638279f41cfe15bf6768a824995a318655c28650e033306e067b8ae49d4d4f5211489566b878d5a5b569242e0b3018c738ce3dab634db4bab8caee91e590102609f731d0e0f6aa5a1dbb4c805dcd86d84000e1719c9e4fb56cc16d2aa8812001571b647908dcbdf81cd473b7b1aefa2174db0fb164c25484850aab28520eef98e7de9f79a6996f4dce9b19c86cba6fdb851c839efcf615a965a7fda81f957cb08ce54293b32305727ae3ad4cde1f58aeb7dd09591621e40070307d6a57b4bee4fb3be8645c9b2f128fb15e696cb2ba1453b47cdec09e87dcd65699e1786cd562b2d42485f0ef69bbe61b948055cb7d4f4e2bac5d00c16b39b120cc5094776f9633ef9fc6a2b3d1a1591e09e62e65405a60328a7f8b67a7e35d1072eac874fec9c35c781347975533db5bada33ab098884302c47cc7f1ebf8566789fc08618dafef9a56579313322fcae42821801d30cacbf8d7a14be1fd5121925d1b50f39149510cd1e1c920f23dbfc6af4905c43a6bfdb191887205b98f0c090e7773db1fceb5f6ae3b13f57a71d4f04d7b45f0f5e4ebaf5ee985e4d8a5d234c10bb4e723bf38ac8bbf0c784752d4a66d13ca8926b452bf68455da7a1f97a6467eb5ef53782f491126a97714877101982280b80c0839ebcd4ba6fc39f07ca7982da362a73be204b1f4cf415a4312f6627428495cf9f6ded2d63892c23b433dbbe125731615b673c1f7c571be2af852b6fa9c6d2c7b236477de991f79b217df1ed5f5443f0ebc31a8224efa7f996e0b2b409e838dc31ef595ae7c06b24b98eeacb599162741e4db8c36dc9c007774ae84f9d6a3a9428c9247cc463d3a4d3db498f4f8d2facdfef349f310bc900fd3d2a84ba0686506af35bba5b9762e550b3a16e17923383e9dabdc3c63f0161b2b87bab02d05f2ab3433f9ea9e71c7208fa7d2b899743b9f0cebafa6df68e16477591dfc8cef3b791d4971f41c5546728cac714f0f6f84f378f47bbd220916eed2496d5d098e7b67063393d0fa1f5aa71f84b56bab4125bddc33201fb946424afa80c0e3d3d6bd220b016d31b8f0c5f450a127cdd3af80f27793c923af3e959fade8262b196e13435b3b95f9cc96171984fae17391f957646a2e5386b509d99e7d1e91a8e8f76a96f6ca262780d721867a8e074e71599e34d2f5790b5da27cd1b658c40b0007b75e9e95dd1d12eb524df76de530255b3b7706001e36924f5ae4b5c32d8debd95b79b211c6e75c9e7af048c0f5f5ae8a7551e6ce96ba9e7c92eb42f65b986f1a189d397438c93e82ab378697580f34acaec91b131b3e5dbe561939e0f2474f5aeb87c38bfd558ddbdddba1c9f323b74d802f6ea7a9ab9a168ba7f876693fd19cbb425616970db4e4640faf1f957742a69738ebe1a3cae4b73cef50d3add6e5ede4b2cc8d20d855301803cfe55877b6b666f6454585434aea001ce0f7fc2bd03e20a0bbb62d692299a372550e06338e3238e715c0ea5711002e0a244d8e767393df39aeca551bd51e55485994034d0445048fca909279b81d7a6003ebfa532e03b9682e038d91e5f74b9c9ec474ab5f6a8f95173f248a153283058f3d7b5559ad6291b2d2c7b3187724b1e2ba53933027b58d50c50f9e9161c889babe31d47b569595a7ee236f2de4576277777e71bab321b79554441d9731e3cc2a31d7a7a8c8ad9d3a38e26f363b7963dc98d913e4a9f5a1bb2035744fb3f9f2437122ac4db7cdd80e4019c0fae4d7eb47fc1bf17fa94fa0f8f6d6eee848a174d7541d036c997f03802bf2474eb759275866886f5c796f9233cff101d6bf5dbfe0dfab2d2e2f879f10f585bd89ae66d56ce096388925512066dd8ebd5f1f857a99749bba3931d197d59b3f46a1394c81dcff003a753636dcbc8e8718a7020f4af54f9f6145145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a490ed8d9bd01a5a4619520fa500b73c0bfe0a4fa7c97ffb17f8d16de30cf1d8efeb8242b65867b700d7e05789b7dddc4aecfb62787e51183b8723bfe22bfa2afdacfc329e2cfd9a7c73a11b7f34bf85f5078e3fef32c0ec07e95fceef8aa0b9d3e758238b0719589f82b96002b67a1f91b83cf1ee2bccccb4a5ce7bb9554fddc91812da4124cfe41777126e25b9edc73d3ad5c84bdae9d0a48ce5955909c004839e73db183cd472aaadac6f144c8b90a54a9f9cb0ce73f4a82e0ac36caaa15e408413b8e5870318ff00808e7fdaaf065efeacf6212762bbdec76c4c70ab8467c32310483eb93d2aa4335ecf2b0788ef452b2bf43b738c01dff0a8ee64177b639a12599ff7fb4fde3d8fe151dbea1abbc9e5012f9650ec5400827764027a818a8b3149c9bd8d65b85450966800206632c3767f1aecbc376c8d6e2d62114b2f9c0aca40c11dc71c8ae33428e0fb462692e4860581551d7f1e45767e1dbeb9863b7b47911500dc5845824e7a122b967aec75e113e667a1699a3cb6d005b616684c4582ab659b1d715d1785e182e2592eaf6ea36428be5a63947031d2b95d0ee51a330ade3c611986e5da49191c7ad767a54704501581c92a8ad24bb07cca481fd6bc4c5d469d99f458282e53a7b4be8a6b86f2e6662252494380e38fc7b1fcaba3b0b88fed28ef2c31a4a405445238f539ae7ac638ad2410966280ef0c00c90456b5a4e25903a246d1a1c8dc79da39fe95e44ea5dd8f5a9c2c745645ae0476f73e5caad3e4663e0203c9e2b52de3b84b7254e004f9c39e8dbf8c7e1583a79768236b67505909019f8fbd9e9d6b5e2d4275b5563e4a302773a1c9e39e95c934d1d71f84d7b4bb8278d04b86c0395504f41ed5afa4a5d4b64e54b9321c8329c1551e99ae734ad697c8437970b0234846eda3e6cf4191d326ba2b6bf53be68e622362aa8cb8654e791c7ae71f854b9246d493e646b69576440236b8555452ac8f20f9b3df8ad017b6d75602f5d19d7188f2cdb72bdf1d78ac6b6ba8ad164ba9dc12982bb101c8f5a7aea45a475df0e53b9046d27dba566ea36b434e56e6cba75158678c6d8dbcc19288f92c7b67d07d6ac3cd1c93e0486238f98443280fa7ff005ea95b44d712b2bdcc4be695c46f80b21f6239ab115b8b66f2a1bb776dd96800caa0f73dea539dc6e115b9a37715d967b497538664741e4baa152bea323bd52b0beb9d267782fa5fb5a86c89a4c1dab8236faf522a57b965915ee082c49091c03ae3ae41a827b769c34f670c89216c0491432faf2075e9d2ba54e51892e09ad0bb736f64f35c992d1562964c864958100b13823071d475aab258a4249b2cb012868977190641e73c74a7fda2e0c061d4d59598ab45246848da08cefc77f4f6a649711d95fc5e6ef61862b2c2db41cf4041a9729357ea4461caeed092ebd73a65d9b83b6396404f96b17c8aa4e074ef9aca775bc97cf699a39239d4ca3ce539c1cfca01ad7b8372b10905cc610820b6d0c40f43595736f1cf6e3cb833c6d69140f9c75e08e869c2b554b5668e506b6159f4cd56cc5aea1a7b3aefcc8938c3b8192067a807d6b99f19782345be8b619d638963631dbccc0aedea4eefbf919c6056fbda432289a6b3959997cb124a01c7b7278fad54b86b58c2c51db01f37d9e566b7ce09e7a8cf1c75e95a2c454bddb399d26e5747996b5f02afae5a5f22c54c8c552257521477e1875e3d6b2351f83facd9b47388d7cada0302c406ce477f715ebafa94ac259cc99cab15dd2f439c2e07d2b2752be696665f3c4d6b840a33c86ea0e0f4c1cfd6ba16265ca64e0b9b53c7eefe09ebd140d2b4d6e3cee6688b123773c6474e31d2b2e6f8451985d6f2644f2e1670b6c996eddcf35eb77da8a79324ad384065560afc6e3c82dcf4ed542fa3b7b8066b303cd48d0800e777cdc8fd6b7a7889f630a9428bd6c788ebff000cb51b48636f0c891e4931e62caa39f76fa67f5ae1b5cd1bc4f60af06b1097f2a5c19163f95b3d08c7208c7d39e6be8dd6e3b5b996577496d6699c91221c0503823f31fe735caea7a517b77b7406421c124c8bc8e72793cfd2bd6a18972858f3b114a9462f43e66f1258eac82691aeccb146c007b85025e41e081c1f6c7e35c55ed9ccbb639a00779751bd76f5fad7d1de28d22c544dfb98e73bb0a8428ebdc9ed8af34f16f84ac9a2596de5f9a4c3fddc939191c1f6af5f0726a1a9f3b8950e6d8f2f7b49561934eb59d1405556217386f5cd594d3255ba4b795d0e507998038fcaad5dc69a6b308ef099640c3608fdff009fb565ea37134175e6c7349f2a02ccd1f18fc2bd28c9b4794e2926cd2b78957709a3326490885864fd07a568585b091123860cbc8b8dc09f939231c56341a95e891560b9523ef7c8a0be0fa7b574be1f8f4c9b4f90ea85a3ba8b69876be18f39ebd2a67aab0a09396a4fa4dbb5bcab04d187584e59a23b9c9ce307d2bf53bfe0dfc925823f88b0c36e822b96b2772a7e6465593afd47f2afcb12c2eb542be747cb2838256419638191c1afd56ff8379ad84ba1fc4cbe5769116ff4c11b3ae08529721811f5515e8e5319294db66798cd2c2356b1fa57047e5ab2673f3939fa9cff005a7274fc69b6ec5a1563d4a827eb814e5040e6bda3e5ba0b45145020a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a46e87e94b41e41a00aba8595aea563369f7d6c93433c4d1cd14832ae8c082a7d88247e35f81bff0513fd9ff0052f811fb446bde10bbb68e3b696f5efa29a1e8d1cb2398e4f6f95b691d462bf7e4a1c735f9d7ff0005c9fd996ebc59e15b2fda0742d36569eced52cf543146495853cd915c8ee72f8c7b0ae5c552f6b87940efcbaaaa557de67e4d5c833dbb0b76691217dbf29cf19c03ff007ce6b135c82e2cec898af421639f30c6589ff678e9f5ad8681ed750f2a4cf9c371f29f8618e7240e82a8f8a636486268dd424f857663f7771c640ef5f3b529f23b23e9be17a18534b6e9701da57560a0607215bfbc40eb4ed29c4b2322ca22c1c896324e57be476fc6a1badf245717a93a0e029098dc47ae3b54ccd24f3b9925666f350ac50019cfa103a8ac9ec5268dfd14f9b1fda6e20708f091bd79c8cf5f6aedfc3c34cfb9341312a15904632c5739ae2f4284bcd1c1f696528311287c2927b1af41f0d45766649edcc99654452ca072073fa57055fdd9e860e2f7e8753a0adbabcb7b66ee91cabe704950070c4f03079f5aea74e4922b2323c64b332c9e6b03c7cc063d3a560e8300676b032a4f222a6d93b9c6e2456ed83b078a5ba3218d814553c0efc62bc0c47bd36d9f418487ba74ba65d3cef23acff28e777947ee63afd3b56ed9c51fd9e4859548936a90bff2cf3cf5f7e9f8d6158b416f88a1ba6da9102c578629919419f4ebf856de951c467491a1d9136e12990fcf9c12a40fa578ed35367ab1d15cd6b37bd822f2d21554886d0ea32ded5a96858b8791db7c89c86030a71cd53d1ed125b411cb7caaa92890b336d2fcfca3f3c5696972408ce27951966766d9fc401e08a2ab4d23a6945b2d687249242d05bb8e49dade4e4f1d700f5fad6e59422260c5b6e109524fdef518ec6b32c22093662456cc44c601cf96a3d71dcf4ad382516b0c7712894481bcd100c6d257d7d2b09c53676d3a775a1696e3ed36b25bade860e30aa00ca8c64fe956e38edcceb6d2a23ab7ccdb3962b8039ff0a669f6f24b0892cc930b46151e2504a920e49f4e6b5344f0eb4b746e0189808f6b4cc0f39f7ed52a1a94e362bfd83518edc0301db0cac88813391e99ee3e9cd5b49249dde07d49c32c27c96cecf2f8e8a47dee71d79a7be9ad34a36ced1ec1891cc9b4093be33f7b8f4a22d22f66db2dbc4af0be508c862a3b9fc78abe45d052845abb1f34b343218d99c3c6d2189d896de0b9dadd3d3153da5eca225b8456f319032aec3c92010df91e9ef4c7d32e6dd6037714cb1038591b903f1edf4a8c585c4457324bbed95031ff0080631fd7f0a1426b51462946e3a5bd7911b7dc08a3639dcc7258fa62abc888aed2dc4e70abf2a28ceefa55e4b78b7c70152428223263c673c9c93d2a39edbecb6c7ed57a64f2b98494eab9e945d12accaa61864244c5e0047f0b03f9ff008551bad34c73a883549a5520b045017b7a75cfb55e974d8ae4bceb9dfb83fcd2003db8ed51dbd95fb4d20f24a48c438c1ca861dbfdd3ea287aa1f244a70ca2212db4eb18438deaeadbbd79f4aa17ccaf24d1da4b14892c7862b91b0f55faf231f8d6e3e94a03c2d388c11f347172a4939279e7af1598747b2677b670e57616dde586c60e78f7c8a7c9ee09c2273f379b14a2d62b588ee20a31c83971920e7d0f15857d710cbe630b37dc1c1c13e5838273c9eb8aeceeed6d8d979a8a1259419a493ca002b6738e3a639ae67526b5174d72cde647bb30971c11819e3bf3dab58268e79c2ccc2bbbd7760de50947920850e46793c71e99154afb54b9788c72f94091958848492395386e831927f015775748ed6f1aea68886dc12108db40048278fa0ac9d8b7509b98951a33e66d42707ef7506ba63251471cd3b8979b2e600891a6e099581dbe7e001dfd803f89ae6f54b890dbfd9dd7c9632a3c610027e561b81fc09ad2befb540497bd421d07cacaa48f739e4e3dbd6b9dd5ee0ac230ce61dc4e3685e7b918e467dfd2ba30d3b3bb3cdc65b9d5ce67c496664f9218d7697692e1d88dc0e5b03039e98ae0bc69a75c58b417f1ce72aa30ab8194c9c75ebc015e89a9243a8ab5c309139da442c0fcb8392defff00d7ae4bc47a45ba43c4e1e3455512321055b19c1cfb115f4785a9eedcf9ec5536ef63c8fc41696e6492e42caaecd9edf2b7f7b1d6b96bd8a18d5da385c2bae1c0c9c7a9aee3c576cb1cf25c01b4b75c1c86e7008ae2b542bf3e2552e63c80012793d80eb5eb5295cf22a26995ec6696175431c6230bb378383b7d49edf4adab779e148d2e83aa04deac8431600fb75ed58d66a639c9b84898b00154c67a7ae2b52d4ddc322dbc118740bcb0e021c82073d32734e57bdcce37bdd1beb27977a93c79122ca18231037b6d1804f600f35fb21ff040ef06cfa6fecd3e22f19c9132cbac6bc21f31940f38450a9dfec034acbef8afc6cd1ed5ef2e609c11707cf91a50add390768f5f41ea78afde9ff824078526f0cfec39e1a966ce6fe7b9b9542b8da0bedc7fe395eee5905eca72397359f361bee3e9d8d42a041db8a75228c0c52d779f361451450014514500145145001451450014514500145145001451450014514500145145000402306b93f8adf0cb4df8b7f0ef58f86fe26803d96ad64f04ac5b38272c1f1fecb63f0aeb291f250e0e0e38346e34ecee7f37ff00b407c1fd5fe0cfc61f12782b57b49adee74bd51a3f224ff5887cd203367f808e40ee0fbd79cf894cf2db2b428a2e362a940376fc1ec3d6bf463fe0ba3f000f857e33e93f1a6c2126dfc4b607ed1003826e63f2e13b9bbfc8cae07b3ff76bf3bfc476edf2c8916d09205299c924f607fad7cfe3a9b85467d5e1f1919d28cbc8e5da05b4f30184c92aff00ac64183f4c559d2ece237019ae5c49b8059075643d41f4351b44d6a765d460af9997578c8607b73dc7bd743e10d3637b948ad4ec5f3324200738e48e6bcfa89f2237a717236fc1de14b516c6e1ec1bcbdff2867c92ddbe95e8fa1e9f0c61649acfe58e3da519be50d903b75acbf0e5adb989d6d219626931bbcc0b8c023db835d242db5dade3937279843b20c839c74f535e562a7efd99efe1e1cb4d2468476b1acc1619102c6d83e68e7247f0e3b7b9ab1a7c51c2562949902b16dc415c7d09aa7a8defd9a3f3645491f788846abd57d4fa5598ae17c9170ef0a94c14ce718e991ea39af1f109c99ece1df2c6c8e82da5985b4b0c6cd3178f3b72372af4e3dfdab72c668fcb8a57f3b7a050cd2ae0edc63a7d6b97d39ed5f2b3ee66079910e18b63ae3fb9efeb5d269578b122e006db10064da4939e067d3eb5c15299e8ad69e874b64d33c0a5ac5b0183658e0ed07afd7dab5f44b5b996fe3b4662c4ed65660307e7079ff0ac8d3ec6680a4cd6ca3cc0a5e42fb81e72086f4ce3b56fe84b7f1ce4348802c858232ee39c7f2ae29424dec76e1dae4b1bb6de5acc0dfc28b302633222e149cf1c0ea6b6059452ec8a65427f86644396f6ff001acdb59e38e55cbb990e5b681c29f5c1f4eb5a565ab4324c27903a04079988033ea077cf4a6a99b46a4a1a235ed34f82ce02598ab1e36c32041838f5ebdeafdb2bc0761811820f9421fbc0fae2b2a7d6e1b3b9b6691a3437019537e30981939c8c01ef5b693db5cc6b716bf3178fab3aae08fa55722657b54d5d93ad95ac56e24323bc8f233ec0a3e45f4e7bd4d69a5191219565f24162092814907dc5258eab6a6e27cda479830a59a4eadfe3e9eb5a5a64cb776eb652a891a2c95cafdd524673e87d29f219ba8ad66568f497b0b74d48cf32c4636685d9f721e71c8fcf8aa93d95b456f1fd9965605b70910e1b69ebb89ebce3e95d04d61716421b0d3f51611c70a8943c795ea49c7e7d6ac5b6936b35af9f0b34a87967ddc1208c823b0f7f6abf66953647b47b23955d25cb7dae458d816d837498ee3a9e9521d2e588c8bb44db1fe48c0e081d467d3deb5ce8f3dbaccf0c84c45cc8d1aae72370f947f9ed52ded8b308e76770c6166f2fb05dc0f3e9c573b82d8a4d5ce6af4dc4f33a45a7c623e198c841e3fba00a91f48947977d7042c8790910c9d98e011db9e6ba1bfd322178b241621e168c3a94f9c74faf073cd52b9b996c835b3dc86f2002649938763f4e981c5691a2da34bdb531c5bbbde8521558b65635006ec7519f5f6acabdb6299fb2c8ceac18b0c7313039c7d4d6e49a8a4b6f2446d15d5581791136f53d413e9597aedfb2032c6ca70c17ce51b4498e7f3f5ad952b2b58c5cda95cc7b9b38ee02c31b18fce8b7b6d20807be7fc2b94d56dde4b996c0a799b90847c0dbed81ebeb5d16a17b0cb76e924691ac98696d83e73ee0f6acebcb17b9bccb4f0bcb8fdd9b7c8daa7a03c75e0d5d4872d9994ea5ce3f5ad35dcbcd35a0493cc043c2a73b40c1ce6b16d6ce18c0572d846c2c67dc9c91fa575fa8d934f10591db7302700e5b19c723b74ae735dd2ee206f26c848ad825a4420fd31ebdeb48d25289cd26e4ec739aba98a6924f2518484a47df9fe95c96b66d2462236dc86352c037dc273c63f0ae9b5f2d2a4d6e8b36e8d54c05b0312671cfb1cf5ae335eb8b781a421032e431d9f78e403d3f1ad69c2cf94f331c9dcacbe45b931b48e8854912a1c007b03ef589ac2df0922d9232491386f30919236af073c7635a6f0a19c05778959416de32acbfe354354fb32c2893dd2ac7bff771b364b6781cfd4d7ad45b8c2c78b51dd3b1e67f107c372ceb71a89930b74cae6132952483d463815e677f672c8eb1cb1a844c04fde60e46720b1af6ff0010d96e1b96d8aec1875720e082471f9579778c34b9b4d94c72c7feb092aa578ce7d7b715ecd093703ceaf04a0d9cac50da42f1c62691d7cfc119e769ff006beb5b9631cf03ac0e1d50e0232a64b618f04ff5aa2ac670c56cd5d212a595703383ce3d6b72d2c6e2429e4db380fbd914b678001cfd39c7d722bb52bc6c71d2bab9d27c1ff09eade2bf1e695e1eb1b5966ba9f5655b2b551b9dd87ef3200ea176838ff68d7f47df02fc1163f0e3e11f87fc15616f1c62c34b86399625c299760321c76cbee3f8d7e40ffc1183f6646f8aff00b43c7e39d5e0c59f8562377389e2de92b38d81011f7587249f422bf69edd7626c081403c01d3a57bf8483a74ac7899a54b38c10fa28a2ba4f2028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291f3b4e003c7434b48f9d8703b76a00f82bfe0bb9e0fd5357f81be1af195bee7b7d3b52922b84e06df313707fa9d9b3e8e4f6afc83f1e816f7cc6289e28718dae304b81fcbdebf797fe0a9be021f113f623f1ad9244ad259597db21257254c449383d8ed071ef5f839e3574d4246663c27cd0b93d723a7d463915e3e65a3d4f7f2d8aab41db5b1cb4ade492aaacf208c348243f31cf4c7b5755e0cd3a49ae373c72152ad23c6240372fa03eb5c8db3cab1347100a4952229393f29e4e7fa5765e0392e2e665899a3543110aca0e54fbfa578b5252e43d9c3269599e8ba4c320844d6f3ee6422468d0644647afa8ad6b2954c728b98484120e146307d6b3740b60f6693967775e46c5c74f5f5ad548ae06f65dc093b860038fc335e2d6939d6d4f7e87f090ebe480e6da0944247cef303b97e99fd3f1a5fb4f96a7cd980675c60265557fba3d7355ed1ee82abb4ca27393846c6d5c1f6eb54dae62890cb36a3e56dc1449c172d9edc74ac674f53aa1552d11d658451dc5c4600091a45fbb3e67283d09ef5d8683751945952fe0f29502480ae549feeb1ec6bc5f52f106bf717a61d174d9023c3b3ce64d8548e738fc286d6bc49a3c2834a96f125f23f7db8e5431fe323d6b19c1376b1d50c4d48bb23e8db4bed0eda6fb32dda3ed01f7799b7cb19fba077ad6d57c7ba0684c5aeb50895e6da9b9db8403904fe55f318baf1a4a892ea77059a48c2c33c8e5918b703728c74cd51d4acfc4f133c5ae886ee3f3407f2a6753d30383efd2b3586a772e598d7a6fa1f4a7887e37d8d9583c9613acf22c2648caca08939e847d6b8687f6bfbcbfbb9ac3fb1a382e31b0868fee30e7039ee3bd78f47e1d8e258eeb4b69dc430fcf13cec190e73d31c8ad4d5efad2fca5f2e9f135c2b1597cbb72aff0077a961fe4d74c70b4b97639562f115a6da763d9343fda122f1f5bddf84352f3ec2ea7406cdee0e109e8067b124575be12f8bd737da5ad8ef792ea10d1ddc5d3cb75c73ee30383debe67b6d7c2ec9f4d8e40bb982b3124f4e3248f94e7eb5e87e15ba4b3f165b1bcbd649ae6d7744cb2128481d09c739ae3ad469c7448eba55eb41da5a9f41691f17a4baf0cadf978a37baba31cb12f264033d7d0f1d6bb5d1fe20622b7818e1658d5c5b427f78a873c93dcfb57cdfa4f8a4dce9128bb88f9df6fdb1ec50a531c9503e95d6fc2cd4358bef184baacf24cdfbd60a25930163087681ef9c570ba74e2be23d384b9e3767d61e146dca5aeda7ef18ce303ea7f0ad0b7d2e4b3937c4a9265583a05da5864718fc3f4ae53c017daa6a9a52eafa9c2628e4895557cc1873b98e7ebd3f5adb8b5dd4ccaf796be5abb1da5f21c263f9700f34ee940d629a44ceb09d46230a84f9b22173b4a9e98fd6a3d4aca586ff00ecef781631215889fbdb4a92777b536e2fe296396e5de46942ab16e30f9f41daa9cda925c5db5c2dc8d91ba89231f3373c715cdcf173d1171579588249af229ae03c5148c462130a1190993cfe2b5cc6b5e3eb4b1905b5ccd0a0519936afcc0b739c7700f15a1e229cddb1860d525b791d311e23c60820b7e7823e86bc8be2bea57a75d5d576a2afd988b9842e38dd818f5e39aea835633a951c25613e277c6e8f47ba5bb87512a10e0ca630637e3a0c1af36d63f6b7974d125ece6492db7b6f8d8805c81c6d5edf5cd71de3abed335fbe713dc33db5b4dfea526c0c75c9fc49af2cf17ebb65757772b67a7bbc10860a5530ad9181f36738fc2bd0a34e3269b3c3c655ad77cacefef7f6ccf10ea5a94f3a68e9be02de4db4719de011d49eff004adbd03f6d78b4fb5fb278c74ebb4696df7a471f04303c671d3ad78d787eeaeae2dbc8d3f47d9e600659245cbf4e99adbb3d0adae65884fa5b5e329c644670be9b88ed5d15a951959238156c527ab3dab43fda47c3da831beb0d2e79ada707e5453bd038c1cfae31f85743a6f8ebc1de204fb3d8ea51f9ea9858da5dcdf9715f317fc217e35f0e6a1712e8f25ec68ce495b691bcb50dd8123e6fd315a3a4693f11e68d659bc277722a02b1dcc2e53af424f7359ba74e9d3ba368622ba95d9f416ada3a922eae2d042a837c8cc392bb97a806b84f10dbac93ac96f0c6caca02158caeee307ea72a6b06d3c59f15bc302dcdd587da2dd00470effbc1c838ddf853f54f8aa753b0633e9b770ce8c418e51cae09391fdeebed554d41fa955aaca4bde28c76f242eea8771126087997039c6393c63359f797371753ba0b7cc48a0811e19436eee7b1e0d65ea1e21ba76fb41b586dc7ccceaea37be7a373df3d6ae437c6f2d9a385109203062e3038e8703eb5d518ae5d0f29697454d5eda4be0c64b1468bca6732a1e41dc4e186783cd79b7c4145ba56fb315decbb423264e7ff00d55e977da7acda6b4f228f33692c63ce01cf7f5af3bf892ea6d911995479ea711b043903a7279af4f0f28f2d8e3c5690b1c76996f0c3ba47810ac446d50a43339ecc3d2bbbd1b4a326b96765e41788a2b08a07e03161f21fe75c9c30c97721dffbb291ee0ace0e79f507ad7b7fec3bf0fadfe227ed3be00f045edacf7516b3e28806ad1c6c4fee100908c7a7eec8cffb55eb61a0ea4924795524e106d6e7ecdffc137bf6548bf65dfd9cec341d42d123d6f5690df6a8c5009137e0ac44fb0c7e75f42c2240a7ccea58e07a0a86c618ede111c200404630739e2ac29c8cd7d0c55958f94a939549b72168a28a648514514005145140051451400514514005145140051451400514514005145140051451400507a1cd148df74fd28038af8f1f0fdfe28fc1af13fc3d497636ada2dcdba11eae840afe767e2a68175a26bfa8e91756e2092d6f4af902201e3625908c761dcd7f455f127e38fc22f84d62ba97c46f88fa3e8b1c81047fda37c9131dedb54ed620ed278ce315f895ff000542f147ecff00e36fda6353f1c7c0cf17d85de99ae69b6b35dc7670b4660bb190ea51c2b267d48c1cf19af2f31f6735cb7d4f6b2573a7cc9ad0f95253702e18a212d90376ce83bd753e096b80a912326fdac0e319e3d475ac0b8f35a6583ca75dff0073b123dfd2b57c1f0dc0b88ee64b78e3916460cc573907dfd6bc196e7d1d34d4db3d67c372f976ac20988c90a11d060f157d48690c825500f046dc1a83c3198a08d258006c61948f9b38ea3daae5c5aa4e8c03381d43e3038e7ad7875bf8d747b7415a92b9ceebdad4964a6d5e075254c6220983213ef9e07f8551b0875ad5650b359b88d42e022eec76e4e462ae6a7a64dadde9b9d45485621a14965c1651dc6dcd769e1eb1d2ecb2b6b6c5430080202db88c1e871c5449c9bba37a34df332af86bc2220baf365d3adaf630b9322c8c1fa74ebd6bb8d0bc19a2b905b487b690b614dc0043820f1d6abe991da970534f8237dc15954903ebebfa57536fac5b2c3e5dcdbb6c99b7c6664ced0bf2e38ef9ac6a4d9e853a575a958fc27d22db7ea50d8889db683030c8041077276fcf15337c14f0f6b067b9699c30e0eddbb99b19e99adab6d4ad6d8a24fa83c0b22ffab5dcdcfb8c1c56cda6ad15c8f3e1494462e572c5301874f406b1751a3a2346938fbc8f32d63f661badae86f2e1b6b6d8da27c320233ff0204707d2b1f57f805776b728c2f24576e5a1392aea071c8c735eeb2788e349e182ea44c38d85831c673d78f6aa1ae6afa0ddc0c8f3a298a51b55890c307af00f14bda556ec2951a515a23e71d6be065cd9dd28834b93f7849748379e0f56c7b75adad3bc2fab69fe1fb7d3e32d711dab7990c8f130900ee338af53d4af34cb59d2586f6e3cb0d90cc37020fde1c738ace12e910877d3ac848aea06e123295e79183dab29464f764c68f3189a4e8d2df5dcc618088ee4a5c2bf757750a40fa62bbff08784adf4c4934a82fcc26065518258cc5c751df8ac81796f049e459c0805bc85edd10ed2c3031963dbaf15d3691a9c4f2453db98ddc2ef755e0a918f97777ebd05734e116eeceb85271ea7a4f82b57d53c39690e9f753308a302357c820f3c9efeb5d1dbf8ce292e5e2376123f31a374217e6207dee2b89d0e65bb8921595628c976da4124671d5beb4abe1c82fae2e2749a5501d02c89cf63bb23f2ae4a951a7647a2a3171563b2d57c4960ca52d4aafc8a9ba37cf4cf3518d66d61547493cb67405a40463208e4fbe335cea6850b40aead298a2605d9c63247f4a8f5486160ed2965573fbc28370e8471923b5654a5253d49f761511afac78821b6b4fb59bef348dce0646e39fe42bc93e2fddb6a56d3259b3ec6c2a06e7692482c3daba4d57575b6816e55449e52e102a8c3e5b9fe66b96f135fc70caa9b108471e589086cf009e87a75af4a128cb4397129dee79aafc356bcb196695c431a3b46ac918c4b918c9ef8fc2a959fc13d0d0a1ba8232b1aedc64e038e79e3935d8dcea0bf6913ca406c15df6edf294ce79154e7f12a4f0797608a103ed00ca41c0e9b7232c33dfafb56f17cba26707b28cdea41a6fc2df0e81e547662592520bcaa98d8738c62b72dbe15e916aa91430842eadc21da320e327f1a6e85abfd9b1225eaab121a52ce0f39e983cfe95bba7ebb298c36a17313c787f9946792c481dab44a6f66691a786b585d3be1c69d0d92581bb98a95df32aaa924f6c64f4a9b50d034d48869574844519da163008071c64f1557fe12cd3e43e4a46ab725590b23636e31d726b32f35d92479556f5b66ff003379e738edc668e59a257b04f6b95b53f0e785c6e8f50d2564900628327b63f5e7f9d715e20f02692ab2cb68be607c95495c00c7ea7902badbed521b98d350333ac818f973af404f1b48f53ce3e958d78f67696ee9757321092011c85f9c73c1183ce4d74d38b4eef638b1318ceaab6c791f8b7e1e6a37d1ff006879b142924814c21c395c03d307a573fa40874f79adee1d46c8f2acb9cb1edc57aa789639e391c16df206de3744a00520fe67f0af3eb8b1bc6bbdb14624018070b16081fd6bbe0e095ee78d5616aba172e925bc0915ab3e64b7e46d0327afaf35e6ff0014208ad2e922ba26605801fbb5c2923d6bd4c4ce62d8104a50e234d9fece393dabcbfe2d47144e96f34c1442c0461579c9e48f7e6ba70e99c58a57691c95935a5c38d39edb7346d965ce37e7a1ce2befcff82117836cfc41fb52dd6b775144dfd87e1c92f2dd36ee68a469443c9ff749c63d0d7c17a39925b6f2ae32cce7722ba85381ef5fa07ff0425f1efc1cf86df14f5b8bc7be38b3d3b59d6ed23834282fae5638d9d19d9f0e4e376d6380d8076f0735f4596c929599e2e3972d06d1fafb668b1dbac2170cb85607d854e98c715574ed46d752856ead2e1658dc068e48ce55948ca907be4107f1ab4a081835ee1f2bab77168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a283c0cd0004e066a1bc9a34b591a41f2f967767a018ef52313e59651ce0e2b93f8d1e2297c2ff0bf5ed7611b9a2b29022838c920a81f99a993e58b7d8d28c1d4ab18aead23f2fbf6cef17df7c59f8b1ab78a3c4ba7cf71125dc905ba348ac23886151177060141208f7af987e327c2ab786c5b53b1b546058b47e510df313c0dc46e6007a938ec2beb8f13f85a1d7adaf268a05669a590a8de0abc8a5738f6c83d6bc57c51690e8b712784f5b8e256803490ef5dcae0fb8afcff00198d9d6c536a47ed94f2ba386ca231695fb9f1e6b105e5b4ade6cade5b37ee99b1918ea3835b5e0d4912f5526418e19189c8ff0001f8d5bf89fe1dbdf0df88e5b341b524065b41e50211589e4e7e87a545f0fac6e6e75a6b9b9b8da2320491a8fbc3fdd3c11ec2b682938f3367c9ce3c959c7a1eb5a19710bc6d29f31f00c8c0640f6c56bdbdb878bc99e53892263b4264000ff3aa3e1eb4bf96cd679a16906423b4716d18f5e6b76dac009fe5c4ca81b698db8c1e9f9d7918994a355f63dec252e7a4503a2f9d247349a7c50ac9190b2c60e40f4e4702adcd6eba56a42c3c93997f796ee6523ae060e071d0d6b436502462e64490ab2f96ecaf9446eb819efc537598edfecd1ce90476ef1b28333b6729d73fd3ea6a6136d1d328f23d0a916a36f66d3a33216dac448a4920f4e09f723f0cd65eadf112df469d606bd6336c1e531724818e460573be29f145959c72c70dfe4895f6a67961d78c579bea9afdceb57cd16816d2348e981e53b1391cf7ad234e33dce5af8b70564cf5b3f17bc47220fb3c66311b8dfe6c9f330240cd5eb5f8c42d2d92eb50f175adae7ee832124060460f3d7f0ae2fe15fc1cf89bf117c4674ebabefb147043893ce53e61e179f7fbdfa1ae1ff6bef8256bf06750b4d174cd42e6fa468c35d4c4e3e70a4ed5f7cf1f81aeea181a5596879b5b31aba4533d40fed1fe17b6f12ff648f8891436aff2c970a7704f98293cf3dfb54969f1e21d4bc4f3693a0f8d6cafa2242092462ac403f4eb8e6bc53f659f851fb3cfc53f16ea9a0fc78fda3b45f879610e92f3d96b5afdc4705ab399515879ce76891436f0848670a42066214f37e18d1ac347f8b76d6be1dbd8f59b4b6d61c5b5e420a477b1acef0a4eaa70596558f774e15d4f5c81eabc9b0f1a2a6a5a9c54736ad3ace2dec7d4f79e35f11591596e23796131f991c904a5980ce3b0ab7a77c4217bfbc92472cb95deebb48e9e9db9af7cf899fb145d5ffc3bb1f899f092796daf2f6d11afb4c03e4c98c1da9dc67bd7cd5aa783359d2b5b1a76a2d3e9da93dc309ada643e5ef18e09c77f6e2be631385f6751d99f4b82c67b58ee7a1e99a98b94e222bb630bf3b67f740ff167a64f715b7a5eb0b6aa05e44bb2371e4c7bf2173d38eff5ae0744b0f10d95f0d135b8a501d00172109126e24ed07be315dddd786b50fec6fed18c0236e1982e0a6d1c67debcaa8b467ba9fb89a3d1bc1bae43395859c14790a3ed6242903e9f95777e16b086f87d98ee70d2642a92a5477cfb8e38f7af09f06f89a5b991a025646458c0459026e60796c9ea738e3d335ed7e02f15daee49a356994b3065500f3c6f2338e338c7e35e74f466f4a5292d0eb6ff00c3a6d74d6b8bab3919080aacce3919f4feb5c37886f2080cb1cae90912623da49523a107f3aecfc4be39b3bad3d2d639d4285390e36ed19efef5e29e3af14b59a4f224a30430ca924e4b0231f9524b9b443a91695e453f14f8aec6ce49add6d93c966f2117cc2090464f41ed5c52eaa52e1e3b2db1c29bbc8665de5b8e793ed557ed726ad792dbc6725d8925a505ba73c76ab5aee893697025d46a2358adce3682df291d4f6ce7d2ba61094353ce956534fc8c4d6b58b6b6b830f2b18846c91982329ce4f7e73d2b95bbf16ddddde91a65bfdaa424ed752088f23000c74fad2f88ad351bcba966ba897ca5c2231cfce475001e79aeebe037ecdde2ff008a7e6e9de1a29a6db732c97b227cc5579231c9ebc7d6bd2c3d2954d6c70e2abbc32e6392d267d5238bed7acead6d6f0c6079cd2483a8396cb139c63d453352f8a7f0ab4d82eae478dd19a38c9d8b799520f0a540ea720f4af0efdb73c37a8fc3df8cba9f835759778acd556694dc155662a4e4a8e1871c8eb4ef89dfb29784fe19fecbfe0cfda5f43f8e1a16b0de26bd7b79fc3d15cafdaada400798be51c15da30d919fbc2beb30d9242a50e693b33e73119bce3512efb1ea3a57c49f0c788e378a1f1248238b28d2b4c03b30c11819ea73df1d29c7c51a8413ca6c35fb90612514020e7f5e6bc1ff00663f0de8de33f89f65e14f13dbdc0b2ba7d8ce0b6ed9ce241ea791f957be7c51fd99b5af826b0ebfe07f124b7f6729f961b97f9cf52320f73fd2b971197c29c5c53d4743339493d7524d27e29cf2dfae97ac5aca6190aa34e1c619b9f9b19e08feb5d6596ae75190c5044b208548019f3e674e79ef5f3deb3a9f8b7c31aeac5e29d2a7b6b924ba4722feef6b0041cd7a3f80fc5e2e2082dbed1134801951771dcc4751ed5e6ba7c95395b3ba9d7a9519e81abd95c5cbfdbd903c7b1417da0ede39ce0e462b95d57c3d973796f1ca06c0c5831c927a000e3df3f4aeaf4331dec70bac0b0c933b79d0c729ddb4839c03c13536ada4c17188ae4c8db2160823fbe1c11827b63e63d29ea9d8a953beacf3dbb8e5b6f32d2f2e22221412b2a6793d97a6735e7df15ad8b957ba4289248180550429c70013cd7acea7a525aea36eab233b83969367247a0ce075f5af3df8a3a7bc9a63bde126632139c7cbd78e9df15ea507ee5d1e662a2b9f43cef4e8247b954523620c4876670493815ec3f01f498255fece7d2f3199619648ce36b90490e782772f600804939f53e65a65962666821da9e49cbcaa79618f406be92fd95fc1936b7ad1ba16e3c9555217041c827d474c62bba9ca49ad6c650c1aaf4a5167ea7ffc136fc79ae78c3e00c5a7f892f5e59f4abd7b7b7f3179108e00ce727e60d8ce30303b57d0d1b89103af4233cd7ccbff0004f24bbb1b1d6ac372a400895624e402f2c98fd057d316ff00eafdbb7e55f53424a5493bdcf86c6d2787c4ca9b43e8a28ad4e50a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a1ba1fa5141e462805b8d2488895ea01c5703fb4c5a4775f027c51048acca74a95804233bb93c67debbf0bf2ed358be3cf0c1f16783f52f0eca1596f2d2488a1ce1b39e3fa545457a725e4ce9c2ce30c4c252d935f99f9abfd91acea12ea56d62de5bc53b8ff57fba4079ebd79e86bc5be2368d35ff008b53479e28d6505d165793a8039e99e0f6afa16f9aefc09e3f1a3dda2fd96ecc8ac662db7ce46e17eb823afafb1af1df881631c5f152f0dac91c91dbaa19362670e4e4f3e95f9362a9ce189725b23fa224e188c04636e97f9773e62fda1fc2dad691a84536a7145711c28aa36b9fde0cb1c7ae3e6ae53e1f5ae6fae1276c471ca4eed9b8263dcf2457d0ff00b42f837fb47c317174204967e7cb880e4f618af0cf005ac2e2ee5b9b368da39628db823e6cfcd907ae2bd8c362a53a5668f86ccb031a35d5defa9e8de1c7680863b63064c209108cf183df1debafd06d56198da98816870142a8e5474cfe66b8ad16692e5593517dcace4a26d3f3267b7e55d8786aee092fa3b8b72f1990658329c6de98ae0c534cf5f0118ba36474379a4da496cb1c7c28520ae386cf7ff7ab95f1c4e21d3a68a2b7cb4688876f384c81d0f24e4fe55d519d27b658e30ee23930769c1cfad663d95b6a575bcb49e6aa92fe520391838ebf4ae2855e5d11b54824eecf1ff10e893c4a6436627f3788a408000dd4fd38cd60ac8fa2df25d59e9483202cfe5654a9f55efd6bd8b51f0b79f2084c698690a3e49da48c1ce3ad63cbe01b48ee3ed122e713929263eef1c607d6baa357955cf3f11858567725f853f11a3d12fa3d4ee2e2497780b219f224c80e78cf51f77f23ed5d7fed03f0cfe1dfed2df0fddf4af13da5b6bb6b9b94df2f9619b19239ea796fd2b8a6f010d71c6af7f2ce2465c5b85017907b01eb57f4df873ac6a321d427d656385c848965815b0077233c8ed5b61b319536f438a5947b55a1f294df04bc75a4ebaba1ea1a116f21c3464da1292b280bc91f2f201e73d71c1afa0bf61afd9df46d3be2358ebff197598ec34ad28a49e5de5c2bc923704b13804f3d07bd7b17857c0da7d93cbf6a911db6802e17e52077207356a5d2f488ed92e66b169d20949323385700743d326bd3966b3952b1a7f60d39d3b3d1fe67d01f12ff006d6f855a6e8b2e89e0ab3bbd4a282258adee21b7215f1c1c63a71eb5f37f8a7c6fa978fb5f975cd4bc3c2780beeb78a4e1e3046369c7ad5ab5d2f4cb998de369a900b82409b243303eb918fd2ba5f0a7fc23d657ac4d9429243858fc88c3f99f5e057855710e736cf4f2fcbb0f848b56d4a1f0fbc21a96b170f67aa4252cd6206c6d8cdf346472704f5ef5daf8f3c3fa1e81e0c92c6c246608a0c8247cee381cf1f5fd0d74161e22d235cb08449a4456b736f21fdfac182402460fd467f4af2ff88dafabc5716b6f71b93cb6479031214eeca8c7b0ce6bcd94acddcea551ce76e872fa6b4235110a5a18831215c2860ac0121abd0bc23e2296c264174773280092db7e70064ae38e73dfd2bc8ec6e6e4cbe7194cc18bfc91b609057d3af6aed3c27650ea2e639ed9e312c85ad57cce480a324a9e47ff005eb96a7235a1eb60e2da67a0eadace6d4ab132b16dc7ce39651ea31c579978ff0059ba99ef0cbe73fcc044c88170b8efeb5da4f0cd61666dda6597cc4c22963907af6f606bcefc7f751942d0b6ef3d7fd195d982970707a7e34528c533a71705ec8b3f09ad6c6f75e124d2200e36ca4a29dc0f6393ebcd7b2f8b3c07a54ba6086c2d61cf94023073b41c753ed5f3ff008175892d2f5a6322a10bfead003870031fd335ef5e08f14a5c5b45abfdbe39248a23f238ca1383c63bf4ef5e84611b58f99bb84df63c47588355b1d624bf3e1d9fed905c878678883148bd57afa11cd7b57c1afdabb40f09b4767e2dd25ed248b87b88610e501e4fca3d4d696b1e29b093ed16eba5c05ce0c6cb6a31b4f38c0e07d6bcebc516fa75e4ed0d868d6f3990e668e48f13479ea401c9fc338af468c9528dd0ea461898f2c91c17fc1487e15fc3ff008b9a8afc65f82fae595d5d5d41b753d3e2904532be30597237ab73d857c3da87c1dbcd175e7b91e106b6d42e89f36e0d90172ca41009976e64ebc67a72475afd11d1e0f034b7af657da4bc62488c18f283b1c739c9c32b73dab22fbe1cf856fef52e6d6031c80188bdd92cc883a119e99e6bdb866ca34d459f3ab25708d9ebfa1e6ffb11fecb29e0f58fe2bfc43d42d74e30c68b6514b27ef3cb507939ea4935dc7c7bf1f697a959c76769749218f711711286200e0633c0ebfa5675f7c37d45ef2e2c8ea2f20f2f10799292303b63a5616a5e01bd49bfd3ef0b433204628c36c641fceb8aae369ce7748ba195c293bb3cfbc71ac6a5e21bb48ee2e9258a1182b220664002e4fe38ede953787b421652a5e5a2aa6705a361f97238e79ae960f064125ec9324291bc329225719322f1c7d0f3fa575ba6e828d66f1c70c423f20b18bcb1b431ef5c5899b93e789e8429460f42e7812f243a7247e515bc2e41578836d054e307d2b6353b49edadfcc92367676dccd1e39047bf4e95434ab57d2ae61992e9f0aaa385182483d2b624b986e2dd449332346a41575fbd815cf0ad3e6d4da54df29c25fc279b99207084b798371652474e4f4e2bcf3e21dbc2ba2e1e362a72e5c49c2e4f4f5af51f112dbbda864250a92423363861dc77af3cf1a5817d2eecb3172155563f2f03ebef5ec619bf67abb1e26220e33bd8e2bc3fa55cdc398e06ce62fdd98e4e7248f5afbaff0064ff0086863f0b3eb5750851e56e7447f9d8ed07e95f197c38b09eeee4caa8ab2458501febd7e95fa17f05e5d334cf83767a8c8f189a55c6e53c97c05e9dc53aee7269459ebe5f14a139f29f4afec0da349a6f87b52ba0a0a4f1c7b1c13f362473dfeb8afa3631b5715e55fb29f85e6f0d7c32856e21c35c481d1b1805300f1f8935eab182179f535f75828b861211f23f2bcdea2af98ce6b6b8ea28a2ba4f3428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291f3b0edeb8e2969b2eef2db60c9da70280dcf887fe0a0ff0d5bc29aabf896c6dd9adb5426ed550e0c332e4b807dc73ff006d0d7cd5e10d005d688fab6a88ed753b90ee9d18ff000939ec3bd7debff0509f0f417df012f3c4524259f4b9a390301c2a3b046cfb11b47e75f1ff00862eec9bc116f32d911b558304c6377a7e039afce7897090c36355583d25ba3f70e0bcc25986530a35378e8fd16c797fc4ef0a4d77e199520b896463b8feef6ef539c8af9b349f0edc58eb77b16a048972ae464f527e627d2beddf1369265f0e48a91a2939e5540600f7af97fe21e930dbeb923a26d96421488ba4983d185716065272923af3cc3c7d97b4ea9dbe4739a6b48e235bab82a6288a2be30146ecfe3f85755a36a0f0c6b6d0ab161c6f27181ebcd73915c28ba3f6881bca6388cbb0f94fb0adad36e903b3cd287c8036e3823d2a2ba69d99c181928c2c8eba7bc55f2c8b966672ae890ae78cf7a7470b412b25a5c460c8023abb649ebd979ef546d2dc5ccca2d6e1a050c1536b0e171d2b4ac6c5f4f81ae167557130cb8c65b9f53d2bcd9a9465a1eaf229c113d969132869665f91a52f1aa90c072073de966b182e258d23b7558f79703a15c1ef9f5a7473480f9a988de1721c47c93df39e94b0ace6242edb9a6dc012bd79cfe158cebd44ecb637a584528dda2d5ae968f6e971731421972b1e08f94e720e2ac41e15b59505aa21fdd332aca07182a5ba7d6abd8a5cdd3c906d3fb9cab0d9f74fcb83f9b63f035b96a972d6e5ef55811390a635241e194138e9d33f8d5c6af2a26746105a0eb1f0d425e19279cac3b4232020301dcd5e6d0ed208cb59c515c24ac504d302cca3fdd1c9f7356f4ad366b20b69aa448e6465687cc6f93af73d735662d06e6fae83db6a2be679ad1ec923c46a48e31df15a4710dab196db9cccfa0cf239135bca63b6fdd80aa0212dc03cd6c687a0c764b05ddbc41444acd2ee037120e3822aec1a768a271a85d5caeff977dadbc447cca327393cf4c536f1350d536dc4368d6f6d212636da7bb74359549491118b93664f8b7c63f67b60962e23328092488a58e481dbea0d79b789e5bd785a2100d8d72cc4bb9532061c2fd7835daf88a096dd1e554c329c6d0bd47ad71a9a648fa919e6497723ef4121c8e8467f5ac54bda68757b1852a77466e8567666e4c0b2be481b760e54107907d41c7e75ea1e0bd267506ea78c21c9288181ddf2800e4f39eb9ed5c669f1c68e1e30cca980ca1073eb5e81e17881b45bd92dba711927047e1f4a4e94adb1584aaa37469dc69765049bd1397b7dbbd477ebb87f2f5e6bcefc696113095d0b2a3293feafee374c807a57abea51c72db7930fca2240c873923d7f1ae07c731cd72d2c218c91e46e90ae1829e3a7a53a71b4b53a717372a5a1e4ad15ce99ab7daa09fe4259c8c0c9186eb8fa8fcabb8f87be2916622b396ea3884851bcc9338e8323f9fe75cfad8c12862e9f348a511c2e0f20f1cf5c62a3d18b5a5c88249a65501434b1ff00095e4647b9e2ba2bb71b389e1d351949a91ef3a2456fae5b26a56b77e7c88ef1b451c9821faa93ec3deb3aeb47b93a8c715c6ad17da8b6245922c0c9eeae3918aa9e13965beb48b53b779a394805e356c82c3bb01ed5d2c260d5c42cc8626490969bca39538eab9feb4e8d69b9599ddec23085ce7ee3c11657723cab3c242f0cc537176dbbb823a7d7a9accb4f0bdec68e228dd4900a8f2b3918ce09ebc5761a8dadbfda7ece97a660e13fd257085c80c08c74154a48e4926983deba8511a70fb428c71cd76733b109c53d51c8cba6bb47b636d9e636d04c7f3061ebedcd646a5e1f9ae26315d588d85c0b82a98c7ab0cfad75fa846608a779ecf2fbb68443f31c7461f9d56708f6697334d21046d2246c71dc63f2a8551395853a509ec8e3a4f0de9cd7bbe49b6a21c440a0f9945587b32b6ec628904641dc7201c7a7bf4ad811471da3ef75dc641b0edfe1cf400f5eb5008a279a682e6663b43046d9b48e3b0a25557c3732faaae861c9669a7ced19910a6fc2167e41001ce3d39aab7d7f2cf3986699848c80c272006e0f4ad7bdf3da3997eca8eacfc3301b896000cfd31fad605fa2dbceb14b84df0aa1da3712064123d0d5c17348e7ae9464676b87ed567e6da5ee5b60494ba6071c1009ef5c5f8b21922d0ee1843be240325d8efce7a7b7ad74b7b91a8bd8c717ee846644520e0b2f4ff817bf4aa9aa5b1bfd30471619ee9d0b34bc61b18c1f5c0e38af5a8b5cb66781895ed2a28aeb62cfecd7e01bcd76f66920d3229a29572b2907d738c9efcd7d93fb2ff81f55f1aeb717c3b2ce90e9f738976c21b1f37afa5799feccfe19d17c39a74a5a28d21b740ec58ee5ced19e9f9d7d7fff0004f0f051baff00848fe234ae32fa835b4712838461872327ae338aeeca304f118abcf646d98e23fb2b2c9cd3d76f99f4cf87346b6d0346b6d220e56de2080fae2b414e474ef4c44620924673cd3d46d1826bee231518d91f92b94a6f9a5b8b45145310514514005145140051451400514514005145140051451400514514005145140051451400507247068a0f438a00f3efda57c103e227c0ff0012f85da12ef71a64862080eedf182e9c0ebf3015f99de0bd7ee6f749b9d32f70f1f985edc0930e32caa4f1ea0923d36fbd7eb4dd446586542fb43c6ca481d322bf273c6fa05c7c2cf8afadf85f5380471d9dfdc59cb113f322890f95938fe28d63c7e3eb5f29c4f87855c3a9c4fd0780b193a55e74bbea85b3f1ac623bab59e079087d80b024a0f5eb5e25e3e83ec57ced2dba97927707cc6c617d41aec3c6fa97d9b5712f86e612dce0fda2146215976eec1e7f0af3cf13f8c24d790e97710c915c452b331618183db24735f2780a6e33d59f6b9ae2e5530d28dba9916664495a54077b9da015dc83deb4ad8dbdbdd88c3b1283cb2ea3efb1e781daab44d6b241e64722925c28c9edfdec8ad3d250ccaa218a23e438f3b7b7dd93b2e7bfd6ba312a2f5479580936acb736b42b575717170bb9d1f72866c1cf4db8fa135b4d2448a6da0b51f312ced23e40e3d3f0acad35ee21717368e1c64fda47f0a3838fa9eb5a4e6d3ed460b97019972c506315e555d8fa6c2d3938ea6b68b039b68b7450ec988d9b25049278e455c365fe8fe55b13b6462aa02e5a324139cfe1fad56b38a21e46cb78118e0662eb81ce6add835fdbdc08a343b43aa1257af519cf6eb5c351a3d9c3d34e1a8b6b2dcd95e4da8410c81031531360632dd49efc63f2ab3a6eb5776d13b47148519c638c23918ce7d3a13f8d09a7aade18670e8b0cdbb2c4ed7fa9ad459e3901024c7cf8458d7e5c1ef58de4c53c3c1903ea5aa2ceb69141009661bd42b970075fc0d69c37faa4f0ad92deee448d84aea46e8dcf4e83f5ed5496ce16bc4320ddd088eddb1bbee9c96edd7f4adc48ef8db2dbc320570c79b720019e9bbbb7e62939746733a14f9d1caf85fe1d7887fe167bf8bbc41e3532e96b12a45631b10bbf76464e3ad77b763f713436b2068d06d7619e073d29fa62ac323699728d16511bce8d4b02c4f3c1fe7dab6ce8d1c114f23488cf0427cbcc7feb411d7f4ab525156bdcba94a318dac78ff8d60bcb38e2b79d4b47c904bf3b3a926b93768ade49ae816318202f24953fd79af49f8856a54cd7d2da6c8cc6adf33742067f2cf6af21d4b5537b78b069e4142d8930f8f97f2e7b5694232bb7d0f37173b46c8d2b7d4f68f26e802ce320a1c14f4cd761e10d60db1820f2bcf2c719ce5871fcabcf3496b9b9b837630fb5b6ba343f31f4c73d2bb3f0dda798e970d6e9f2beedbb886e98c01dcf34eaca76ba16061cc9b67a059eb6d044b24f0c65f711e5138623d8d71de3f87ed0af3ac2c778206e930dbb07f303afe15bda758cbb8db2c20b06fde073968b3d38ec6b27c45697ed1cc27b4326c942473b8c633ed4a9caeb53af13771b2479b6a9716b0ce2688796b192dcf4db81cff4fc6963b7b2d4e75b88adcb88d9582ee232c7f8b8ebf4a678c74ff252e3f74e5a08db284e0281ff00d7ab5f0eaecde0314d023b9da23688ee18c1c60faf1fad765484dd3e6b68787092755a47a47843ccb3859e2728a4032020f07b1c7a76aec34f5b6d434f7b8bb924910aed66b7f970de9cff003ae7fc39a5cd3c28e515b7462394c9d589380bf9d6d8f0dc96930d3258de2655112c6ac719eb827b9e7afbd79eea494bdd3e8a9c69ca9ae62b5c5a5f416df6eb26478e12015284b0ce40355b53bd9eeb4f4b0b9291b1c8759d7e560a07cc48031ed56523d434a91647314423f99e190bfce3381c8eb55f52d5d6f11d64b25326fcb18cb33019182370c77e9ed5a2c4cb96c27878dee8c79754b5b7b7125aca6e232086b956f9f70fe1524735089e331c73bc81bcf4058b30dc87270a47afbd6b5adcc3a944d13180c914f959110214c123e65ed55752b7b59d4cd6cf1348e3cb2ce3238c96208efc8aa552f1badcd553838dac655c09e6936c77a244e446cca176118c807f2aaf3dbc5bd65102b4a64669764992c0e31cf4e39abd045f6852d6ee006550abb72a3ef75f7e3ad5313bc3349e6cfe5030ee07700aa3382318c9fceae334dea673a308c4cabd9655768f66631f30278ee0e2b9ef12476ed0acd1f96d2c608f2cb105bbf15beb3acf13c71c311c163bd49e40c649cfd6b3f5279dd65963b754640180047ccbb48cf22bb69c9743c4c553b3d4e33531213e6026392395406539dbd09e3a9e2afc13db082491a2263898b80c003923deb3f508e149bedd02ef69246533ba90bc8ce319f6eb55fc4504cda2ad8dac81252543012e720f3fcb9af6a9351a69b3e5eb34b1314d69747b0fc1ed5afbfe112b9be58a27d96f33b3caa1b78d8b9c0ef80471df35fa7dfb22786ac744fd9f3c312d9c7b0dee9e97d72046aa5e6946e6271d793f957e5b7c2c31d978461d26c40374cfe4a2cdd10c8146fc771820fe15fab7fb2f436b6dfb3cf832dac9e46863f0e5aac4d349b9c81181c9c726bea325b3e7763c7e2a952780a4e1bb93b9ddc6acab87209cf514ea28af78f830a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a1ba1fa5148c70a4fb50046eaaea637e8460d7e6e7edd3a2cbe0afda5bc4edaa5d6fb3f12b417aca20e14adbc70b0079c80c9bc918fbf8ed93fa44c858643edc8eb8e95f177fc15b3c0baab693e15f8b1a54645be9ad3d86a52e380b3b47b01fef64a951fef67d8f9f9961957c24a2bd4fa0e18c62c266a9cdd93d0f8fbc31a0f8764d425d42c523517afe6461f2cc8ccdf77af3815cb7c6ff0000cbe19d44eb0b146f1be021dd9dc4e7f8474e9efd6ba5f0e7f6326a9f69d62e9208d6476b72871b1b1c1fc2b23e3b78e3459b48834cd3ae61bc2c3e72ac46d3cf53dfafb57e7b0fddd5b1fa3e21caad19b5ea79a0431c4b1fd9405688fcb18380bdfb735b3a5431b5bc4c10466e1c3448572580ee7d6b334d568122b2951155412edbdb2b9ed926b634e68372a40a42ac5f2194e78ee0574d78f2c5b679f974df3dcd8b028606f218c457734ac83ef13df1f4ad8d3985c86b79cb01081bfcc0092e464afe1c1fc6b134ff00b24ee12da05647f96571956e47415d0585aac048219dd82bb10725980e4fb6401f9578b54fb2c254e68962c77c2aac6df8ddf3175ebfe15a56135a9b83f646f2fe7dcdb98e2aad95dadc44639275501f77077633c60fe756f4cb6314aea53a93b99932a30323f3381f8d714d2e87b787f80d319bbc3c85a4f373fbb53c7438abb6ba4c1a6db3c97b3985d231e5ab8c17278e07e34ba435bb594775a8c51c4a641f2f24707279e3b54d6ba56a9e2abd92e609658e02098164719d99c6572391582f8ac68f4dcbfa3dae997b6f1dc4577140150472db32ed95f803728c9cf4cd6de91a55b44a0c31186df6e4f983f78e08cf151785bc3ba3e930a4cf6085fcc3be6e4b67d79aeba3b1dd66b208d6ea640adbb6640403ebc66b39a6998ca2af7455d3b4fb381becd672bbaac414175c1c1e719e6b6ed74e5b836f0450b31452ac4ae701803cd4ba45bea135e25c2d9c71a18f00a4633e9ebdab4a2b7b882232decaebb86e0c92655c28c73c71459b5744579da37ec784fed41a82f8734afece809f3e75290347d1892481ede95f38dd6a1a8dc43c9642c023320c8cf7191dfdebd97f6b7b86f10f8eacf49b79191523250eec2e7e95c02f851ad6cc130b27f0a989080a4f7e7af4af4685e34ee78b5e2aa4b999a1e0ed2996da382fdc1937af97ba4dcc060fa01ed5def87bc330ceb2196eddfe600464ed0dcf41df3f8f6ae77c2f696d15c5ba806e264e58678e074cd7b4fc38d02cb58d4d2231ae6451b902e71904e0fe5d6b2a96a97675e0f969c5b650d23c3ab2dc1892e18ced18569245c32723b8fe1faf39c557d73405d56d2559a56081ce41ca991578dc3db38af69d3be13e99a5e942f7464db395def086f91fd464e4f4ae63e20e8696b1c7736ec4a085cbfcf8d809e540c74dd8a7eca5185cda388a7567689f33f8e7469526743134d2451b13294c06dc700633d466bcf3c2dabcde1fd7c412cafbc48a4b29c13c2f07b01cd7b77c428eded3ce592cc8c2ee32274fbc4019ee3bfe35e33af68f7371aa3ddc16fc6c2eb22f1c8038f53d335e85393f66933c9c4e1946af3c4fa8fe1f5859ea5a2457f6eeacb205c8dbbb693c0c9edf5ae8d74d9240b180cf340a49006ee477cfa9ae07f63cd7ceb1e166b29879925bcf8914be37003233f435eb1a8e9cf0ba4f2cacafe73216846d0e49ea7935e455a52e7725b1ebe1dc5d257dce07c43a6dcabadc0b4767310043a11b4927d08cd627d82f33f6a82d6682431663937e790dcf07d715de78874d69ae1e2919e5782404658e3e86b2934a85ee82c6c1996160fb1f84cfaff9ed592567a9d894794e00e9cb1c8fa8fd9fcdb8dfb99dd721c96fbbc7d4fe54f37503623bb7c44642d2448ca3ca2323001f5ebf856abd93d9db31f2ae228e07630b020866c119cf7ec71556789d23fb4e656336ddd2c72f9677e3d07ae09ae98f258147530259997f751dea2209958e1d490a377503a75fd2b3ee90dbcd25bbcf187742844af9214fcc1978e7a73f5157b53b67ba7f3667004f1362499d99997b7183e86a95d9b8b29523322f988a620e233c2e7af239e9f855a8a5a99558bb1913aa18a3bcb68e60641b641b780091900fe19aa3ab493bdd848c2842ecacdbb25557001fc73d2b4ef42585ae23b46955e53222997390c318e9dab035b586ca50612a2401434209cc99ce7e95d345de4ac7858d5adcc3bb123b2466607cb99bcd5dbfc07be3b0f7a759e913dd3c516a17426119016555073cf6c76dbc669b24b12dc9de165712846111c3943ce08fee8ef56346d6eeb4df1646d6b651cb6d030332a1ca918e83d0e057d047dd8a67c955519e216a7a5f8463b08bc411a6c0c37c0ac33d1430c0cfae17afbd7ea8fecce73f00bc1e7c9099f0eda700f4fdd8e2bf39fe047806d3e25f88a3bad37459e385e4dcc86324e76f073c7ad7e96fc1dd2bfb07e1968da06c2a2c6c520008c70a315f539349b8cb43e4b3d9de8c60deaa4dfc8e968a28af70f980a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a08c8c51450034c7918cfe95e5dfb5e7c2a1f163f677f13784bcb79ae96d1af6c1634058dcc2de6c4002477503ad7a9d437f6e2e6ca5b72aa43a10432ee0723b8ef5328a945c7b9ad1a8e955535d19f89d1783f59bb135edc5d3ee327eee366f950329ce72074231d3f1ad7b9f828afe04bfbd3a7966b783ed0ceedb7b678f5afb4ff691fd8ceeb4ff0010dcf8afc1da51b8b5903bac4881bc81d76751c0e6bccc7c0af8a9e29f0a5d787fc37e12bab891e3f2a53e585da00ec09e7f0af85c56535a18a72b687e9b87ce30d3c159c95da3e1eb14116d92e8ef71093203ce4e78ad2d2662a2232a3a00d8041dc48f6f4abdf15fe14f8e7e0ef8b6f3c23f107c2d7ba5dfdb6c7921b841f3a364ab464121d3b13d8e78ac7b196313c7630c721900dd36e6e109edef5cd8a84d2e4b6a3c1495f9a3b1d4e9b3282e1525199b3102401d3f5ad6d2d87da9ada426290e37fef3a0f638ac4d222b7bbb757313bbc6832b9da7938c8e4d6cd943224982f148f1b8c8ce4a0ee49fa57835bdddcfaec149389aba7db2ababc766f2330decb0a6ec8e7033dfa5743a3d831479fed4151983428cd8db90c4e7fef9fd6b1b4a3796b2fd9a0959846b1b22c44862a1b39ce3bf43ed5bfa1e5b64b7222db1a6d0396f9b1c16fc7f9d71b4ef73dfc339729a3752c570f6fa6db169a009e65c295e33deba2d1adedf30950eb0c1948ddbf89719fc3d3bd60e95a7dbdc35c4af7244e5399b3b54678c01deb52491e13005b80c19944e8849da7181f99c57249da4d9d0d733d0ded0de2566b9b21ba2f3082afd97f88fbf19aeaf4b92ce268cc32b3093ef2a47852bdb233fad731a1c2f75fe8bcc6222dbb038e47eb5d3db59b45008607dacbb72c07face7803d00a577a730e51495cd48acdbcf56b2b855685beec5f3707b1e696edeea7b59ad6e17215093b1b6afe7d8f3d2acdbc30fd9d65b9c452a63cc28319fcaa2d5a688239600a6dcfccbf29247a512bc56871ced3d11f33fc71d2d2efe265a347bfca3190496ea738c0fe753dd786e4bed356281a4091c6701c721b8fe1eff005cd749f19fc21717735b788b4a480cd13eed9823200c11f5ef5cc69fe27d3f55923b4374eaaad89581f98e0723d80af469623f75aa38aa5076d4e7c5c2d96a22f622b1b45200c846d04e08cd7b47c36f15ac1630ce6677f2d47fab7192d83ce31e84f19ac093c3de0af16e8a0c566d15d08c792cbce79c64d61e977da8784f556d22e6069d966211645c2ed1fc43df9159c6aa95fccc545537a33deedfe21ac6c2f92edd5360558cb6d391df6f39fcfbd739e34f1bc77711599d931112ab363ee93c803b9e6bce2f7c6d756b2c761776b22485b11ee1bb93ce463a7423f1acdd5357d575d91acb49b6679a4936f98ec4ed383ce4f4aaa7372ba634a7ad96e735e33d727d6b545d36d666db13ac711eac0123240ee723f5a86fbc3e999b5398f9a7694dc0e481d3db27dbf5aee345f05f837c3502cbad9134bb7f7ce64f983e7391d7158be23bad0b47b964fb6c52248ae90c6b11627774618fe215d2ea4796d73374e4dea68fec9d666c3c6b7fa684fdcbc4b22a9523693dff00a57d192bda25985bb862451ce49c1dd9e315e39fb3ef86a4f0f69cf7b35c482e6fa6678c5c2e08503207b57abbdb586b765f62bc2e08901590f0090338e2b865292b9e8518a8c0ccf175a5ca5a335a5d381295dc656079f503031585aac1058c26448153cb8b33311c103a9f7ebd2ba5d734f0f66c2f2f011907201f9547402b9ad5218e4b69620ec52506378c9dd9538e79c63a56329c9ad51d6afcba1cfcda7ba6e69e402056f9887e01233c03f85653d8f945dd62761bcc90963c1201c1c7e7f9d6ecb2c9e4246b6f1cd19cc62261c96c01bbf202b26e3122bcab0b1d9fba648c7cca704671dc73fa5541a12e64ce7f56898ba2164468e3c233e405565ce383ef58dac461d259de532a846c247960a493dc9f7f4ed5bbab69e2e2379e5f3a32aca38e7e5c7523f0ac29218e38e49fcc077aa908cc793ce063b679aea8da4ac615a764db39f9f50fb3e9df6792d65d83cb064efc03d0f6eb59bac5dc290c69158bb379a1cc8b8dc57d09ed5a9addbab45f678dd1c4ac32467119ee1ab1bc404cb246be4282b8dcb0fdce3be7bfe55d54a9b4cf031d36a2db30de569267b95b7668d9995580db221ebc9e847d715ebbfb1efc33b3f881a8bdc6b1a6c46dcc87cc7246d5c023a8c8cfb5792e97a26abae6a09a4e992335c6ab729696d1c632a5ddc28cae7af3d6bf52be02fec13e0ff835e1eb3874cf16ea135da4118bf82e8298bccda3705500639cf393d2bebf0196caba8d4e87c0e638ea7859352767d0dbfd9f3e0ae81e10b213e9f62ab24a9f29da3e5e060e2bdb34cb66b4b45819b3b78aa1e18f0b59e816a2189958818240ebf5ad6550a302beb2850a7421689f1989c4cf113bb168a28ad8e50a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a47c6d39e98a5a08c8c50042c8b20c0e07602993c4846e666254640de71fcea7f2fd1bf4a47877295dd8c8eb8a24a36d837f23f3eff00e0b4bf0fb4fb65f007c47b4b702e9ae2ef479d949c087ca1328dbddbcc1c1ec33eb5f0bdbdaadbaa06ddcc8636907219c13c9cf6c0afd5cff829af81c78abf647d73c40d6e64bbd067b6d42cca43b9a32926c7c1ea32a79afca39e37e674937059dd421049419cf7c6735f319dd28a9a9dba1f67c3f5a72a1bdeccdbd12ee18255696cfa45b629178c8049ddfd315d3daee826733411a960c4c9bb6f182067f1c7e75c7e991dc15cb5be59738064c055c74aeb61b9f361dd7322892231b32e33b86edd8fe95f1989a7cd23f44c0c9f29b3a123acbb26988923088bbe4c798a7a8e9dab7ad1768f2dbcc41b4b078fe5ce0f4cfbd61add47a7ea6ca96625df87525b38cfcc7e9800d741a71bcbc58bcd201c1f2fba9563c1e3eb5e5d64e0ec7d261a4dc4d292fa5b5096cd39c994f97b50311823bf15ada758cb732c9753677395caeee073c567c266ba2dfba8954839c1f983ee1d33db8eb5af676cb6603c82681fce2b264e7700461863ebcfa570d457563b632496a6b6936e6de34b377795b867d991b4138e4fa0eb5d359c518956ea49c148d82c444870a7fae6b9cd3ee614e12f0040024aead90c339efce7dab4f4ebc58e20f2dbca0c4c4da864183f877a529a8c524539292b1d7a24723798ae4165c31ddd0f6fad55b89643727cc9e3625485603e6fa55717b2dd5e45223057551b89070c4f6c52b5b5eaaaca2d36ba02eecc4773d31493933171e5dcc7d4f4592ed5167ba52cae4c6ac80807079c7f9eb5e77aff0087f4b75f360d3009482d308220bea3767d3a57a1ebb7b1c6ff00687b820796779c7dd1ef5c3cf70f79a8c7034a5b0bb596324285ec33d4e7d3daad4a5b18493633c01e1ac797148aefb4046589f1819c8c9fc2bb6d57e17c1e22f0fbd9cf24733b0665dc76b20c8e3775cd64f872d52df51b6bb8a36255b32ecca8c7a91dfb7e75e825d3cbf3638fce9c02008c636e7dba56d0b37666324d3bd8f13ff853da90b890c2cd22b1c5b482525c01c11d3a5751a37c22b7f0868c975752cb33c8fb9f2fd320d7a4c1ab58c5676d6926c86540c240a9f30cf6e3f3fc2a85d6a5613582086e9a5881613970781cf35bc29c6116ee7255a953648f0cf11e85750ea12c8d3848a3055771fbea4d1e15f065a4731d42e5249522c11f3fdd24fdee7f2c5761ad69f6577a96e866574284aabae0119ef9e955346096d70d0f96bb2590ab2b1e318e82b273f78aa55ecacd1d66816f0431162cc91bc651650d96391c56ed85ccf1043238f2e1fdde5060b1c753f8573ba74502c45d4b47105d8a47019b3c569099a3b75b7b3dcef1802e09624124f5ac2a55d6c76c6a270d8da79ae2e94f94a7cb41840cd9c93dfa7b5735aa4b23db7992b825c856758c3018271e95720f1048933d8cb26086c26c53ce073589793c7269e4dbef86359b1b0907273c9acf9db46cdf2c4cd9a59ed2f648bece81c9cb2c7d97b9cfa9fd31546369a349a5b484309485880639039ea715a9785a49bc89231e5856db286c30c819cfe55937134924060b2b8f2635c056e4312339cd745257666ea193a8cb78caca21318b670ccbbb3bfafcb938ce7f4c7bd72f7a8cd7a3c97cc917ccde5f4fa1f71cfe75d45d4b1dcc71c731677597225923ddb4fa8ff3deb9d9e102597c8018956708a70393f313f5c0e2bba29455ce4af3f75dccad4a232c9726d848731765f9493d7200f6ae3f508de289a28bcb8c85c1084f39ea79aeb2eee6dcb19a3b79822ae6545e41c027ae45721ad1b6b82cb6a8a10ca42b827763193915e961a3cd33c1cc6a414353bbfd8cbc330f8aff006abf02e893aa3412eb4b230f2f240894beefcc015fb136aa0a12ac465893939e7bd7e67ffc1263c0efe21fda26f7c56f0c6d0787b427688c9b72259c845233cf183d2bf4cadfa1e0fe22bf4ac02a51c153e53f26cfeb46a636cba0f031dc9fad2d145761e205145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140052382548071c75a5a4738427da93d80e6fe28f8474ff1dfc3cd6bc21aa46d25bdfe9b3432c69d4ee5e31ef90315f893afe9d3596bb3e817dbff00d1a6913cd74c6d22460371f52011f506bf75258d4a3973c15e6bf1ebf6e5f06c7e07fda97c61e1c8a03029bc8ae5226caa3975dfe62ffb3b4f43df27ad78f9cd3e6c3dcfa4e1cabcb3953975d51e59604065135bbec74f958b7ccd924741daba2d0ae495923fb3ee2c4460373b881c0febf8572f6d24d650ee8acb7c8919124865c8dbc9fc3ad6ff0086da385524b885db6b1557dd825c639fcf3f957c157d1ea7e9b817270b9d9d9caa8a5440bbdb6a3b05254b74da09f635d169b1c6755b78a165f2e2010420ede7b8cd737a66a189773cefb801e639190c7b103d6bacb09ad16f22ba7f2d83e37103a1f5af2710f9a7a1f4384936b434a3b566b8f2e552a3611f3c60b6d215b6820fa9eb5aa92bf920471341b93211be63f305270c39efdeabe9f1c56cd289e54513950a17ae06de41c647dda9259d631248b2332a2ed0c3083000193f90fceb8257e6f43b799dcb6b7ad0a80d144c5005dac9b4a64e3e63ea6ba0d3239c61a1471bf6aaa487207b835cc692577432b49e78910b9888dca06013c9ea4678cfa5763a3d88842178466470be509f233d4f07b639a57751e88529346de976f796d2c665870c09324aac082076e69da8cf6b6f218e30229321655284b16193c1f4a92d2e34d8edcd94e635f2e43f231ce2b0fc4dacc52491ecba691a3ce303866c1c39f7ada105b1c552bcd4ac646bee0b3ab5a3c8b372e57b0001c9fceb0ada3d363bafb4ac6659e2ff005c6370140ec3eb53ea9ae4f142561bc8e424fefb23af18c5731e20f19587872da49219636b9c83ba041919fef03c647b55380a9d4a939d91d9e97345f6958a59e448a439259f0464818e2b52f75e7d36d229a34999fcb2e434a32c036377d3fc6bc7b4df1f6bbac3a5cc77338903865d8369c83d78ea3dba56f5878dbc5fa49134f39bcb52c3cd82e901dc724f53c81c9e05472c8f45537c8ee77777f119af1bc916688ce40051793c1efdfe956bfe1239bfb2bc9b6b1923201077ff00cb43d707d2b9bd73e2cda450c2fa6784a08e6930c8cee36a3e3031f89ae5b53f1578bf51d4167bebe28c54b1b750146e1c1191db915718b48e59d2b3d4eb75296c2e6117773bd15ad8931bc670083d3d8d65409716ef1ada8cac922056d9c2022b97d3fc7f77a6cab06b333c81e72243237de241fe55d05aea965ad59fdab4d9a40a268fcd8b7e49518e00faff002a994649dce5a94dc268eb347bdf360b795d86d23f788dc8dded5b9676d34a850ccc246e51154807dc915cae952da695124725bdc32615d1db80739e38f4cfe55d66817c9711f9378e2789f2240a723039183e952a116eec9f6c969728eb96d3473ac6b33abaf4de70327af4ae7ef2e0da39dd106f98ed1b78078e4e7eb5d0eb86197641696c8abf302234208e38c9ef5cf6b5a7dc4d6124223791ca287908fb833ea7a7ff005ab29c6d2d0ec954e6820ba0753796ee583023db1af95c03ee73540cc82d8c733316762a4b003a74031df934e630a8f21a464404310d30243631c0fc293ed25a358e7411e65dfb881b571d0feb5bd38dccb9998f7cc4c18b79136459d8c589393d41f71c7e758776f6b218c34e5cbc6638ca2edc1f43f5fe95b1ac3c62474b4b88c2bbb36307e6638c9e3d78ae775d68a2492dade4232a1943a8fbd8ed9aed8538ee7356968ee61eb31c9f68f260263088ca70ff002f2306b94bf48da5dc8136473128a8c7cc63b3a91d31c56f78a2e602ad12ce85727cb2a0a9380b927b64927f2ae62ebed025926254018f25db20a7ca482d8f718fc6bdecbe29d48a7dcf98ccead9ebb1fa01ff000477f02183e177887e22bcac3fb4f554b5b59531cc5127cc0f19dc1cf23a74afb49171962724f5af09ff008272f8024f017ec8be15b5bcb6f2af351865d46fdb6e3cd966919bccc76ca797d3d2bdda33d6bf4a508534a11d91f93636a7b5c5ce7d1b1d45145339828a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291c6548f6a5a4724292280dc8a64df1326e2323822bf36bfe0afbe0eb2d03e3ae97e2e800926d73448a5bc43eb03f9218f6c6d38207a0afd249dda384c8aa490a4e14727d857c59ff057ff0004bea7e01f09f8bbfb30325b5e5d5b4f3eddbe489230f12b13cf2e0f1d335c98ca5ed6849793fc8f4f28aca9e3a37f43f3ca58e49c6d8ad8479919558b6370ec0fd466b5b4cb99a6b70b67012c973ba45f306e5c800ff53f8d646a1135c04f355a3dcf1054c16c11c1c63fad5fd36ce386e59d19c2b93ba444c703d6bf3ac5c346d1faae06b2764ba9e83a64e60822bab68d98f1b500040f5cfe19ae86da6b612463cd5466ce7e52720838c01df38ae4f4a9120b0824b7bb28ae70ea791fe35b9a34ad3bb0b6906629320b020293c019f4af26705d4fa0a351d3d0edb4995f2b0dc22c8e9160480818cfb1ab33400c63ed10346bb769c8c861df8accd0cf9d6c1d53fd692c1c9c920707a7bfe95ae867ba632bccade436c273d3259471f80fcebcba9eec9dfa9e8d39dd6a58f0fc71c6eb6d6f199204c28888c01c01fd2bb1d3a196cd56e6ede3545c60e3383ebf5ed585a4d8c90c2525930d905f6802b4f59f334f81a18503492db9f25449904e3bd4c1b8ea4ca7ef195e3af88361a4d9caf35c00151c928a031f7af1fd73f690d3a27122cd2f92b3796660870a31d7eb5d8f897c230eab7cebe2a4dac20c03182541c7438ac0f177c34d22eeca3b4b48e3036828b0a85f98ae413ed5d98471949b91c15da94d1c1eaffb45c3e23db65a1412dc4930f28cb1295192790723dbaf5ac4b3f167896eefa47bed16e4a4476a2e782bdce7bf6ad6baf061f0daba5cdab387b82d1c919c6d2783df1c5741a4e8fa5ce05bc88275f9485f37073e80fa9fe95e9fb3a338e877e0d28266668df13346d36e61b8d42d5ad5b6371c9040c7a57452fc50f055f5b3b5b6ab1ed2b192d249c027a8c75e993f853a4f843a16b57a218906539193fea89ecc7b9fa51ae7ec977e435cdb456f76b2c5979ad9c2f96bb48e87bf352b0d13d5a74694f59330eefe21f8526b97b68b548d9c2aac6ccc308d9277739e981f9d59bff89de12462fa86b08b22c6a86552707d48ed93505afecec97daa7f655adafef5212671bc0ce40ee3e9fad5cb2fd95750b8f0f89b51d1d9adf697335cddf08aac3903d738a23878a7766b88c361d456a72de21f881a7ce634b5b3b9904a0e182fcca37633fef7359767f12c6841750822bb12e15919cf009f9ba608cf38aeff0052f843a5e830c17306a4b3dc88f7c85385186e993f43593a97876d6d23905a2bc304888a58ed2c4640ce31d335a4a8d2b6a71565452b5ae8d6f0ff00ed3fe1fbab1115ce20bb5b7f2fcd9005de4751d71d3d00aebbc0ff001a741bf9574e86ed90f9882107eee4f2c01ef5e2e3e1ec57dae2b69da2db9791984afe50193d3bfb57a37c3df05d9a4e1534f459606dd1ee3919039e9ed5e6621c21f09f3f5630551da363e80d2f5fb0d6b4fc4d72ac02168b62e0e47158be21d33cb82e765e48f14a32e89f7b8e40c7e354bc256f3d8086e924df1980854200c1279adabb59ae60370d6f1abf3c6e3f30231dab9bda26b535e793b2471572ee60532d98dc50e3f740118e99a822954a3c52b0951d39017953c9ed5bb7f00f2c3fd9492a4004b125b39e3f0c7eb5cc4b74f6327201cbef11a9e79c820d6d0942da07b4d1b33f50bf4b9d3d17cf74665dea5540c04ce473edfcab9ed66f1a1d97920662b32b387c30047040c738ce73f415a37ecd17996cb76cb904ac6d825b9ce391c7a7e35cfdfcf730badc03e5b9013e565247a9c11dfad76d28b6ae7256aeb95987ae11e6a8f2d27b6236c9087fbd924ee1dc6338fcab312d62d52f868b6969313792adbc70ab824920ed27fd8cf5efd2acea53a585d4c6e6ee30ef130c3f38e983c7435bff00b2ce876baffc7af07699a85af9a2e75b862248397f9c360e3e95f4d945353af13e5736c43a90925d8fd7ef849a01f0c7c30f0f7875e40c6c343b3b62cbd0ec8517fa5746aa149fad436d1ac28cb19f972368030147603daa65e464f7afbed6e7e58f5d45a28a28105145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140050464628a280192a218c86271ea2bc2ffe0a17f0faf3c7ff00b2bf88b4cd36dde6bab068750b6d83732189f7b301df0bbabdd99437049ae77e287856e3c55f0d75ff000b69f31171a9e8777650339e03cb1322938f761438f32b7736c3cd53ad1979a3f10350961fb635de97213279f3070c0a803e52b81dce09a9f4f967897cf88923630f30c980493cf5aaba820b3ba934fbb4747b799e262abb8aba31846d1d58928f939c631469371182fe50012361b3cd8fee92704ed279e2bf3ac7d36a735e67ea7816e36d7cce8740965b8786494152b27ee2267c963ee47007e15d869335c59e96eac1b7c9be5983c6400474c0279e715cc68f28b5ba696de20e54647eeb86e3bd6d696c614c4b295691cc6dbdd8e030278c9e39af1674e573e9294f4bb3bad35d1c058ae2625f015238f685cee0541ec4e075ee6bacd39ad91d4405540c79b2ab2905b24ec208cee19e4f4e2b88b1b9b973f6657030996f28919e18ff005aeab48d4215892c55b28d18283cbf999baf27dbad7978985a47a14aaa6ec76f6d3da22977292bb267715c81f502aec9696372aad7313485d014f9368403bd6068f716d023172ce546660a85771ec39f7add9f514f399a591170cab1aefc81ff00d715caa6a3246d25763ae7c3b68b6c668e1598b03b15ce03fbe4f4c7a77ae5fc55a6cb68ae8e6040d18daaf6e1f69031c1aeb60d4d8e6c259d1f7306c0192d8ff3daa2bfd0a1bc684cb112aecca48072a48e33ce3f4ae87595b43294637d4f2e93c316f782e6d7ec09223a0085adc0ebd48c62b9dd53e19dce968e74b8f6ab3a92ccbc8eb915ecd65e1cb69e28a60e4b32b6d1824e47f4aa379e1cb829147e5ab12e709ceecf6e3d2ae15a6dd90e35250774796d8d8ea16444d04801230d3306dabf8679ad1bcf115fa45003a4dd2e50b3c4ee46fed9e303bf02ba5d42c1d2556d4ac1f6ab9dc5976ae4038e95caeaef3ca8f32c3344aa0bbabc9feb08200233ec4fe75d50af34ecceb8636496a88acb53974f2ec5e585d9472bcb7b0fae3f9559bcf1bde4f6a74e12ca51222d1a331c31feee3dea8c3e2182e6e4810796cd8c2b2e58903a8f5356b48bcd3256692ef4a2815c832ab6e2a7079231f2fd3deb575651572eae3fda24a3132ee5ef75bb4310864c90b90a849cf523d07afe2691fc13797f3f97791610c60ed00b1503b1c6303fad75515ec36f08fb3691338640c760c6f03806b4acacae2fade31046ca412ec89195f971d09cf3f4ac6789bc19c952bd67a1c35878560d3de31a7a6f291b3aedc924138e73df35dbf827466b7585e3b642ee32cc0018e79cd5fd27c3512da998a3c624e6360b92149c115bba6e97a7c16280216c29c008416e79c7bd714a7ce8e394e52d1a08ec6c6504442404484ec180a140e48e3b5401e58a75bb7663133615633c1420ed639e9920d4f7205e43fe852343e5b62242b90d8f5c739fd2aa5ecb18b52f1bed77387f346159ba647d3358b4de868a0e3a32bea6b6c38f3b63a104edfef6011f8726b82d6656499f2333125014e381df9efcd75dae0730841396fba5991c67e51f4ae27c4f3a4cd2b333c4b92d1cc46482319e9eb5d34a12ba382a3941b473ba86a13b6eb8656571208d18a824b7653e84f3cfb573d717934d71e64522aa976577953eeb7707dc7183ef56b54bacbf9d1c8e448089149db9cf7ac9bfbd0903a216ca618aca87e7519e9cf2467afbf39af72852bc0f3eb54b45991aedd42d721271b84b2624200070be9efcd7aefec1fe10bbf157ed7be08d2ac5c20d32f1b58bd594fde861898e38efc8c57895c5ec33dff9970c24f28ef895b83cfad7d49ff049ad346b1fb535e6a062576b4f09dc38983648dccb1fe1d715f579052b5757f3fc99f239ad57ec26d1fa6d6bb845b5b1d7900f43e953236463d2990a6232c4004b1271dea445006477afac3e0bc85a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a65caeeb775c6723900d3e9b2e3cb39200f5343bdb40d7a1f8bdfb68780f50f859fb48f8cbc2b1e9525a5ba6b12dd69a91c8bb1ad643bd447c12ab86dd8249c93cd79359eb104e00cb18d5be6909c163e983c8e6bebeff82bff00866d2c7f695d3750366f0aea1e13594dca467f7922cccbb89cfde18c74c63031debe3ed52287ce37915934a5718656da64c0e430efce3a62be333ba6a18b518f6bb3f42cb672a9848cd3d523b3f0dea3286df32c990a158467231df8f5c5748d711dd492b4081b60f342b7de236e071eb9af31d0b5e8e1d93c936d4dde632e4e41e8413e95de69baac37523db2af96b3c01bcc0fca276ed9ebc7e35f3f5123e9b095672a6ae757a76a735bd824ad90e642a415c646547afa135d8e8ba95b958d64919f61dc50f4c7ae4579c5a5d2bed82e23df17cfb583127247a7d40aeab40be89e08a1cc91e06190f2c47d2bc4c4c5b91ead29b6ae8f4dd36eadef218e713aacb220da79e383bab592d163dd70c2308efbe3f23a679c92093db15c46957cb716a5e2956171231f98ed280f247f4adfd26f3fd1639487f986136bfdfc85ce335c528d99df4eaa6b53a6b5b8b6970d7054b20dcbb5719c771566caf229a4296ec46e700e09ddcf7e78ac0b4d5a58a217123aa609500c79217bf7ab5637a6f267bbb3674887058a60f4352f7b0e534d9d05adaa47769b25601171f37723d318ebf956bdac7a6ce05b332ca07ccd295e636f4c8ebd6a858dc797a72b4ac0e179901c06520121bae7f4a9ae351b3b407ecc11d7cac2ec7076a9c6456d0f74495d106afe13d1af9c4370ae0364202f90ddf763fcf5ae435df01d8b4cdbe05bc7618b6891b685407e627d4d6f7f6ccb35e298272415da4ba1caa923383d3b54c9637292070836c8a544878da4a1ce3d39cfe544a526f43ae9c146cd9e7d63f0ef4c87547b7d620490dc22496e91be1e33ce467f2fccd74169e0bd2648d60d425768c291e59b601739ee46093ee6bab5d04c96c6ea7b584bb26e578c6595b6e07e1c0ac6d5ede659a386d83a99212000c47394604f3e86a5ca695d9bbe4945d89f4df07690a8ad633a46b0e101277724f423b0aaf6fe1cfb19911edbca79067700417ce4f19278e2a28aeaec48e627650922b3293c3907a54faf6b372d7a9a83c0778501943e42e01e9f9d28d44dea70558cba15aed1e18d115832a006408c02af3c0fceab4fa8b596e818c90b2a852d8c85c9ea287beb27b816f246bb5a22f209090324d57bab2794c2b74fe640ca4f0f9271d33ed532bb7ee98c60fa963edc815e5822913e50bb8a70dcf5ebdf355351bf84460c6ac23552cce0863d33ca91e80d54d5e6b2b7b1947dae6597cb578c827e460c0f1edc0acfbbd6209a33345aaef9edd1519638b2d80a3ef7e5fceba292e55764f34a377220d5f50b68ede62edbcbdbb942060ee181d3d2bcf75fd5b7b6e914b9fb8f0097681c75e7bd6e78875b88a9336a310768f1d7e6edd7d2b85d6b5086f2eda3578d90b0662bc966e9cfb57a3494a4af63ccab563ed352acc9e740ed3c843b282913f18e4f7efdba573bacdf857f2372c2304075258b3761c9e9d735adab6a3069c4b97648a380803afcd918ebf53fa5707e27d5a7b84109904970b29084ae001c7a77af5a95a34cf17115b9db512ccf70f751882d277f301c4cc2dfafa8cfa57d8fff0004734864fda07c4d79045e58ff008435136f6ff8fc8f271dabe37b1b56b70b261880bb83c849e7baf18ebfd2bec5ff00823e5cc6dfb486bd6a27dcade0dca98d7038ba8db07dc118fc6be9b236bda27ea7cf664bfd82a3f4fcd1fa51131688671d2a45e83e950c4085e4fb5491b13907b57d43dcf85ba6efdc75145148614514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145147d2800a6cc330b8c7f09a591b6217e3819e6b99f1f7c52f07fc35d0a6f1178d3c53a7e9d6d1a039bb9b1ee70172cc71d001d695d586936f43e19ff0082d7e9ff0064d7bc03e218224333dbdec3be47c055508dcfb6587e75f0b2ab5cb2c33b2a18df05946465c64e4fd7a57d19ff000537fdad3c09fb5278f3c2ba47c3f92f7fb1bc3d1dd66fe7b26864bbb99fcb53198db958d1630771ea5857cf5140d74923359a654abb9e990a1ba0fc2be533ca94a75d38f43eff00284e9e05296e73777349a7bb4a479409643197e320e73d3a62baaf0c7899e77675bc749044c1098836e0acb819f4eb59ba969d1dd159c05f37ecfce5339ddc8fc715cccd7fa868776d2c91e63036947720a966193c57cf49c1bb9edc252a503dd74ad62398a5ccf70c43c6b9d918e1b3dab5da54b29bed124acced82b2b9c63eb5e59e0ff14ee11d846629141044cac79f51f966bb6b3d463b8590c48244c105e6e0818ed5c388c3d2abef2dcefc3622adaccf42d17c5490cc9686ec21db9251812e4fe1d2b763d76e5eeb1332b46ab98981e54e06781f4af37d16f61b5f227f351d89c238930547a138ae923d5e6496329ced7cb3c5703280f63c739af36ad092573d085657b1da1d7964905a24e25880dee4295c1f4cd6b697adb35a6d8d06d0c0aaae46477c8ef5c75af882e23bd8e2d45bcc5b89570200000a3b91ebef5b3a36ad3c904e925c3bcad1f9b0968c10a84e146477f5f5af3e7192773aa2eef73b0835bbc59a2b09678b6ce33b5538000efcd5a8a75702505764e488cab6dc63b571df6fd4f48469d149223045c29ced27a8c7a56d69f7c754811df31a8c48ccefc17c1c103b0c9e9446526f63aa0ae8eab45b49af13c8963202c98dcb8518c11d79cd74b0695e6bf993c80a264ac60f1924f3d3fda35ccf84ef6cec2e9a1ca92ed96727b9031824e3ae6ba6b4d7ee62686d5a625de405b66d20ae7180074ebfa57a14e31e5bb2aab9f2e84f7da46c47b79220636876c7b24c367f2fad65dee881425db58468c84f058e791ffd6ad04d76092f9a27676008772ebf74fcc302b32e7c4e5678e2841669a30599ba03f37e9c74ac66a327a1149d63075cb25b49bc86b761bb69381c30dc32335912a0b6b997cecb28667d8a7705ec38edc55fd76f6669c5d7981b746ec486fe1c118c7d6b96bbd6e389e41132e66910386cab0c8c027fd9cd612872ec74c92f66ee55d5e77ba9a355330556218860bbbd871c55c92f63b6104335d4fb880bb15810a3b64e2b2efda195a59f2638d480e76f1230383b79e3d6a86a377756fa2cb690dc2a177262699b76d51cd6b4e8c9bb9e6559493d0d1d7aea0d4adaf34ebcf29674c189d66c9c67d2b92d4b5b305f916e1dd6645593cb183b88c75f4e2a3bff001284bf592596279997cb5902e573819c8ae6359f1094d45228f2eb1b93923a1c1ff0aeea34f999c72ab24f50bfd4e52cd73760a04c2480a807009e49fcab2754bab7b35091c70ee68c48f217eac73d3d38c54b7b76b35acb2485515e10ae51bef0c679cf7c93cd70be2df10493c2ff0067ba10f3952e7efe3038ff003debd8a30a6a16b1e4622ade5a0cf17f88cbdbbcbe7222a9f9875ae7f4c5975dbc7d4c1ca9fde8e71f28fbc3f955775d4bc49a918a33be2690a80a3e5c003963dbad74fa5e9d65633c5669704600595a1c14fa0cf4ad572ec714746ee5c89e34b12eb6eecd2a0dc1181118ecd8afa2ff00e0927e2c8b44fdaddb451398ceade18ba8218180f9cc6cb2e78e84e3d2be78b9b7679b741192eaa5429946e0bf876aabe1bf12eb5f0ffc5d63e32f07ebb7363a9d84c255d42c25f2e68ca9ce03f3c76230411dabd9ca3114e9565cdb1c98ea3cd829c7ba3f76ad261708cd1488c33c15f5ee3f3ab08bb7f1afce3f803ff0546f8d457ec9e354d275b8ad8c6af792c4639a55eeceea76ee0bcf0a335f51fc31ff008281fc16f88773fd9b7ba93e9578d26d8e1b888bc6e3380e245e003ef835f5f19c66ae99f9fcf095e968d5fd0f7aa2a9699ad58eb569f6ed2750b7b8849f9648640c3f4ab36f379ca5b703838e2adab339de8ecf724a28a2900514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051452312149071c753400b55aff0052b6d3ec25d42eaea3862890b4934cc15514752734dd4350834db19afb50ba58a28e2691ddb808a064926be20fdb07f6aabbf1edddcf83fc3d7d241a74080e213cdc479e58e386cf74eab53392846ecd68d29559687a2fed01fb7fdaf87e29b44f856124908263d52e23055d7a6e897b807a93f957c6df173e28788fe26dfcfaff008d75a9e7b9b91992ee497a01c0000e00fa560f883c46964ad7e4b1472c593cc24b9231823b0ce38e95cadceb135b5bad95edb2e5308c64988db2b0242fd2bc6c462253d19ed51a14e93bc51e59abde97d5089a61ba39d846e9cb4986fe238e33dc8c6702b77468aee0bbd9347be29a3568e4de09241ce07e19ae46eefa63ae5cdb283205958bc7190a1467e639fe2e79aeb3c3725a4eaf1c89e646b1af961e40778c83b80ed5f2b8b5255773eb72ee6ab0d4b73a697288d6de3756767dd15c47ca9cf1cf71e9593e20f0e8934b78e60a2453ba45518fa67d6ba8fb3dd5bd988ef205ded26620dc1319238fa83ce7da96fec0179611144de5a7eeda46e243dc1f5c572f29ecba3cd0b1e5cf71a8f871a2591d55641989a21f70fa9f5aed346f158798c11dfbb0da1e2321e40c61867bf3d07e14cd6bc1a9aa699f6ab8211da2724460602a824e3d0e0571ba8437fa4df86922db10b8552ce7ef9d995231f771c7e359b5631718d27a1ed3a25dadd5bcb6e6e305630e8254da5bb9e3b56be8baa4573097810b8202c8dca15f723bd79b7857c6133de096e24f35f037484f240e9cd7716daa45aa7faa9df6330dec46dc7a802b39d2ba3aa9d4528ebb9d1db5ea89b78b97386555703e56adbd1b5fba8037d9eda5452f848d4f181d49f6f415c409ef22786068c9b77936aa9c9047af1d08ad4d3b58569165891d012c8217561951d7e63d335c72a50bec6f45b8c93b9ea3a7dfff006ae9e8b14721933fbd1180327b7e1576cd6e6c74bb837f1879644cf941b9550cbd076e715c2e97e2a8ada34bcb5814a95128903704671b71ea3d6b7adfc4570b1cf1c520631b16937c99e0e318ae6ad0b6c8f529d64ba9dae8bae4167a7c0d7328323978ca05079439fc0fcdd7dab422f1198ef9a12af1b28496dd810481ce73fa579fe877ef04915e5cbc837922340a1b19fe3e7e9fa8ad14d5567bb5be84a48f1210509cb381df1d8572f3492b23a63515ced21d660855ee12790b4cb9011b2721ba91e9c9a5fb79697c9596457c2ac659c7279c03f99ae5f52f13430e9c5e22bbd60536f186e8c4f2a7d7ff00ad4d5f115ba40d3da469f68947cfb9f3b063271ef9a94a4dd8752bba7a9afafebf133e562dc89c48c38db91d07a1c11f9573f733dbcd20bc685d9a68983ca8403b47007e154f5ff1179174b6b1bc6c08f31a442483f311823fcf6ac2d5f5f8565593ed2a215560363753d707d2bb69e1e3cb7670d6c6ce5a234354bc8a3b7122aba968c28f46607f4e3bd72dad78826d2ace79afe2745cec4666041cfbf7aa3ad789ee6289ae2dae015619f2777caff8d72b7dad5d5d23ca9f6167f34ee8a790800607207722b4a716de88f36b62a76b32febbe27fb44c2d614e3e5dce9d49efb71d38acdbabc9ee2da4769548120d98fbcabfed03eb9e29d0cb790c42ecc0aa11789224c823fbc31583ad6ad14774ce544be67de668c8240ebc9aeec341c5dec79f52ad46b717c51e237684d958c2910db99011c950060fe35c36a334fae5d22c4ec37300c42e5554f6c7af156b53d66f75fb99e55908119d91286cec507a9f5addf0b6986cb66f895879adb3e5ff0059c0c1fa75e2ba2739232f652ad1b0ef0bf87d207996785a4889ceecedc356a1962b41e500c1148c05881553cfad69585a5f4d06e36d12059834af23606d19e063ea2ac5d68b34731b7cc12b3461ca7382dcfcbf97f2a9551b67453c2a8ee73d7a82060d24819a6c88329b58f73c8ed5cfeb31cb6f089e3840cce84247264fcdd01fd6bb5960b5ff008f9455f97e485b9219bf89067a1e0735c778c8aa4acd218a1964930ac4160b9f6f63815d586725239b194f9534cea7e1da466c12581a58659e764894af0841f98376208f5aea6ca4b8935782da48443e64d863e79fdda8fba4818ce3a0af3cf867ad5afd96fed5a791922b8dfbc391f20239fae7bfa715d9699a95a41a836af2c90ca1d59a485c90ec09e306beb285594209a3e33992ad26f43de3e02fed29f12fe0ceb7e4e8b3dd4b672485dade66f322e383904f076f2bebd2beff00f827f1bbc3ff0017bc351eaba75c451dd7961e7b2dc37a8c75c0fd4763c57e55786ee6f8de5c473ea233750068f71caa60f0303a91d41ed5e9ff0006fe30788be11f8861f11e937de4b5b4c3cddaa596e090072a3920b6371e80316ed5e852c5bb7be70e2682aaaf14afdcfd418e4f301208c678c1a7572ff09be25693f13fc1169e30d31a30278d7ed50ab65a09b037a30ec413dfb60d74ea49c823a1c7d6bb4f25c5a76168a28a041451450014514500145145001451450014514500145145001451450014514500145145001451450014d9543c4c87a1520f38a75437f32dbd9cb3c9214548d99d87600649a012bbb1f3afede1f1da6f04f86d3c03a65d08a7d4e079ae678e705e1854ed2368eb91ce2be1bd49acae2dee2e6eae42dbdc488d6fe5e7e476fbcf8fe12ddcf7af47fda2be245f7c51f8abab7886da7dd04f7e52d1fcddf19b7f2f6c58c7dd2572e7d49e6bcb754747cdba6a8b3431ae2ed160237007ee8c77f7af171356752ab8f63e8a850853c3ebb9cb78b356584989a69618f1868d71f30f53ebdab99f1b6bf756da5a8b8b072125592e3cc8c317c743f5addf112e9d35d4d2c967feb7725aed7ce48c6339e95e47fb4478c2ff00c33a2ae9716f6b9bd976c063906403fc5c7602b9d47dd7735a31729591c9787f575bed5a5be1334718bb94c72ab92482dc823eb5e9da248d79047730170473248211b401ce001c8fc3d6bc9fe1f59f936f0aedce1c89580e589e7ccfcf0315ebbe1376565b675114a8a584a8c43300a4f007d2be771feeb3eb72a8e963a9b1b1b5d6add7edd284c0124522b96fc0e7a7352ff66ddfda9ac6e66811635f34b7ca037fbac7d7d29be1fb88918ed7c853e63b3459600a91b79ebc915d447a4596bda6a88c2c776b1e500057660e7a74e4706bc95524db47d14295d1cd5d68d15cda19fec89855dc58824609c638e2b92f1878323bf796fe078c8dc123210000019e9ebef5e971e932dda4b697b6ca92c32e23087861b49e0ff17d0d67eb1a1dd4b26c934fc249867518c13fd2aa3515f526a51872bba3c545aea1e1db98fcf771031fdda96f4eb9ae93c31e334126efde3b840c99e46738addf11f87eca3b478d6ce2531ef2bb86e6e9d81ae3751d1b50d29a3b9b589a2572140c7180323f5ad5ce2cf3e54e317a1dfc1e2182eef516699963790ac8acbd0e3b7f779f4ad781b7b1f2c004ab02a9216ca8f427ee9f7af30d335dbbb689e3bc2f1ce64ca33636f3c13ffd6ae9748f12c969786d92e1e590c5b9a54fbaa3bf1d2b2715266b0ecd9d947ab0b698978976c830b02b63cb3c76fc2b6f46d5ad16e5a7cbe58e64471c1edd7eb8e2b9a82fe1b995275d85902b2958c166f52456ba5fc441669a3d8cc5e2c21dc071827b1e3757354494ad637838a4f95ec74967e23b695123693cc2b232b132100303d87b83d3a7153dd6bf616124a12f6585518156246ec1041191db9fd2b9682fad5e7554b60a8ec7748578d983b5b1fe739a9ef534aba706c844aca115e266da809c939c7a806a1d382e86b0a952c695df8b5639560b2bdb6bbc00a40c863dc1cff9eb5241e22ba5b80634dae1090e3a291ce0fad61c3696f25ac657e511ae1f6a0ddbb7724fa70462a6960448fcd8de4640d8396c6ef980c71f5aa8d28b7b054ab2934891f5eb948a1b85b931c3fde763ecb8f7e83f5acdd699444f757b76f913030aa11b5811dc0ebf8d4b73704bc905ddc47080591559321b0323a551966d3541c4487322fcc2439c91d71e9ed5bc2169791cb52ed58a37f15d6b6e89713c688ac4c621ca7ca141c617be4f5aa57d6b6f69125c4f11d920dcd93ca8270319ea7d696ff561a634cd1ccb0b24fb4445c82cb8e1b23af38e2b9cf10789fcf717173048cc4fdfc8daa0f7f6ae9a70a708b671b8c6fb977c43e278ed609634b7b88e388050ac719f7e3b7b5717a9ea33deb4cd0890868c6d8a224b124f51e98ab4f6579e22468e092474770af289b3b947415bda2784910a223324caaea5b1f3150b9c2f6cfb9a4ea112a729ab222f07784a08a379e65558d4aab971f339eb835d9691a04335e09eea78a228dbd23e7e6cfa7a0e071ef57740f0e96819a1820c856212e9ff00784e70a0f63d3ad6de8be1f90616d220cedb7cc45c3056e770c9fc2b9a75353d2c3d07186a528b4c9d6d8d91b5658e690f96480df375ce7b0c81c7bd2ea735b49208ec98ab4b26e63b72632df77f415b37082d83416f6b3460921db2369c73927b6081d3ae4d32eb45b7d2e3795254769036e703b03818cf5e075ff1a8f6897537e4306ff4f558becd0c270a48cefdaaef8278c7427d6bccfc716aaaaec8f2c8660ab8c7439c9c1ef820735ea1748cf70d6714b2659329bd32a7e53ebd0d703e2e5f32d22dfbbf74e0048baf43d057650a9ef2679b98c34d0f32f07789750d3fc597fe1d32388ee6d8a2bb3e33b4ee247f2af4ff000d789e1bd8218ee63999bcc56799480a176e02e2bc5fc41a7a4fad3c46ea452595a27425648dc9e9c751ed5b7f0575ff0010eb1e3f8bc17a8c8858c2658a46001958119181d38afaba13e6a699f0f89a7fbc6d1f477842192e6ea05802069e36f2412572067afad74b6097377642e6ef2c822290c3b8ec5218ee2d8e4e73823a15c0accd0709a559de5c33c6eadb62907f70f71f43c56ddae9da912b1dadeb466dd99a3982f321c6718f4af4211725a1c5cc8fa57fe09f3f17e5f0a6beff000cf5cb89a68358f9b4f9db0409c0f994f73950319ef81debed3b4699a3633edcef3f76bf2af4bf10dce8d7abab697733dbde432c33472c5f2bc722b2e0a9fa9c9fa0f415fa53f01fe2345f167e13e85f11239632faad84735ca4392914fb4092204f5d8e1909f5535e9519f34753cec6d3e49dd1d8514515b1c41451450014514500145145001451450014514500145145001451450014514500145141ce38a0028a6e5c75a64b24ab1b346bb9829dabc727d29d857487cc76c4cc1f6e14fcc7b7bd713fb4278d5fe1f7c13f1578b9a460f63a35c347b30082ca42e3df2699f16be39782be0bf86dfc5bf1035b482c0a9487cb52ef72f8e0468aa7249e32582fa91d6bf3f3f682fdbefe237ed1be28d5fe16dd69169a27832278de0854ff00a4dd142193cf984857920e238d4673824d6352a463167461e954a924d238fb78221611cb7134f6b2c3691c6551151662a46d0d8ef85033d7afa9a64faacb7d12ea16762d0dbeedcee621938ea07726aa6877173796665bec14598c6f24c085e3f887d6aedac0673259c8b21557cc8dd55872b851d07af15e43eecf6936dbe638cf1f698f05989258962898cdb5cc27765972bce78e4d7ceff176d64d5b5fb062e18595935b4ca101c317c07cf5e82be9ed6b4fb8681ec21b1824576f9f20b371fef640e9dabc13e2df854e87e298931b23bb60c8ccfd4eefbb8ae4aee495d1df80e57277391d056e2d2458ad901662003dabd3fc349e618e657019703cce857d79fcc7e35e79a75ac8d72bb172627619271e61c0e3f535e81e1244dd19121f9396503dbf5af9dc54b9a7667d6e5a945dceeb4c123db10ce9119413bf3f7883c7e95d1e90f2ddc7114b952c3860a0e48ac2b3b48ee74fb69448db59f11c68bf3b73cd743e1fb798bc5e53b2bc863dc0f0c7ae71dbb57cfd4a8e1559f4d4a2a48dcb1b4b3d58017368a01908f941057e5232074e9597ad7866fb48bd0562125ac983148ec4150393fa56f583c96f2cb13c3292cbb91830383b873f957456a9f6eb7686e63475f2c6f288181fcfa7e14e35afa8a74f53c9eefc2f2df8924d8aea5ff7663404907835cf6b1e1cb39a28d258a79101065578f8ddb49fc2bd9354f872e8cda9e812194aaee36e24da571dfd80ea6b93d434b69a54b295cac8ae1e4120214ffba7bd6caaa68ca7878b5b1e33ae784ad5e7df6d1101ba44324afbd66be9b7169733fd8249498d14b9ecc33d2bd8756f0d3add7957fa72c4d29211e36ce4573d71e1606ce48cecf330aa5e36e0924f273f855c66a479f528272d1338b83c5135a5f35a49118b749801396098e466b6b4cf19b23180dd3c8218916d93233df839ebd4f5a96e3c3025baf25d50c8ee01942827a7278accbdf045e279b6f16edce46cc47c955ead93e99fd6b68ca3d09f633a09f666ec3e3168e72caa42a1559632a4ed183cfd39fd6af4de22b336e86148bcd0f950c49caed61920f07afeb5c45ce95e24b54dc5e6dbc0897b49ec69f0b6b42e12592c44803038472557b633f539fc29b93b0466d6877567ad4ef0497297919dcc4be40397c60647e03fc9a77fc261a7cb1cb0cc7f7f866409c281c119c7b835e7ed757a81e7855b97db2019e76b0e076193839f6f7a511ea70b8b45b1946d70a1829918a90dd48206393429e9609395ee75971e2d9559da68f70084a9490e082a4919efcd739acf8b24579268220f2b2a804606063a7bd558349d6a599259216587794123fca3ee9e319ab9a7f82def5a2678a501c95908504640ea49e831e953ccaf631929cfa19da96b37d793c89690484c784937ed211b70f9727afae6a4d3bc2773ab5e4b33c043346022b38dad839391d3bd753a1f84ecd94c771681544ff348c49127af43d6ba7d2fc2b6766b2410dba34c5488c28270dd73cffb38a6ea2e5e53a2183528dd9cfe87e1cd3ee23482d2d238d42820a20ff583ef74f6c5743a4e930b964d9b46ff00901841c9c807f99ad5d13c2534423ba10ac68a8731ae0658d6dd9694d68ab05c3a43772a6d87043632723dbb77ac272e58dd9dd470b4a1ab2a7fc23ebe779262412b12c415180371c91e956f4dd2aeae73a6e9c53cb27724a46d2b83cf23ef75efe95afa4f84f53d5d63bc10bc56982cd2193717c1f9871c8c9ffeb56b6a7047a058a4da6c7b63dea2497c8dc554f41cfd0d71ceb291d518424f9628e52fb4786dacf517b972f18701a6cf3c70401d3bff002a882cdab2c7766c8aaabb280d2676a707ee9e0673dbd2babd52d64d4619a3b88119264ca130ed5eab9fa13c5626a1a649696ca905a618919472159c64e7f90c566da7b6e65522a3a1c56b76ad753b9791b9948fdd2b0d8a38ed5c2f8d20586d14db313b25c45220e48039ce7eb5e99ab4474f57bd924914c92054b767f9c1ff00680e95c1f8a2c523413dc895e4cb168e3e7613d33ed5ea615bb25d4f1f1928deef63c47c4d03c5ac35c44f9fde803745ca9dc40391c9aea7e0378306a1e3bb9f19c415a2d3edcc56d31180588f9c927a9cd53f1768b7da8ea30e9fa4da492df5dce05aa5abe43303b8f5ebc66bddbc0de0ad3bc1da0c16705ac7238412181a4e5a473f3ee1df9fc2bec3074e7c8933e271efd9cdd8d8b486486d6d04efe65aaa70f19e0851bb031f5c56e5e5d6ab67387d3e06552a246f342e007418c13d3d315462962b197fb385a461065e5b34046ce7819ea17dc537524b92905d5edd1798307b88632581018ed55ec4015e8d38ce33b1e17b593972b2f6a2805bc37244ccb315088e010c4e3760f6fba3f2afb3ff00e098fe369fc47f07f5bf0bbea8a468de20963b2b7e37430bc51382abd02990ca7dcee35f126a9335c32c114e423361176b0f2cfdecf1c0e4d7a0fec93fb51693fb30f8d755d57c5f65e7e95aad9471ea1f6327ed10792eee2545030ff2bc994e0b6060d76d197b3f88313172a56ea7e9944fe626fcf07040f4e29d5e23f06ff6edfd9c7e308822f0cfc428aca7b82c0d8eb36cf6b2c2e8ab947dff0020241183bfdb19073ec361a8c57d18bbb5bc12c2df764cfcaddf2a42e1873d4123f5aed4d4968797677b58bb453627debbb07af718a75310514514005145140051451400514514005145140051451400514dcb8e4d32498c68ce5b1852724502baea4b48e58212a39c715427d5e3b2b39aeef2ee28d238f7b4921c2c631d58f000fad7cf3f1dbfe0a4df093e19da5de93e0564f176b51c8628ed6c6e3c9b50c080dbee995a3c8c9f96312371d3342f334a74ea55f815fd0fa39eeb6233ca4a003259b1803bf35f3e7c69ff0082887c16f86067d17c2baa7fc265ac22329b2d02e2296381d5981f3a756d91fdd3f22ef9173b9d1579af8cfe33fed7ff001b3e38eb17235df165d59e937195b6d0f4a93cab4b742bb31bd91249f2572c49c6246c2f000f26d0359b5beb8fb35b5d34d6f312b7336d60f0ba1180a7af61f5ef9e6b96ad7d5a89df0c143799dbfed0ff001a3c73f1cfc4f7be2cf1dfd956f245482da2818a47696e8e7f770a750438c3484e4efcfa57137d6c9a76a76173656603dcc0ab2b230f9b2a4f2dd4f24f14f5b759b4e092983cb3360879b0c31c02e0e73c01cf5efd698213e23f0ab69b14486e34f72f01827c9c81f29e064fd2bcfbd4a9ac99db4ea460ad63a7f0b6bb3c917d9efe44f2d4056590f520f1c74ae91ed4c1a8b5c59c33496b7ee64b410bf29b571b413d3eb5e6fa67885833dd5dc2630b1f972e63e49f5e7a577da35bdc5f4904115d3232c5b930731853d7349c5d8647a859cb7444c976171208f6120b6ef46c5705f1abc07a4f8ab4378ae2f556fa1292dace6200960a4e14018ea2bd1668ae56fee21291a6e713091a3c091075031c557167fda375345a73a81344228e29d14ba9c63396070319e4573d5e571b247550a8a9bb9f2cda47e70592f144532b624c6731c838231d3e61cd767e1e8204badaf39f28c2181c6391cf6fcaac7c5bf8717de0af142eb96d0a496974eb1ce3703fbc1d091db8cd4da2b446443b006519521782be95f2b8a4e155a67d6e553f6b668ed3c3b7436c66dca2bf97e6e7af963d05751606564dde5ab9f2c18e4eea474ff3ef5cb7867cb8d4472cc23e7870a3853dabacd14ce185b244e54b1f2d828c600c91f90af9caa9baaddcfada3b1b7a6da4b398831f2e5d9cae7ef0279fa715d3e871acf22d93ca2247621511082368c8e7a1e477ac2b082de56533cb26d700abedfbbcfddad8d26d6e6459648d9a411b92aacc40c639ae794da7a1dea95a3736a0d16f25b89105e44a0baab3f9672467f2c7ad1acf85adfc4a4c5776b0c528809122c4701470005c81efeb56b4d6867b587ca85dbcd56f3144c46d5039efff00d7f4ad0362f791795148b2a3725d8ed38e98c375fc2b7854d05cb33ccf5af86dabd8dca5d4b68ed1b2ed898c7c01dcf535cbea3e15109066d389577c156f95801df03823debdd66d152513dbc32b891d0a2215015f0dc0cf6e3d2b3757f0a5b4e1d6fb4c9e50f088e29a14cb2b60e4fa6056d4e4de861386bb1e233f84add2388d9e9e464b05984a01527f9fd2aa4ba2c56928b5bc9ee9d62f990a28393e99c74e7f4af501f0c6de058d6d7548de0f2b74b184dcc1b9cb60fa7f5acc8bc1b7b03c92c4f00548c15b67393839cb007a93c7d2bad2715ab39274e726d496879bc9e14d4dd05b436fb4f9b8dece0921813c03c76aab77e0e63622db4d8903239fdd488c1d8e08246382793ed5e971e8f269aad3cd6f22900bc61e304b8f5e9c633fad4074eb6b8b8fb15ac444ed1b148f73753cf5cf1ffd6a4ea5b432faac3a1e68fe0a856cc5f344ce8916d0d130f9fd997d69d078534c360b3b5dbacab1feeadd485f9f3dc01e99af433e1a82de507ed2a032ae5d93ab77e3a66a75d2f478d85e236c9964e5d947a752140c0feb42936c4a838bb9e79a478374f86c5bcd88382dba4ddc31278c0c01cf7fc2ade9da3fd96e0c5f60916288f0d2239ddf8283fad77977691dfaed13b12bf308e58c832f6c2e3ffd752c1a05eec536fa3bae130a92be08ff00beb3bbe839ac2736a56348c5a7b1cd5b68169716526a3359ac6aaa7cb3f30dcdc760ab5b5a569f034e35213c7133aa89014272db71dfa715ada6f85ef8ca86e6e62841ce1446a809f43c66ba7d1fc204c335dcee59cdc306458d5a3555e87b11e95cf294f9b729c64d1cce9fe189af6116fa080cfbc93e62e473e99ae8741f86969a2b7f69ea121f3d5770f9436c71d08cf5ea783c56fd9a5bd9411359d931c64b1f2f0add860e49cd5ab6d37cc64376e59998b2ac6fdbb86cd673a8dab5cd62b431b4dd2a10f259da931a29d88fc22e4f3938ebc9fd6a3d474db4823dd702377c94449be74761d5d7e991edcd7457b6902ab97cc70caf92c103367b0c7bd666a5a6c4b706198ac73ed01a12a76843d307b138e7e958dd9b52494d1837b059456823b7990e2260c3cbc02f9041fd2b96d7c1b468ae951663145b9f7b124723fc4d7577aa8373dcc614265628d01c71d073591a85a491c92bca91c8c6205bca5c95f6c74a2f27b1cb5dda6719ad5bdb45299231be566627e6c900904124f5c0c8fc6b8df17410c36ec634fdd4b33485cbf45dbf749f63fcebd0358b5df0cbb4a6ec6e28a9f391d4839f52074f4ae2f53d09fc59a94ba45a9992d1181bd9e38c1daae4120fbf1dabddcba12a96b1e06613504ee73bf0e7e1f5e49a9378e350b56768257165040bc28231bb391838af4bd3e0b6b48a3465559a32bb95e219dbe99e4f5efd69b6da5dc8b18ada2311b7843ae228c07d8a463ae7a818ad7d31ad62bb8bed10c702caaac8258b9652082bc7f157e8386872d157dcfcef172a93aadb664b590bbd5a7935069248e48be6bb46236a673b78f7ad4bcbc80dac924e62b34b351b02a92cc76f03e98a822d3e6b89a38adfce16b1a99442f1e36f27209efebcd4b2dca5cd9cd243690b3bf0a8d36772f4cfd6bb39528dce3717b9ced94ef7768d35dc9346d2ccbbd06ef9973d7ad65ea77f9bbbf86de468a09e072089301f68c0257192473cf4e4fbd6adedecfa3c92496714973293e5b228dca14ae148e4746358babddd95934f0d95dc91c5145249bdd0ee2ac87e507278dc0d24ee52a979a395f0ddd79692dd7976f22ec0ce27915811927a6071924e0f5249ef5ea3f077f6a9f8cdf0be19343f0178e6e74fb7122bc71db3660491980c7972a342410b8238623182b806bc934fb88edf424fb6d817fb4a2c4d2988e572376ee3ebfad32d2e2d1ee21b8dec1baec8587cbb4f190dea455c27283d0b6a9cf467e8efc04ff829ef86bc4c9068bf1af469b49be77669354b2b22968158e537c45e492301480705f18cb6d0457d3be1ff001a689e2db14d67c2dadda5fd9c80797716728991b3ee84e3eb922bf16b45d5aebed25aeee432a12d1c72ca54440f65feefe181cd7a47c1cf8e9f127e115e3eafe00f136a1a58bab8c4f6f6e1654b838c82c8c0865e39e413eb5d2abd3e5eb739aa50835ee1faeb149e6293823071c8fe5ea29d5f23fc18ff0082a4f8135cb8b7f0efc63d317c3d7333f96ba9c170b25a961c33b29f9e0518e9f3e33c915f4e7857c75e1af1ce8d1f883c1fe23b4d4ec665dd0de58dc249138ff79738ad2f757389c6517668dca2a3b791de2df23027279038ff00ebfd6a4041e453105145140051451400514cdcdeb4e2ea2815d0b41e9559e79151b6b9caf4e01fcc76af0df8e5fb7efc13f82f34fe1d6d7ffb6b5d8f728d37495f35124c1c24d2fdd8be8327d3347a97184e7b23dcee6e4c501954f08a4b64ff0080af9aff00687ff8290fc33f85f35e7857e1a84f15f896d2efecd2da42cf0d8c0e065fccba08ca0af1f2aee273dbb7c9df1d3f6cdf8cff00b40c874ad535afec7d3a38438d2741ba9628181fbc93b821dfb8c10a0f715e2b25bd9d921b4f35a28c288c080aaaf5cae4670703a5612c4538bb2d4f46960a0f599ea1f1b7f6aff8ff00f1ab531278bbc7377676310768fc3d6133436a1581041dabbae171c6e73800f4af308f5eb99f719a082cfce95155a23e77f10e718e718cf18e9c62a1bcbcd1911d448fe6b80362441b38ee587273ee69fe1d7bc794a5b5bbbc71ab19249d4208f23a020f03debcba988af53a9d4da87c3eefa0fbbd42316c973696d2491b3942f2422d80dac49217393939f7aa37334ba84115ed8464b2ee65453b03a8fbd9c6391516bb35b4a638db5359671b89dade62aaf7c12bd6ad5a7da2de3b5b2916345986775c0f948f5e3a56916e50d77336d976e638448cad6a24694c7cecdfbb9f6fe94787b5eb5f05f884de2dd9f25e331dd794a4ed27f8f71c8f97d2aadba2e957b8975286e6dce4422372a039e8a0f6e7bd5c9b4fb9fb35bdadc4f1bbc8fbe2b1b78c0455f5627efd5c65148cf964335bb78f4fd7e1d492e03daea44ac89e6e56371d0ffc0abaef0cead67a51b7b76bb36977bf6c8d2c9b92451df6f55c8ee78ae4ad6ca08f4093c25a8ea2affba516371710e0974392491d33d2a5f0deaf0db667ba9184ca04323cb06e520743bbae052e689aa6ee7a2c5ae36af148fa7d886446f2209de5f9a107a820f1b8f6a56637160e8103416edc2861bddb8e7239ea0f7aa5e19952690241e44c42c6ed2c20f968a4f25c0e4ff3ad26b2bcb0d5a1bafeceb7902ee49d6291990a8391918f979358ca37d4e852496a723af6970789748bed1efe35fdfc86612142cc9f403fce2bcef4eb4bed16fdfc3dac44d0cd1a16b5322ed17310c9f317dabdaee209acafa7d45e2234f9dc6ec1004127f701c6715cff008b7c3b6be214964bdd3a6688065867846e755c1c007b0ce38af1b1d878d777b6a7a9966632c2cecde8cc4d1cdb6d17264cf9b1a855240da31fe35d7787d64db0051285ddd51770ddea4d710d05df842e77ea6cb2694228e38af645f9a390f015c7d4e3eb5d77856e64b3436b1cacca5b73309720f1e82be3b1984942abd2c7e8581c5d19d2e64efe5d4ebf498eec25c89664646901cbc64927b74f7ae8f4385f625bddbc6a2439cabe7231ce48e9f8d73ba1cb6c22f2e5bb70d92c833d3208ae992c7ec3048c0afdd7f2828e33c019fcebc5a91aaa5b1efd3a94e705a9ab1dbd8a6e8d5730a212af1c9f329c76f6abf6715f42165369be078c0122481891ef9ce3f0c565c337d9e52b79194511e3cc006d46dbc018f53c569db5e4e2de4b936aab19440ae87a1cf4c7bd5a6e28db9537645db2f3ee563b8f2219b6ca5309718c293cf5e3356e78edbcd12c777756d272b894e47d0638aa5a55d58caf1c335bc4cac49745ecdebc55c0ef64eb0e9ba7bb6f62406391faf7ad2351f2e8673a4d3b95ef3c3568b2c3a85f40d12c00ed74076c80e783b79c9cfe959d369016429637b6f74f691ed892e97ca9031e480c14e47b1fceb7def758b4b679decca26e1be0272cc7b1e7a0fa5235ec1a8941abed32956612da1dac84e3b8ebf4ade95676d4c2519377671926936773137f69466210c4c0c62366009653c3753d0d411f873449af1d2de7680ca03a13fc4070472320f3eb5dc5ed89b697eda9a9cb2c70004c7346448c31ea3191546cf49fed49fedefa49612c724b087b8e02853ce3af522b4552f3396aef748e59fc270a35e5e32c5328daa91ed2bb40ee0f4fff005d25be8da2cea5aef4f548547caea3907df00923ebc576c9a0db0b516f0e9567745fe675372ea1781f5f5fd6a2b7d2e028d75fd92b0cc92fee22100743c11d49e7f1ad2535caec6716efb1c34fa0d846915c40d14acf266ddda4618e3a0040c9f6ad2d3fc37aa6a08b6f64a61955fccfb4dc26f381f780563f2f19e6ba8b6f0dc762d2bb0b695a4e89b50795dce38e3eb4a352482e42ddc90470bfc8141dcd8f5f53f9d73b95f736b4e4b6324f81a1b60b7377009252be6a92e30549e0b0249cfb568dbe87f2b5d5cc51dc65795886d5e7d7d6b496ded6dee3cd92d88f3244732ed03701d06ded9e950de6ad20630c76ccaad101b55723d777d7b56128c6f72e31528b4471685e48b786050db251948c8c46841e0d4504515dca6dae8c61392250c4797c77c0e7a559d31a5bdb8b782494242aacc49420b363b9ff003d689e65863548ad6485092a1ade60781d491f975aca50d6e81251d0abac5fdb40cb3c597b878571e5a928a09200e83a609e7d6b2b53fb3db66deef31e541794c9b8679fc45695e859247b57691959bcc33ce841638e00fa565acf6ade64a626254ec60a99c13d18e7af4350db8abb2dda9c95cc9ba305bdac8d6f72d74c79566c00ad9e08fd6b1f58b78ac27446bc43193206f2b25d09009208f718e73d6b73506778e4b848f2c10a0cc7824e473e95c5f8cbc4d6ba7c0fa6dbcab717925c6d6b58d79321c60961f77bd76e1683af3563cdc64fd9c1d4ec737e21d56f6ed23d1ada00350bb979dcc0f931741939186c7ad695a6956de16d1adffd0e594994e1644059e4feeb633907afe15990e83a45b472ea379aa667bb988b802125c3e391b8f047d315b7697906870451da5b4b7286df28b338640d8eb900106beeb2dcb7d8c1368fcf734cc9d76f95ec3a3b3b26b8b886cdc424404ada984a09d99b71507ae470060d4f0697712c2969736d189639177c72292f1e79e4ee186f4a97589248e5b5826b068819433f9736e65181f77838145d39fed09ac50ef8e51877954b36dc6412700e41afa48c6c8f976e5cda905d5d4d67631e9ff69963965596158bcbe63404e03f2727d3dab9e6b598adb49690441446721cf96aa472464f735bf25b2c61ad6d7524b990c65e33b76f1819cfa9ce6b26ede32b28d4a3d91473a47f30c88c13c30fa7bd7469c9a8183e2091c69d19d2de349ed82953211b54efde7071f3632393e95cf788afa29fc3f7ad1044b6921658d50670c40c608e71b8b1e7d6b6350365a33cb77781248833f95167fd6824ae48ed9c678ae235bba51345a3d998d54b6648564e15324e71eb9247e159dd74461ab77456596e600218ef18f9b6caa99e830a01ebdf8a805bd8ea0cd37dba325d14cd222e0ee52723f2c532774b3b95bb9e3c42859a388b63048c77e71920d5a974f8e0696da092285c5b2167520ac871fcf39a13bb2939324375b259b508c24911503ca0b96f4e33e9d6a687555d3e375b9ba96389611f2139077772bd09fe54dd174fd4e2922312c0ee909792e15c0119efb877069971a37db2c1a4794bcc5bcd2a9c301ea01fe1f4fc69df9656674d3945ad51bb33cbac5a2a33b00d1a1f3173f313ec0e01fa60d6efc3ff008cdf15fe11f88a2baf03f8ab52d266121694db5ced4913fbce8d9590fb1cd79d6997d730662b5b99e532ca59378c6ce7d2ba3b7f17c29677116b73c624501636b9b52c496e98078c55ba95211bc4d572cfdd6b43ed5f827ff055958e44d03e34e82238123cff006ed8a2ef93d19e05e173d720fcdd42d7d4ff000bbe3efc2df8cfa67f69fc36f1ed86aabb80922b59312c2c4676b46c030e3af1f957e3a457f610bcb7b731450c8aab1c72c7c32f1ce17a6d3fad4ba2789bc41e1ad41357f0d6bba869579605a5b6bbd3a568e52c7182a41e3838c74f6ae98d44e3ef1cd5b0949abc3467eddda48d2c02473c927b838e7a7152d7e78fc0aff829c7c53f03cd6fe1df8b16f6bace9f1b3b0b988049fca54036823efb6ec9248ce73cd7d81f077f6aef845f19f4f8e5f0d78a122bb90906c6fc08e55393c119ff00f5d6ee1d9dce09519c373d3a8aadf6f87fe7ee1ffbf828fb7c3ff3f70ffdfc14b9591cac596e23850b4b22a8fe2f9871f89af13f8e9fb7afc0af829bb48bad7ffb5f5731b95d2f48fde32fa6f97ee47f8e6be1bf8c7fb6b7c74f8d0f2d97887c611d9e967e68f47b08da1529eafb3991bfde22bc9def755f3a75b448fcb6050cc13e58fd7703d6b9e788a70db5f43d3a7808fdb7f71eddf1c7f6fcf8d9f1656f347b0d6e0d1b459e65856d348de38c1c979080f26723918af07375a5ba1996f6648d50244db8b6dc760ed9c7e156ae1639a3819aed87ccad24d349b5546fdbf5e0283541ae6c05c948a381208d818e1b45dd24e7d467815c4abd5a9f11d69469af710d37373751ca6f269a58d5833f993b12327b8c618fd734cd4efacaf5ae2dcc302a4215e49e4009523a32e3a9c543a86b0b6eb7934e93817279dd26d6f614ebbbfbd856078744b2b58d8b4b1193e63b4000e7d79ed59ca0a33bc4ca3cc8582deeae6c9a69e78e3889533b28c075fe138eb4c1777912348c27685a655564601586471d38a9ece48ee952fe2b191ae4aae240720e73cecedfd2a48a1b8722dd34d116e99817ba90153f2f6f4a5642949332eface4741f6682e8849333db40d9f2f3d0b1f4a961d36cde78ae6da48c345214992e198ef5239efda9f79716ed6b24b23a192e2402f2e6172bb767dd18ee7d289bc456707da27b6f0f2a5b44646570a4e54a633f9f35abb4be124d1b0b3d267d33c86b4690c616422471bd79fbcbed5b96d3690f199563582648fca82e98968d41ec17fbd5c8693e2ab68a2489da25971f7fc8763b3b0ffeb5740f7916aabf67b07d892150ef3c7b724ff747ad66d3404e65b6998448ef752c8eead249161063a1c7703d2b8eb9bdf10e8fe2c896eaf9e4b1bc9248a198261fcd5fbaa5718c1aefb4fd1bed8ab1a5fc665b473e526ff99ce769217b9cf6a875958eef4b7b7bc96e65ba783fe3e8c61230d838e31c1f7a16e2e6353c173e61fed1b795520808cc96d2e1863fbdfdd15d9da6b1a6df58af98c03dc1693972a54e0f057b03ea6bcafe1beaeeb20b66922599554cdf37219546723be7be6bd0fc397169a9812c71466e1e32f2468fb801fecff7c77dddaadd93b157ee497d63a8bc76f2ed7581cac9340efb81cf180bdfd6aa5d2dce9a248acee9d96dee048aa1c3a2a775238da3eb56a0ba96e649748ba91a59525ff48be823daaa83a28cf19aaf6f65e619ede00b10ce0e09559d7fda2dfc5f4ace508ae9a83d1de256bf834fd46d24bc4ba74844866bdb7921fb4248fd5598606dc7b7a5645b786359d31ee35ed2351b49448434ee06627c8dc1463ee120639f5ae8e3b616925c5e453df3b4922c1710c611832118dc3f8b8e9c0e99a8fc4b736969752a416513da2cb1c4e922b2e5b6e0392e3208cf61dabcfc5e0618983523d4c0636ae0e5783d43c2fe268ef222350b76826e3747e49c460f01777d4f15e816d35e24935a364a9650912c796c3019dc4fe75e63a869d73a858269d73086092116ef34850b719182a79f4e953f87fe236bbe18bd86c7518a69ed924dae5f709a16c63b8f9d6be331b934a9cbdc6cfb7cbf3f8d54a334933d72c985c2149fca58e30db99e3f9b217ef0e7a8ad1b2b0b3811516372ce819d9188571d8fd6b03c2fa841af582dc59dec6ebe533a80a14eecf3bbdf1c56fc179be059637554450a2003a13c122bc0ad4e549b8c8fb1c36229ca9f3a7725d2349b1d32696ea0b797748c0ee8df7103d71e95b51c2fa95a3496d7d9f28e51d06d6dde873dbd6b32d5e5b59fcd4dcf0cb13676be36103b7d6a68ecdae55e623cae8237dd9383d723f0ac94d256474fb5557a9a70464af97390671b4480b7eed89e99a81b497bab6dad3ac72bc6865f27071d32466866b8955256321948dbb42e1703bfd6ac7da245b6fddd9a6e8e3da55bb8e38ada124919b8b5b0d1a6ea4b70d3d9ea82444721629900ca8539efeb8a7dbe85a86e8f758879a38c34644e303770571e841a2398dc2ac13c22409ca65f61627b66acbcf344be7c5a4491c8aa32bbb71207bd6919c77392aca6b42adb5beac60492ec31ca8f393ca2bd420c64751cd1702f6c51214b39dcc52322c3026565527f88903007ae6b52d2fe1f93ce4c0099292e571d381fa7e553417f6b02a2337df05b646c48e4f7cd4ca7cf2d0e77392d9185a9d8dd496ccef23a22f32326d72b91ea3f2a87fb2629961302ce585be4dcba855c67dc75cd6e4f72ff0076d94201c260002aacd75334de5dea8d91a67706fbbdb8f7a893b3b5ce8a529b5aec1656d6c9631cab78af2210fe6bc44ee20f18f7a8e1092ce25b5724ab604646d52a7391f9d352e267b4696690236488b2d9f97e954ae0a165592669157968c76f4c7be6a1f33358526ee3e392411bf936b1b48c0808642a7a9c81eb59eef3dd5c0b7b6912174467951782aab8c827be735ad6971e64437ca31b48485a2cb28f527d2a95a169774d0068949657709827d87f5a49491705193b157cbb586f9ad6dbcc3e7e644641e608c0da42f27e50791f89aa9aac42d666c485a45f94fca0e7e661bb0becb9e7d6b4758616d1882f222885170206db24a73c60f6c1009fc2b03c57af69de13b3fed031342e36afeefe612819fdd11fde6cf5ff0066ba29d194deab439f1528456ba58cdf1378aadbc3d612df6a929982e142245f3310463fad797e9ba089f5ad57c41337d96f2fee0dcf99724f96b08036a81fdee4e3f1ad6b8d5a5d62f5afbc5977f65b49d8c36d108fe64e18e49f5e9f5c7b53a1b04b8b496da2b9325cf9a915bedb7e136a12a4a1e831b8e6bed727cb3d8c54a48fcf33dcde5524e9c1e858b5bbbd9678b48b3d3e3f3026633c1e18724fa74a9b4db9b18ae0dbdc68bb6782403c859768e4eddd8ee32726a5b1b8b3b50b61657de64b3c8db26316eda42ae5777719e9e9505d5c5926a31cd7055ee4a2875b788abbb720027d33cfe15f5f1b725ac7c64dde571fe2297539e492ead244ba963bb3e6ac4b889e10001d3e94c8b5e1a95b8b8b58e4924076ac4a87e40783cf278ebd29874a9ad6de58ae2696df7ed89235f9b07b9e3dcd456ba5dce9fab3595b6b3344ac988989da338c9f7e7a54b8bb984a49320d5e6b758d9de6790412cc9739010ac6a3e503904e4d634524f69a50d39ef24f3268da5b933441d002370191d0815b3abaea65a6826304f1328dee17fd5b939c03820fe35475fb85b436e0de4683ca73130886c67db82afb7b639ed5d314b97505252d0e43c5f7b2dcdbc175604234afb8dd0033850bcf3c0e38ae14c3aa7887c4173ab595ac3e4cd70de5c654636a9c6e0739ea0d6f78ff00c451d8f856e2f2cad24b8d90347f668d72b2ccf81c7a60608158163a7436ba25be9896974925b2289a63703715237123df73303f4a3dd1423cab50bdb18a692e6da42d14d31c02eb2156518dc012303381f9512e996f71140678a548d9c982dbcc1e54a07a30ef9cf06af0468675b595ae522111645f30f7e30067a71fceb2f43b3292c9a1b4b3c4eee7eca597e44dbcb73d890684a372fdde86bcd0e9b3c82c9a5632342a7c948cab2306fba4f718ef526816b6d71673dc41abcceb0a2992dcaf2188c9407ae3fc6a0b19f529a45b57b98618266261763b8803a64f5e08e9ef55b41b8945cdccb7df671bda322312794b90d83d78270011f5a89da53d04959585d72cedc3c37566f70be523466371b771e8b5269dab94789ae9657820b411dc444067693773c91dc56c4d6da65f69f0c57373733ab86960918461632a4e03853c8ae7d6fb52d21a45f2a36796659a4daa08c1e847e155d2c526e2cb562f77f6378e7d26d0466d57f7770e3cd2d9e33cf61d2a1b9b1b136af773c33451aee12ec933bc8380bd6afd9af87f56bde3c386ea5762f2c8c183c67ef6ecf4e4d170f6f3db35ec5a35d468f2fcb1a48aaab3678dfbb9503f5a99256b32dae756286c0cc354d25f7c53022749ba9f94641efd6ba0f877f12b52f0e6a765afc10dd33453032983e50841e318ebc562fd9e4b79fed4f7af248d1b34ae4054120e36823afd7bd67cb77aab4d135dc8aa378915f7641038d831f4a984a70d989abae567d2ff00f0da7e21ff009fdbbffbe9a8ff0086d3f10ffcfeddff00df4d5f3fff00c25b3ffd0be9f91a3fe12d9ffe85f4fc8d69edeb0b92235ae845c4530b9dbfbc9b32e03b7a1f5aa734d717faa6c8ef0c73c1c011c4e0b37ae7bd497e925c5b4fa369f6ab1bbbc6c149cbca4ecc956fe1ea7f3a8a2d2a685a18f4e962cc12fefa346326e3ee4d71da2b63673b13e9cba5b486d3533737135c440ef5f943ff00bb9fba29f716fa342cde7c76e36e5fcf593cc641e994ed4967682732c1ae59470a8e249a569109fa63b5453e99a3db99526b1b588c8a361f3cb3ce33d411d2b78c5447ed10e46d19ed8dcda18fcb641ba66849f318f4c0ab9736b70cb0d9b5a48ffe8db47951e3191ce3f1e6a03e208a18bca7529244c44291a60ed1ea6a7bed6e786682e20d61b7c96e36c4a990063a7b1a9946e47321d05a6a02fede5fb4c889810adbc0982b8e0163ea7fad51b9d12e75195ae75480244970cb03cd77f316e84b2f602a7b70d76ec6ef5494c4ea2492ce21b4bbe71e59352ac37915b98ad6da374640d15ab499218371f5a9e4660ee865fdb462e2292ed4ac6b031123401a0902827af73c5362bab469e0d3eda168e34b77fb5add4d8f3011c151edd8544d2334719b99678da0b52f2d9efced6c29de0f4ee78abf7775a0cd6a7cad2ed2462cccde7315321576da38e7b015718b438a6ca9a46a30cf766385ed2da2594011bc39321cf1f8d5f5b0d5d195af27861639b88040db418d792c7fdaf4accb2b3685a3d4cced24058b1b4b7979523fdfe71f4ab7a85c5e5f4520b3d26e311ab179ae1f24206195fa63b544f72dbb1a90457777630ea76b711dbc62232a5ec8f99763364eef5f9b9ad01adeb2b73fd9daf5dc111681cc72410feee48c6dc03e9d7f5ae73438f519675bbb9bd55830b1c76f724bb4983f2aaaf4fa0ade9c695a769e34892c7ce94a901e441b896fe1f6071fa54117b1937fa237873c4ffdb12de47f66bd8bcd6206edefc02bed903f4aebac75dd2e5b776f0ecd140f0b8ded0b67ccc0c9209fbc7fd9e95c6788e6b987c32da8e9ba5308229bcd687ed058141c1da0fdf5ff0068f4ad1f0d6a364b3096d9567492d49f31f20459e0f0393c9e83ad7442517b94a573d3ad351b9689359782040c119e09ae176846e8cc4757ce3f77e849ed51ddda3a2992cf51b4b882478ee1a156ff00572e1b2a8ddb8fd71599a56aa2cf4f4d32e2d667f2230a671b634771f75d8b7cc981c6c1eb5649b436f15ce8b68f34c8079d0432ac688d9e0003ef6339a2493637b1a2d1ea2d6ebb8afeea3df0a45132cf12b1008631fccf9cf38edcf4cd5593fb3f4b85aeedeea292394ed6decef217c60f0a77600cf522aed95bcb268b2bde4ce977e61795223824107ef1efc5518ec218e06d35acaf26b69e2051633919dc090c091c01cf5edf854b8a2a13695c4beb3d38e978b279d9248fe6b74009201c9236fcc3a73961c7af4aced4746b58f47842943789896348e13b994f456287f9b7e7d2b697c4334d79f609745912da3845bc01122b8888ce37155181f8b54d34093b456834f79aef7ec9711e008d79044684468063a9e9d79e95c7569293b58da85471776ce72d59fc3ba9a49a2cc23f2f68bd8e09448d18ebb9881b719e3939aee740f8b51a6991daf8ad6d95d65d8d28dae255ce77123956c74ae667b2b2b48cbc325b194dbb2868e55b90bcf7925d8aa47a206e6b26eee751860bbd52f51165d8a45e8391281c1ded2855271d3603f5af0f1d9550aef48ea7bf97e775b0ef96e7b9e83a85bea12adbe8cc516520c6d80c873d08f43eb5d1450437493c7123b9518721be72475c8f4af9e3c35ac6bfe1f30b58df0920652d6f343383db3b8ff0e7b66bd33c17f1b7c3facdc3e8daec1245215c4972654c3be0953ef5f2989c9ebe1dcad1d0fb7c1f1161ebd351764cf40167e49dce039214a18db91e836f7a840912522e618c4aee04456e30c5bb023f80f5e2a6d3653796714d2dca3c43e4495016dc0a8c03daad0d2e3b8112cd0878c063990003f0f7af2bd9ce378b3dc8578ce374ca132dc2a6e777768be568563c8527b67b9a57bf8a268ad12cee43121f28bc29e9cfb7353ddda5e35a2c51e7f76dc799f2b0e4741e98ef42d8cd1dd79c650ede6153113db8e6a6319ed634e6a4b56c9126996fd6592233797f71d97e56c8eb8f51fe34f905fb4ca96f7491bb7ce4119cfcc063f5a7bd8089f6c3336e4e22695ce39e4d27ee8df46e93c68e830e633d4fa7d28946f16439526f415d24746864b82c5f7067df8dbcd44201c4293e427dd937eec9f7f6a9a32200d3aca5bcdc868c0ea73fce96195d1c2a694b6abe6e1439e4f1d78a88a8af525c9fc2880345771999a7431e76991a3eade82a378229d628227218b9528cd853804e6af496af24a9b8069198e3770a7033cfad56d70e9f6f6ab78ce65f2d879bb172413c75ec2b5e57cb71aa9c83e61e569e58bae1e155dcd265b38e7154a38ffb26c9a2d3d4363e6466566009eb902ae4cfb0c22c6d84aa304396f9625c7a9ebf4ae5fc5ff12343d262b8b087567babd50de525b80c53a6e23e9c73db35be1f0b3c43d36396b6261878b954958b9abdcd9585a9d435b92368a2c492128543e0120283dfe95e4facf895fc4d7d36b9759458d4793cf0a1d640091dcfcb4cd67c67af78fd64be901b3589d4c569282f175505bfdfc723d327d69f6fa59d356596dae4fd963f9a379250a2e0a893e620a939e7071d703d2bea72cc99d38f3367c5e739faae9d3a4ca9a7c1690ecb49becf29b785cc218e5a500be5573e833f8e2afe970c115ac334e512496500c0fb95385652c4807272703d80a69d2a7bcb4374925d47a84d22cd12a5a012ec0016daac9829f36723d4d21b1d2fec8628eee49d3291ec8a0591632338cf03cb23fc7d2bece843969a47c2d49ba8db7b91dc5ccb0dcdaa48e90456607ef2d9590cee3230ce40c0e71ef52ade4d733444c93063216681882d2c98f9007ee8064fd69f2eb56f7fe1e6d0ef204333b34716d9461972376eddf749e3a7a54490416092ea2934f0dc4102ac70bc6ac5bf8701c7de1827e95d2ad6b192b90e96b3ea0e74d49d60532969203704b923969327d7f5aa57ad690dc3c9f6f178240e2dde093695e78c83e9eb5a96f73f6abd33dc5a079125648213c1550080df2fcdb7d40a9eded6e8e9d24b61ab4325d9015e210855db8ea31f38f4a992b2339aea61daf9b696ef0ccf2068ae732bdc4e980a7fba3bf3e9cd627c48b9559ffb2adeca38ee25428b2a16f2df233ceee7a1efdeb4ad3508b55be61749079d6d316b9b7330c95c7627eee7fdbe3f1ae5fc6ed048247549b2eacf6f022eef2f0464b96e5171dfdf8e2b55f0930f88f3ff001bde46be20b5d1f70956c36cf230eec46dc30efd29519e509671dbf9ec9379862198c02c0e46efa007151a416fe2192efc726fe1b317a1d5d0dbb4a04713051823af209cfbd7510e997166cd69a8eb762f28837a4f044518839c707d8e291a4936b439f6b75d3654ba724f97e5844914b61705b03d79c8cfbd3a294881c6a292b2dccce6de7d8188618e49ed902ad7d8b51d2668ae12f8451004aa98b976ecdf4e07e558b76e624fdecb1c523365a7c9da48233c7aedc8cfa1a6b422d286acb86c6fa2d3556eee10ceca17f74fd083ce47be29f3dc6aec58dcdab1df3c28647847ddce7701edd33ef5269377f69b69fcf3e7b2b150631912127049fcb353dc5e5b9bb8202ab8b6b6db73e74ca19d0b70003d464f1516f7ae5467cced616da79278d2d34ed4a188c93150cf6d9caee3b9bebc0c7d6aa6bda1dbcad35a8d3e4695e21244a876b63f88e3d476a6696f79a3df4369b67fb3c6d89982172080c40caf183c67e82b564b8f11789a513c764e673317133828c99eaaa4f635453397d3750974b2cb736d3f9622da92c126d79771c2ef5f507bd7417eda67dad77c776d35c65951e20ca3eb5cdeb0ed60d72d7912c4eb7196445f9861b38fa641c7d6afd8209e586e52108cb092b24bbf24b723007029a49ee5dec86dd0b48937ea36572e52e0348b64769217fd9fa119fa529bbb4516f68f732a9b8bc58e33756b9084658f4e871527fc23f2ddc31869e28dc166e2ef0c3270c0e79c1003534e997da36b315b27886ce212cecca3ed2b231976615d94f03231cfbd0e9c7a1167733ffe12cd23fe83abf91a3fe12cd23fe83abf91a9bfe10cf107fcfcf87fff0000e0a3fe10cf107fcfcf87ff00f00e0a5ecd8f52c8bd411cb75a7c02557daaf2c22411b94c648279ec3f2ab8f71f66b9fb269d2ca2d99d1e74f33e58f3d987f154179159c52dadededfc23792e259dc96407ae00e99aa4b736861fb5b6b2d38b79769b78d6342d1f624815cdcd1149ca45ed4e517532db5db36c2a0db8612b0277f3bbda8b7b8b386e534b68e28db1959d46491d831a79b98040a16ea7594a6c485b392a3b67d3da9d0248c243f6831492265240b95c1e31b7ea0d573a3515e78e5df6c2784b22029031392704e73dfa54d0b992dd92deee38b62e25530e1d8e3fbd4b77616cc8971b9cc289b965310258918da47b66ac612fb4e754d405bc3e7afef99d8ed1b76e3d867935606659dc59d898e0bad3d65762f2643924b06001fae38cd5afed2d51eedd74b8122263ca44f18dd13138da09fcfeb56e49f42d2748106a17717db5db6adc4110930a392467a67146ab2e948905cadd5cdd99652d2c6e4c6a576f2485f6a5744ca373112372b71a75cdcb5c99862582de742d9181823a7543d2afe8f6fa5d85b25aea6f03ab860ff69725e3cfafae339c556222d3ecc2a9117985cc6b7526c6e7382b8e1872796a23d3a3d42d825a992679c82640494519cf1b7001f987e429c5a611561d7690c4cd0da6a31a7920ba4b6ae572a3f878ad9b6f10e917927d975586690c680bc30b940ebd4fd49ae6eeec6fac23b8860b286e04f0a496eaae50c454f2463fc9ad18356d5aed76491cb7421daa91fd981fafce7918f5ed55251644dea5fd36f3556cc7a6456ede5a1139589519645e428ddc648ea6a6d356dae2fe47964016ed564b86dc5dcaecf95777dd419fbddbd6a846fad5a406e24b2904ef71b259266de515b827d6add86bb716f3db5a5ddfb5c5d3ab4d1c30c91c6b0c4032b205c6ec3103214f38acda562dc1a572e4da3a5e79d06b77d711c3711f94208203f26072eccdf7867190b589a468d75a74b15a4ff22da1f28979cf98ce4e4145fa0e7db35d7e9bae5a5de9f1cf608b346bb8a3c76440790ff0ef7e73ee78ae6b5cb6bfd4aed35fb6486025fefb5d020489c1078c8fc28844a5648ec742d658c9e5cf6f1497334c76cce3746e01c65076c0ce643c8e7b5743e1b30ae932182f2da367993cc492332075ddccb1edf9a7031cbfddc035e65a2eb92c179125edd885cb09239262b1a48d9fef1183ff0002ef8aed6c75d8268ede3b1b7733cec56ecc6be62e73d4b1f9a47c1236290a0127a0356d34ae35b9d8c9749657d25dd8d9cd399f3e65ccb26137636ab2764439fbaddf18e7150497d35dbcfa6dbda1865b660977e7c8af1b1db9e10f2338c12dc7354ef174fb4b778e58ae0c88c0c16cd3a6f4900ea4aba2c6b8c81961c91df02ae6a1a947ab5a797691995a101ee955b725b3843d72cc246edb81ef531926454567a19f6975a93c935bddc118b58177a22913c71678dbc7c91a9e8430ef53b19e5b386deef53b9b9d2f4f4f3279c4b95b67277614b91181d86d1c7a1e94b71369ad7ab7f07991ca55448aca8bfc3d8b0c01ebed496ecb2c536b32df47a82dcc1b5da699cab90d8237c9956da3b46074c50e2a4c708b5d48ae64bad42cdaf2d6df12c5104b6b8dc70e9f773ba40aa5892326207eb4ba7cb62f6d2b2db096366315c3ddbb292fb79542d9771ebb707d2a082f2d16e6dac7538d6281660e8ed2185a539c8c31cbf040385c64f15aed25a698d71069da55ec325dbb490c7e5a28738e5ba198f1ea79ee450e9d3bea5293a77663dce8767169c96377a17d94a91f65525c6f5cf00229133aff00bcd8aa9a9c97b1daadac115c5a142be6b2425228d071bb1106c607692404d6d59d925eb4b1b5d3ef40a6e163555656ec3ca42c71ebe638155350b2d42e5b51b45856f6d6c2259279c00703d102e23423be378f522b96b61694dea7451c4cd3bdf51349f14f8b3c3cd13daf882f63b65e64955e30ac98fbca8fcf60382c7dc57a1f80bf68581dbfb33c61a63284852486e228d94ba93962cadd08c0e9eb5c1dae9107f64c1a97dae779f51ba548b51948daea0711ed3c803b98f69359ba9e83656d2dd25e69935a99660c301834a00219c293b98f231e613c135e462f26c3d6d91ee6133eaf85f89dd1f4a41ac787758b2173a75f47751ec2db524f9c1031cafd6aec5169cf72e1eec1fde6f5599802872c383dabe468fc43f1074a86effe10b9afccc970b1995604d855831c16c0553c7200e692e7c55f1af56b7bab9b9f883756fe520f3c398e324e73b171f789e4e7d01af125c3d28cdf2b3e861c5746ac12b6a7d6972eb6f2b2dc5f8886385924cfc80ee3820e79c631ef59f3788eda3ba861b46b556370b1b99642b823391c9ee08af91efef3c6fa84613c4fe2ed44470c2dfbfb49245660e32a720e0e318fc6aade78b759d3564bab1f125ede4b04e0e6e7243bfca030627938e3f1a4f21925766b1e2383959a3eda8a59e58cceaca91a3912468725c6eed9a7b5c38bf68c5c3f99806380a741ea4f7ae23e0778fed7e217826ce6d4afdbeda90b79f68e30c87702307e8457696b0dc497af77a7dcc6432e1415dc47a838e9f5af06be1e34ea3496a8fa1a388a7569a9a63e2b716f7a2e123838c87919b05863231ebcd54d7fc43a3e8169e6eadaa1b52ea09262ca47cf6f7e07e7585e2af8b5e02f0eb3dabdc096e2d37bbdaec6dc5c0e809e3935e45e38f899e29f134a6fafe2ba874c91a310da98f86566033230e7835d587c054ad656d0e0c6e67430d16ef76741f143e305deab67f64f09cb21b633ed9aed1fe7918296da07600f07dabcdbc3b0ea9e26ba5f3d265b08536ea131970ef2c80b6de392b80b91ec293c5cbff08dd9c365a6dc4536a770e06042503f98db5595931b8827f8baf39adff0ee8d63e12d2ed6db5bf12e9da4b6a0ce245babff002e791e3523e60d9032176f1c0247ad7d7e5d96c68537a6a7e7f8ccdf118da8f9b65b1a6f0da5bd892b78f6f676cd1b4ed1156662172b80c4719c0e3d6a5d5351b5b3b1805c59c66565f22597cc88ed8dc8258e1fd5f07e95474ff1cf832e27bb4b7f17584610fd9cc69a8a65888964280e57818033ce483e94c7d77c071681797163e3ed3f4f32bc917902e23186699492df3f24a9c83d8a0af7a9c23186a8f21d59d9a6b7196dabcb2d941706fa192e18c49e4c65140401500ce4f01883f89ab31c31b99ef24d4565badf18bd92dd158464280ccbca8641d873cb1f5abb2ea7e19bd9f4cd1e0f14d80995bca916db515dacc1c296ca31c640ddf954fa645a45de8a7451ac5a3c91c0816c86a257cb5187628738eb90477cd5a7a9c4b9d4acd19715d456d3d8ff0069ea12ed5007dadba8dc5b1bc066c0603a76db53ea5368efab25bc11cb6d622c9cc6d25b823ccce72a7be4f1cd6868de199b51ba4bed0ecee9aded4bc3bfec4ad190bf300db4f20af3ce73502785edfcdb686ee17be62c7cd96da47db1f5c161d8a92302a93b157d6c635fe8b67626ddcea86e54b13be4d8b231c1da30583312491c0352b5eb45a45bc37571a93c3243192b32725f24347b1c21619eead9ab3accb69e6594fabc802c574271208446db154e3fd602301bf5aaba8ea76e74096fefae184b3481a318f21583374daf98e5049049001abb73ad01dada9cf6a5234d14845a91711121e22aec2240d9e47fad8ce3d5996bcdbe237892e87996b6aedb6e9fecd1ac8e82501c03caafdde3a05ea304f39aec3c55a8dfe8f318954a1b994c291c40c7e493960515f3b37743b700d71313cfe23f12473db476ac34c851ee2d6e42e7cc6caf040c0208fad5dad1b0938dcbda0d8e917166d6d369931b7800b74bab6664f2c606fc83f7b278e3d2b71b47d34bc9670686598b0643315388d0027731ea4ff2c5676856d68b035b5b42d6af16f9192197ee4818e49cf07774f7c513699a5eb81648239668bcdf2c489747f7630198306fbbc923038c62a4a25d42f51d61b6b18177c9949eda195408c75c01d7b8e95cb4c16da5b882f228e568e377816584a31e836f3d7bf3deb6754bdd1ec358305ce9d2bc5e60936c2d809b4609c8ed803f2ac5d4dbc393ea3e5daca55a32cc8cf315197ebbbfbc00c63f1a695c1ab8ba53d879b27d9e0862569082c26c6e5201273f527f2ad392d2d67b6121b513c704a99812612c8ebdb00f0cb9c120fa56169167630dbbe842dd2ee041221926858f70dc7bf5e7deaf695a4ed9c4169a52adab3a4126c5c3032302840ceea1ab0ac916a3ba92df74696892491b335df97701017fee953d1b18040e2accda8eab73120791621b14db40f3ee489b3c703818aae64b6b0d5174b4d4c4171e5037115e444e08ce587999201ec738e38ab88aef1e2c24b272e77ef9e40de61a4b51997e26b5d7eeee2e2d6f6e34f9a461b5c83d4e3d3f1ac6d26e25d266161a8ccb0e640a8ee18ee50bce4fddc0ed5bface9d71a9c4cc6f95652ca3c90362ab671b838e493e95cd6b561aae8fab897ccf3d2191c49088577b9270467b8c734dfbba89bb1bf6175a25a411dee9566d2b33e6e6562ae31d32a47a81cd3aca2fed06b9bb8ace39231febbcf976308f180a07a6303158f1fd9e5f2e2b6b6b931293b1a1603280f43efe956b58b386fa488a432a142a8a92602a8233f311dea93b94f463bfb37e1aff00d0af69fa51fd9bf0d7fe857b4fd2a5ff0084227ff9eb69ff0081268ff84227ff009eb69ff8126aac8465456b689299b7c924ff00bb31b01f7613ebfed54d3e968ecb6330dc26578923495959547466a91b57096eb69636d2c46593ef88c1264f4ff73dba525cdc5f43ab25d34624948fdf70712ede1b0dfc20f7f5af38db91176dec35d36bfda3776e27317cb0cc6e3f7613fbdb738cd4a9757422db0c815895db2244a4918ce189e7ad476d7334ba6b5a6a5a60812e238d5658a5cf38fee8ab3269e0471dacd899da7477fb559ba02319fbc0fb0fce8248b4f79e2ba36b71a9ac5e7c61d088246da4738ce78ce3ad5fbc88da595e6a31dda4486453246e098df23385ee413dbbd574bdbfb3bdff004786d90f20b3e48543d0802a19354d7b52bb974cbdbfb56574558d56dc478c71bb0006e3dc9ae861743ed4690ed25cdcd9c51feef624ed665805c67241e9cf1f4a820d660904925844f14d0c87ca623e5da0b6e6c9e54607007a54f0b47631bdfc9a9dac6be5fd9de18edb97f2fa9181fc5c671515eb2bc4f25ae654798346a91b86ce33c927b1e73dbad61ef09bb10dc2c6f77e5974691dc3f98655658fe66c72065c9e300f4abd6b00d3f4fb5d3a3226fb3c65e723e6cb3118c8ec781f90aa5e48d3eec8d36e2ec2c6cd9775254b329ce48e5b04d68683a1416ba95c44b7f2379acc6428db1e48d5d883f36588c8c633d38a715242e6f227d4cc0a56f45a5cd908adc8652df232e39c0e8bf5a8ac350d7352b68ad5999374926e10c71b6d403818c64fd055bb87b98cc675d899a1e442235c301eac41c63dcf151595c436b75f6859649209a5f3320172a09df8dca4606062b4b32aca7a8d8f4192559e5b82c6110ae259f7e65f5ca83cd25ce8d68d17da22b92a1111de5169945490fcc8327803ae3dea047d26ea6115fdcdd45be251cda7931aa93d43af43ee6b6ed746d2e422cadbcbb98a0739719d8cfd8eee0102a9ea8d1ce2e36b0b6b7b65058dcbdeeaeb2ba2ff00a318e4685a441ce015e87fc29228e7f13f86e1d12f35a4b8598bdec1317d9bb039001e57dc0eb55f556d20bbdaea0ed6d6a8aeb02c481ceece0607fbbce3f1a8ed347d23cfb0bab8816230baecbabd67cb64e3b74e091f8d38ae533282c36179e18bbbe8ae8466d98451aa4991b40393cf15b9f0db5a82c2dfcf178be4794ab3247741432e32416c6e51c745ebd3bd374a1e19d2bc4775a4dbdbaf917b6e5228e70be52b163f305ff1a6d8dad9d95dc4269eeae5a28658182421523620853f5e71c73e94394dab5896f43d05b4f8753b586decb4e9e7885b976b7b9b732b3a9f981101385400677b64f156eceeecf5b820bdb95e2d94429e548b20897eef1b4041d718519e6b3bc19addc163a5b89e4085a58ad0046c92171fb93f39e01e64620024e38adc9671a3ebb3ddd898a3f32d3878889a645c12d82008fa8c7ca32a093daa231b11adb52adae9b797b19d62248c342aabe648aea55406f9b7160a33d093daa48ad534ad264b55f22189a69638e7ba11a2ef2c092acccdbb8c8063008cd4ba9477efa749ade976f24b08d82711b73121180417e5b24e3078e6b2b4fb73e4431dcea0e91cb39825b86baf28cac7e6c80e0b89147f708031c55bf75845ca220b1452648bcb7bb10b47e72caeab32918e3fe5a4840f715663b6b8bcd3e3d0d6e84716cf960963e3239388d3e707fde273575a1bdb944bcbf30db5bc7b9271e79433051c71f79d88e4e08cf7ac0f1078afc29e0bd3a5b7d4b579351ba0ecdfd896b66acc11bab845c304dbc60b726a1c5b77069c99a9e0e92c64b63a78b4bb82ea49cc2b6f1b2492a9fef14c048f3db7eead7d4ef6d34bd26e2d359d56cf4e102325b4b73748b367072628ce5253fde0a00f4af31b8f8b77be3ed120b1d25e3d3ade21e5b46cca0c7e5fcc0647c80f3d31b87ad636afe02b7d73539b5aba875587ed48125f2b501751bf94818b02d96898e7f8719a894657bdcd146315b1de47e34b90e9a6e936090305c1b97906d9b720fde61be627d79c2f6aa53eb3e214bc586fb56f30472b9dd2a06755014e7279eb803ea6b8dd32cbc41e4430ebd71330685593c99484ce4b61c13f332af1835bc353d1b51c2241f68130cb49149f3942465b839f948036fbd52925d039d763767f11eb7abc125a5c5ec8d0a0003f9a2372cc0e5173f41c55b8bc237f75325cddd8aa3d9db167b8bd93990989f0060ede993d33c0ae365f09f89550dcdc6b4d14af70db5033032a9200c1072080791ed4e8affc65669b9c5a794d2caa66c827685250e08391b5883f87a527ab1aa92b9b4fa77866faeace12923f99651c71813b2abb90dce7fbb91cfb5665fe93a445a28ba9fccf22ceeb22d36a485739032ae0e7072770e7eed737a9ebfe211672cd2e9f71f678253855951e385700602e325704f0b8c1fa9a9fc217971e36d412577bcd320865f92ea45097132e39f2d5f3f2920724f502938ab6a6aaa34cf49f867e3883c037cbe30bcb7b616692a93179a0f9b163612481b97e62bc77c015d378b7f68cb2d480d03c1fa249044caf34fa8f95b5b19e0f03804fcbcf2735e7d0e9da1e9b7eb0196d144b109a36d5f555673b5c128ebd149fbdc71c5696a774b25adddbd9dcd859871bee6ddae4b8972372b01d5fa0c63915e654cb30b527ccd1eb51cdabd3a5c88aa758bbfb6dbdeeb532c926a05a4743097111c1c271f7587de1eb5d6e85637365e5eaa2fe1682ded0bab6d6f35fe4cb8da4fdee9c1f5cd79a0d4fc4173a6b5b1d0e4b947589ddcfee63dc39127cf97078fbd9ad7d1fc637ba535d5fcd65e45e4d34973342da82aaca8400ad9c61978c0c73c7a574d3c253a51f74e1ab5ead5bb930d42d92eefae7c5be2375b2d3208c2c093e44fbb3b990c7d1b3bc003fc2b91d6753b1d6efaef59b9d25f4c61008344b79543982360921881fe2690b6e04f19ce7915a9afea7e28d5b52ff00849bc4770cc96f703e4688c96b6f91932c8ca43138da01e48c5736fe2bd5b599ecaf2df4eb24b431c8b14f0ab344e133c056f98af2a70d919e95d94d2e5d4e6bdb522b87d3ede38f53d57519238ede47636b1c4d2792412768600ee07e6c9623a91c8ac79f4df16f8ded331cb6e9079b23cbb8a798c836a8601492a463a903ad747a3fc31d2e77173abdfc8ec0f9f733c96dfbb123283b71d791c7bd763e1bf0a5aa59a4f66598b24ec8c2dd8eee532a5b20aaf4e0f07f0ad972dac67295f5460f84fe18586911436b025bdd496eea6e03f04aa9405f27a704024738c0aea8dad8e976816ebc3915d7dae51b7eced1c6a5004db9007fb4793c9cf3505a5ad9dac771fdbb05cdc88ee7cc85add5d95e423ee3807200c6768e4e38236d39ac2d74bd4c4969118a08e18e5984685667cb0c12b9da40e4739603ef13c5436af6053d3521b3b7b3d2afe3bad0f5dbab79a22b25ec167784e17cb0a1030c60b676fd39ed529f15f8badaf2df47b7f8a3731c7200f15b5d8dcc493951ce4f3b76903ae3deb2aeafbfb25db4df2ee64965ba12192400928d18c020703033c7b9a7c46e2f254bab486798ac6927985c1cb86000c9e718eded49a6d589766cbde20f889e3d8e51acc8f6da842ea20db1c4f16e5dcc9f7b38dbc927b656b52fbe20e9b6f6bf62f165b41a7452422dadaf20bdc42ae154ab4aca304f7c3035c85c4be1fb7b0b8b1bd95de5594978d54aac790090b8e08c9fccd5477bb3633dbc7a14f24f2c220fb2180c81e36392c0021b85e7835704e24ca29a0f1aeab6fa743fdad25c471f95702633c29913153c118e391e98ae7f448b51b5d225d5b53d26232ea539b89b75df96ca03965dc4f00631c115ab2691a5dc98fc34b162c22759a1f3436e6dc7215b3c918ec73560689a7ced36ab67a85a0fdf12ad3465c380554a1e79e074ad1bba21d35d0ad1c3a86af7896a2de08e2982cd7a496063652586cec78232c2a7bfb7bbd3e29cdcdb5acaf720b09a626342179eabc93822a48f51bb3676f71a44d1483fe5bc8ca57e52305403d7fc8a7c73ea56f691a0b749d649b6c06e632427aed27e5e98c823a62a423169ddb332c1227927d30c5b231b4c83c8dee22c65fef75182393cf4f6ac5d6745d0b54926b5d31c0777c6e9a339da9ce154f030083c7ad7532f88ef24db3dc4f15cbdc2bc529b293e52bd188381f7405ebc9e9d00ac3d435926d8bcde219a6b800082e2eecf0d1a93b4280074200142762ca77f35edca599d334e4959832a3cf26e2401b54fe258fe5562cc9d421fb279396836c6cf6c83cc0d1b2e6439fbd83c03d4552b2b09b4c992487508923f3fcb9ad901411330f97630e739e6b4b4fb79e0f267bcb167b5599eeb3779471b8f20383829900e3bf7ad16a05f93e73f62b682e2dae250c667854050a4f1961c83eabd05413c1a5a430daaca24962899b118dd8c1eb9ec7afe9539d522b3fb46a106973480ddbdbca16f778666390ebed9c0a86d59b48d46430694e2101a0b912c5ff1f49b724a38e54827923d29bb011caf05f4af2da64aac9107b73723018bf0d9dc4f4ea36fe75435db386defe5580246d0b31942ca43333759436d5e074c639f7ad7b5d2b48bad4db4db6f0c13670ca8e2358f20ee6dd82587cc783926ac5d7822d34ed1e5793c3972cfb25686255c1404e7ef29191eddaa25b13257396d1ed74983ccb5b9580308fcc8658d0334dee01e956ed1ada0b68fecd04c8f78e7cc8ef46550038de7dfb83e959dacc11dbeb42eadfecf03c5b944324240519e9cd69c175a4cba7f9ccd2c514a4469e5487393d783db39aa93f7742db572dff65697ff00435597fdfe7a3fb2b4bffa1aacbfeff3d57ff847344ff9eb7fff007c251ff08e689ff3d6ff00fef84aceec5743625b97749e0b58e203e511c98241fc2a6827bdb896ee4bcb89448b161a2400465cf51b47159d0d9de5bca91db49f6790cbb308598e6adcd1de5b3ac4c631bde379a5da7ee2b18c9fc4f7ae336e62c58bd8aea16f12c11ceb284219188f2f8ef9abb15a6a1a8ab2aea0b736d20c1b69afc02847a1ebf8551b140d6904badb8fb34afe634b6a37380a318a97fb27c2b7b0968b579e28ace3045b4a9b49cf72dd49a0e78de45f94c9a5db9d3a79ededd2740443046ab24b1f6552e09e2b335348353bab2b58ee11adcaa058ee2ec828c09ec3f5a48ec34cfb57daacafdae1e190185c6e2503aedc03dba7e756e36bab4823ff00477de037cb260b0e0f715d068e128b13525d530b7f68d6af189a57895176b2630a783f781ec7d71514318d46678e5d3f11cb198a2903fcfe628dcdf4e3209abecb0cda92eab7ad05a2c5100c6625d9c6dc90a3b74eddea9aea4d358cd716d23c2b148de4948082c5811d47739c66a134ca9c081ed24486099657780bf16a1cb8623b6410067a6714935cf90560d41247927802dc04c6d0a5b840dd87ad177e21ba0d1e9d6fa441e6490958ae271f2e718e33c64e179f7a5f0fdbdac65ae75e7797edae3c9b2b0c65594ffb5f281eb8ad3dd159174e9fa669b6ff0063f226c922402de6dcc8bdc7b8f6e86aa40f0457104d6c6231c5cba41cc8243c15653c703b56c4b67e17d91cda2d9c914b246c1a077ccc9ebb8f7cf6acbd33c3325d432dde991f90ad39f227e70221d4e0fcc642780691318b8f535ec2c754bfb34d2348d20aced099235b6652c898ce1d9fa1c718fef5492787edadd6d22f10f896233ab65c4edcc5f409f293f5acf82fad0c771a85d8bdb724e2dc22b61c8eaadf2e393dcd2697a3cfaac0cf6da3c7b61898a4866c967ebcf200fca82cdc91bc3b6970cdf6db469c4a7ca4dd9058f0473c2e3f4a9adb4e17977147a9b8b4f2a4662d35e99239827603b75cf1e959b63a25bc524b2ea5630b380cff00bb75dc37918cd49169daadc488e2090e237291c9371d0fe553660f62b6bbe1cd36e236d6acf5b8e59e36e648edb6ae33d370e4fad39eede131d8b5e004a2b3cd1dc0f31f91d4b6547e1c9e9d4d4f6da36a5035adaff6ac4f24b766492044661110a0ede38031daa9dd68d7368f3dfe951bca8d334d6ccd108d0ae790a3d9b03814fdeee667522e165121d2a3685d1556522ccec9541184f2f3b9db3cf271f4aef6df56b3bbbdb5b2b5b2956284c6035c2ab88e52394e7e48949ea8013ea6bc962d5bc99ee22827105cc044a908727cd2c8437cb8f98e4f7ae8e1f186ada7ea923f87e3992428c90cd7888d283e5824aa7dc5c1e053057b9d76ab79750c7753d8dc045544696deedf6470a9ca956763c8cfcc06080074ac4bbf8d76ba6e9ff67d32dad25b820c6b72f7998cb30dbba338f9f6e73d06315c96bf24fab6aeda9eb30dcdec8d245be6d4577cde70ef8525157b0c0f6a7fd8af22d5a4bbb08ed25b69180592601599719e077c371f4a9716ddcbd0d4d6fc5d36b77ceb7fab1bc523cb58200a91bc9b79eabc93dfb9a86d6db44934648ae74eb687ecf68c9b2584b4932039504f42a1bb118a6db457ef6fe489edc6c9b9d92e594a7048f7e79ab4753916da4996d2d2e66b58c3979d1b79923e1a21ec41e9f8d53d104ad1b1ce5efc3ed1efe45d5122b5899611fbc1c650a7df6031bb045672d8fc42f069fb27876749e392213b09c131f208de8f92dc8e083d2bb298a08ad64b8b5b32c07991c8177852dc24654fa2973cf0319ab8352d16d6d1ec5b4e82086575894dbdb66558f3feb33fc448e807072692d513cde47133fc53bed35a09fc49e189ad268d0b0b95b712c24ec03772093d7a0e4d4516b1f0fe5b18a2b7b3ba8934db4fb509ada1f2d6695d817003659d47b9f97b75aed753bcd12da6b44b18f519300484471a98e2465c066feee71d3b5635df856c21beb5b57b767b7899cbb409ba390c9fde1d7a67db8a70517a94acd156de7d2ad6385b46f1646d716acb217b8427cd7739c0f701b1f956e68fa940d0db6a1a7e9eaaaf6663412be64055577e17a1cf1ef8ae5ac3c15a54da64d737969736f2c613cfc4b88e50541ca0078c118e2ac41e066b8b45b8b179638e07412a35cb6e8771037a807aedc8fa135854bf3e824ac5bf1369da6ea16af35adc4166d7d2ca8629e4648da1528d24a9b3eee02e31d39fa55df0dd8cf77a95bf83469169fd916da7dcdc6aad7fa88823bbf2f6bac31be0b062b8603d01ac1d0bc2faa596bf147a44892adad94c91c7752b1c21901dabbb21b7a820e7be335d37c29f19e872f8eaf7c35e2ed1e3b9d1ee1e58ef5a0b5c5cac5242d121de7e55542632c78349b7629e8711f11fc4107c42d4f4e9f49f819168b691a0b2b259aebcc92f252ca50b96048ce738f7c76aedacfc37a2596af159eb5a75ac31d9e9e914cb25d392c154eedacb821fa819f4c5607c5cf87ff153c01e2dd3fc37e20b78e09f55c4b0dd5b5ef990855917cb6dc0ef56236b7272393d335d86b3ade8ef26a96b617d25c1572ed6d272ab285031e660ee048f3148e3071de85aab9a464b94adab5eb0b79a0f0df882f1d0ac7b237923903c78f75dd1803e5233cfd6b2f54bbd635dd360d1747b3861dd090b701898c043b8aa67900e31835660d1751d69144d15aedbb81d5ee9ddd1bce3b00382001d3031df9a79f09cb696ff0067b3b897ed304e45cc7bcaa83bb3bc93d783c7ad5a77d097515ec603f813c4177607c4779a7b5d5c4ac64d8ebba3546c0c1c74c01f9574d6ba06b7a6df168a0d29e7b78d1e2e0a2a2e38dc5b21875f97a1ad2bcd3e6b512c96b7d731a5b5a832f948185c7f06768c0041edf4a86df4dbfbdb3fb1af8b64f267b812e3e40e84a9d80ae3ee824f1d39156a364293bab172d6e35162d35bd8886d882d1b6e5919d1c88d41c0c87dcc7af206dc62aa6bd7df6dd46de1bdf0dc8ace088e4894c832495193ea0f5cfb5217d4ed256bab0d48c2cee8f136dcb2676964653c6e3c107af4f4154aeaeefec6c96ce0d56ef64c18db892db76230e496639f94e4f5ef8f6a4e2c8516d85eea96368bbf537d5f4d691dfca9d20c8531a6d763cf43d8fad4292e8972d34169abdd3dbcb6e8f16f50162882e42330e776eebfef0aa105f6a92a192f35d3242c184ad24e14bc60138c11c738fae699a54d05e59acf75a71b448d55ca4576ac19db390e3b290abcd6ce1cb0149598e9eeac895be80c970d70f1a4f0b42a16320e3e53b81c63af069b24d6f1ac5069f722da22e36cb35b10859589c038191eb8cd5c8ae7c3b3cc1e630224999120971bd5971f3727ee7f3a76a565e148ec651636d3a5d2a011c108608cc480587002e707a75a88dee222d4742f113dca486c7ed0d6485a4f2915e3b9ee06d04151c8e4fa5605c49e26bbb38ceadf6f5b8926710c86e14ece380540ca800e3193915a57d2db995e2b4d52e648640cb731c30e583280c558f71c77a643e2abfdc556f249ee8b978ad88216100820e7d368ad00cb7bcd7ee645b4b8d62de4fb205c2c69b5970b80338002fb55ed32de0bc16d632d969b7327ce5d5fe43116e3701d18f1d7d69faadeddc973278aaf651140544cf66d0860aa78ce3b8cd54b9fb3fda123b4b6b32af123472dc348373872ca131f74f3d3a501a12b7866c602c6ee078e0010dbc6b3ed6237153918e0ee07f0a9ed60b585e4b5b8b39ae2dfca758edee5895598302b93903a1aad3c1e2ab6f313586b7df665d9d84f86b876f9f0083ceddc0647a5446ff53d56de7956095d2328cb2c922bc2d36d38dc0fcde9c8e38f5140116bb7ab320b1b7d10412dbdb3c72a22fc8fbddb0739ea0823f0155f5296299ca4b73e57956c5f33444043b428dc7d3e5edcd4d75a45dd9e9e58eab677503db81b6d2304292031c337390c4f354f50b5365be29350f2d1a2188ae62de1860648c739a4c0cbcca97c21b68d83888cb705977465815da54374e7a7a64fad582f0df45b6d5bcc912660b1dc10108ce067b10476e9c5539e5b71ae094ea6f3a8976436cc305d700f3dc8cfafa56b14ba92391a3f0f62258dfce8629013db040c7069b93b580b31c76974d73a34d04a5e68c1b6ba461811c6e0f04f7249a9f4cf15c96f1c769710ea91c09231589628d9238cbf2cc4fcdcfb563b5a58b42b77019ed9e1063786652ee8817200ec01f5ed8a5bad36d56c92f629a7b46df22446293cdda1d41393d48cf4f4aa8a680ea4ea13cfa78923d6e49a39142adbb911968cb1c3023afa0cf38a669f736b66f15dd9cd3dc2c504693a194b324ace72a467eef626b1f4172c8d708b673ff66a1b649e55c1c677160a7ef1e6ac39d4348d3cd9adb80d7445badc5bc644ce41c92c07fbd4a7a202a78eb4dbdbdd30acba7c6b7574e6204f0492e79cf6e3a1ee39ae6ad9b485df6d77717465b690c6b6934590594e0918f71d6bb0d5effc41aa584cd2e912cd6ead1c8d3987cc6880c20523236a9c7deed5c8eb11df7f6b3c566ef6f721f6c3707a0c707f5efde9ad519d4bf2e84ff6cd47fe816fff007ee4a3ed9a8ffd02dffefdc950fd8be237fd0ed27e6dfe347d8be237fd0ed27e6dfe3472995e65bd36f25920648b4cb98c447cc2f0c5b8fe79a64a6e9dd61b5d52488dd0c42b2c44b15ce7193f2e33ce2a5d2e6bd92491ed2fe280dc0f2e074946177f4cd5cbcf10eabe55b25ccba5dec512ec412cac5df8d990147b570d99e8723134d853499a6b6904970c617f2e68d8794467b28e6a6fb669175b93ec86e1ad7fd62bc6c1421e884f723dfd29e2cf4b3a743aaa5c450c922078244c94607fba3aa0fad4a926b5737ad6f26a4e8aa9279f6f1db7caea0f0d9feb4598a9c52dc874c06dadae6da5d2325db33326e4dbb7ee1c7d39a8750d6eeadae934bb4871133866be8e4c6415fba411dea7d36c750d52dee5aefc49fe8b2b6c91e495b391ef8a249ad9d049737c5226223469d708593d3d4ed19f7ae82a534fa0eb6d675096da186eac6ce1657f2e354f9b7a1e3249fe2c7414c2ef0322c7e256fb36c612c71425581dabd77706a6b3d3f4c96d416bdb88dada5695dbec6104c8df74f278cf155af23886a30e92f33b07b8326f7d9b14019da0e7af159c025ef0b14b6d25e8bbbc374628a7db034d6ebb89c71f2e7eef4e7d2a4820b39a51a7148de78210c773ed8d403b4f3fdee7a773542fa5d1e4325cdb585cf98f6c3ca62fbda123664f1ebdaa6b2b037961e65d2c4ad18c35aa364c99fe26f7ef8ab93e53336afede317f71733da45b119c6e8a719c023a63bd54bb85915608753713c32a4b14570a49da0e4003ab7d29f61a66929a54c8d3c2123854bc8549c127a7b9aaf7d71348b1adf18047b8344263f3051fc43b8fc78a71f780b7a6eab776baaa6917364b24724e934b2c526dd8153285979e09ebcd59be95af552d74ed065b55589668e46900f3181ea73c914db5b55b3886a5a4e95786dae9144a22f983611fbfa52aea235bbdb5bb82da6b8b5822469bf7817e50795c75a49de5601f66daacb04ef2e8f0c517dcb3585c1e31d371ead9ed45a586ab616d0de3dc9648dfe76705f71206f51db8ab83ed4f1cfba1b6b384b892282cdff76a7d58b753d381eb4db0b7bcfb28ba33da59c51dc142ef2ee57241e483c5272b3b1327618f713960d1cd7889742430bc7000883bab60e4f14e952e34cb472d000b1aafd9659250f85232480bf77351db5de9305d7fa4788e6b88adf76e482dc011ca41039c77271f8d486e92ced95748b2985b451f92dbd8090c84fcdf5f4abb2276249b5982e61975b9adc2e5d112767da921c7dd0719e4fa77a99e18e6d3d66b78d84b13967dd064ef3c2c7cf5c9c678e95464d4a526c60fecfb48e15badaf1ceecdb4804e5b8e0f1c7be2a33752cf24d2596a0a2e2269655b75059046047f31efd3383ea68b22934cb576b2dbea9716a3531a4c4c148b5b68bcd170db72738e5486e98abf6ba4787ac841318ee9c491ee883a12de6fa0079c13d7eb54e08ee6c5e66b487c8470d70cd03e3258a80771c91827357afd7505822659a4bdb995c21796721b05dc1da718ce2a5bb3b0dbd065e7f65a5dc47524b7b6077b08d10ee6931c671cf5a7e9da96996f21797c4333b64984346106f3f7baf535269fa6595e5e4cb7fa65c18bfd66c9ae42ba71b4907ad52d56e278af1acb5d2c6dedc2e206873bd93e52bbbb6411cd12f858e6ae932096c74cb831deb25d9927b5952ccc4d94993a6e7feee326ac322db5afda745d32e49b49552dad9d771d8a36e53b905bbf6c547717697918b1b6b85469a075920f27e48a323855f53ef57b44d62337c91dbd9c8d0b4090c658aaaace13e73c7cd8032703ad28495b5124a499204d7e749ee3fb1af6088a032ca9102b27f79b00fdd3c01d860d5a3a5ebf7d6126977ba04caf34595b9f33cbf2801957393d38c7e34b77a9a789670d637aee859a24218f95f21f9b6f002e139c1a3496bc9daeac6f6e1bca9b74b34de6ef6742a46d52a7a6029c512d76145952d34582d6ecc1a95cc715d79ee5a1806f6113206e400460c81bf2ad1b4b98f4db76737314d3b469b5a456c8666da5781f7864609e9cd62dfe9f6d6b7b2b68d7a96f2c3166f2eee26fdebaef63c01ce0283df14ba5df5a0b4b89a5d46e2ead9adde688339064c8f918639c7079fa52b228530bea17c6cadb566b1b95b011c57535c32f9722499cab01807af078ae624b7b9b2d7ae2e62d4255b5b882479e6849591484c6c76c60863b41c03cad74d235f4fe2026d218e490d89f3ac56fcc2c0ee62b9dc30dce38ea7f0acbbc6bab5d76682ee48ad8cf0aa0063c3ef604b217ce08dc01e3bd3b45932d515b4ed7750b3d6126177e779441fb35fdcb9588b008f8720f99f29ea4f038e056f596a1e2236e9a5be8965e4fd91604758b7479624b0ddec00c7a5406e9758bc297d78b1c584468a2c6c59110ee271eaf95a4b286c6113dc4b7f753ed82290282447031c8651fde6dd9e3d050eca228dd686c4de26bb7b804e8c63fb45cc7359ac3165426dc171ea054735c789ae649f5192e775846cccecd26d799948c3fb806b163d5b4ed3d9ae619ee65849d8250aea6dc2fccc4f6008e3f1a4d6357b3bc64964b1ba985bc68d731a5d9f9fcc6c03803801707d2b387c455b5b9b6f278874db81059eb0089187989380e19dc0cb02790704600ea6a29df53b44b897fb4e2963b64f280ba80c5333ae012473f9715cf59c7ad40c96161722786491888672a090a0babeeebc6d2074e95b09aceabad6a37176fb2492f55a4697715650c7800773f29c376ef5b0376572ceb5acf89ad7cf9e3d28bcef1445245b4182d9550739e70a5f9f61552fb52b8b3b49a48a376b68164b556914960eac086ea721838fcbdead5b5fea5733cf23c778c1ed5250e8db99c2121970463382791c1fc2a5d16d352908bbd5a6491ee2fcdd8b499f6342140cee503a2867fd2815f4b9cf9bbb9d57508a3bbf0d958f76c12191810e46395e98ce38ad3d292cef34d3ff0947869bfd26367f3609b6798b90a38239c6c3c0e39abcb7564cf71e22fb5e8e6511b3ffa45c48031626305540f98852afedb6a9c56125d4161369de214b7f343a49205cbc2e9cb707841bc13f3750c3d2b4752ead62126e4635c2f84b54dce756bc818c8f6e2e0ab7dd38501b03e5009e077e6a6bbd5bec969358e9baaacd24ad24659177488c1b11900e093c118f6357dff00b4e2b679e79609e6920f32ee59046a72cdcb100e0e768c7a5523e24d1f588e4371a22e9aeb70ab166df04b83c1cffb592452e64c25d8ab2ead77a4ea97573a65aed40cca9736adf36d08032b8c91f33124f718aae35e8ccd308b4916d2c72edf351fe5008ce003ce3d8d6ae9f7fe1569b0b04f1096d9c1f2adf237f3927b6738acebe8eda58de4fed396449667c218431c85ea48e98a64f2bee456fe28b59efe4b6be1732c8d6fb10b43904648c0c76cb74a974dbdb69e37d3e5b03334a9931ce8414e7a8c9e0533412cb1477725f24a428302f9780c5be46dc7b28033f5a92fef6095859c57d1cde64e96cb7ed1fddebf2c9fdd4c2f0ddcd04f3493ee2466e20bb92fedec9d9ad93f74970a18329ebb073c75e7eb52c634cfb325e0d0ede267d82748652cc0b31e0a83ce3aede319cf39a76a11398657bb5b610c96c8b6ad6ce700119e71df24fe18a8aeda3d32de3786d21902dab45736f0c0dbe5395607dc8c75a0d13ba224ba5732eaf69668f03bfee48c0554ced200c0cfdd2738efed9a97516b4bf6166ac6330ba949d465d90f6e3b6734d86fe499e4bc3a35ee04aedbf81198d8020fea47e1524568d15b8d66595a28a2d8cb246e189084c8c0fe02ae2ba8376473f7be5dcea316990786a199d90b215631ca4e4fcdb8f6e2afdabda4d2c70d8c9e5490aaadc433bb6320ee3caf53c5528f4cbab3314da8235de9b713c92c33472e5e35209c9efd33f954f770c5369b26aa827b854119668a32bfbb239dc3f8803e9cd0d5d09491a17867bc92ea18ee66b49597ca67770f957e57f0c03595aa0bdb59222d7281a748d91add40dca848edc0e2b4e1d66c422cb7de1c58bcc8879e62cb34b91f2e0760a3f2cd522be0361e5eb30cf6ed1b4c36c572c04cb8f972b8c28fa1e69ad10465cc87598974e85ae6fa487e58fed8d1b4c09258e06dc0ebb7922b5e396f1e3286f2e6682dae84b6cd34c37ae46031618ca8f7f4ace8ef20b69adb4ed0618e4867940921953e464dbc2ee1d3156a7d716c34579edec12580c86178bc92ec0679c01ce01e84d0d2650973a9deea7657564f3450b44595bcc9ff0071305201de00c904f200f5ae73c656db567d5595a4449181b5563c73fc07ae3d3dabaeb28b559a016bb8dc79f6e7cb85a24cc283924838c7cbce79358b7b6161a9cc2db4f598c4a77c2e26de0ab3a10727eb4ddac16b9c07f6f5bffd02353fcda8fedeb7ff00a046a7f9b56dff00606a9ff3d6e3f3a3fb0354ff009eb71f9d2b315913e831eb5a7bdc4916a1668c231fb8f276a0ff0057dcd69e99a869ad791af88b4f59e5121480c0e1b67d76d36df4bbdb7d1d22823fb3b98e38cef443fbbf5eb4697a05f4dfe950dbc07e590cb3a491f98a7fd819e6b924d23d0a9cb0f32e43e1e8751ba3e4cab3c420691cb4c23f2f9abd069af6915cc86732c6cdbd22966dcd103d8e2abe8cd3be937173a940c8abbc4e8ebfbc54cffacc7f7cf7145c5d24d24b069da689ad5902b0950c66323b1a9e65d8c649bd896e6c6eeee28e3325a79731025669983e074e31deaa2c572ec6c7500af6b248c4a40e14a91fed1e0fe1552e42dbb1867ba589d81857c86ca213f3019f5ab165676b0cb81782e90442d82445e45f35b925b8e1a9fb4f22394ab168974aa6c7528ee26b7480c6ebe67f096dcb497d73e1bb2dfe7d84fbe18b08d384dc831f7400791db3d6b434af1268e751110d3eedae1f74b73388b68008daa307dd6a2b73a6c9751ea56f60d72b3c4cab1df0200e7e6c639ce33d2aa9a34e591491b4950d676f6f6ebc2c8b30b877901eca48e00ff64d5dd3f4fbbb2274f985a4724d1279ecc0ef5dcdc63df9a8aff56b5d32cb36c239a61382b0db4430e01e3a7ca76fa9f9aa5ba55d56e3ed5ab4890c728580b467f788ca7764d3a9b98cad13667575d3e58135789ae4dd64398b6a8900e549edc7359b7093a41b755b05b8592e58cac6029f201c80dfc43d8559b6d174c82cc5d2ea374b2feec453347b87deeb8ef4b6b769696112d86a06486390a290de646d9eb81fc2d4e3ee8e3692238a6bcd4a36b8b5372d6eb208e58ade5daac9ea00e807b55bd3a77b7b292ca08e386e3c94f34ddc80663cf45f5355b4b8c5f3c17b681257daa260ca4056cfcf9fc2afdc5ad8ea28e6e6fa133c4d234af28f94301c28f5a495a571b5a1652779d922bd86caddd650f6a1e3dd88fbafa64f5a8ae2dac66d477decb23471fcc26b6b65d84e3a7154efb46cfd96e26d743b3224cd732fcb20565e8a9dc5451cf15b45158a6a522b47e65ac85270c87277e57fbadcf7a9947a98df98bf67e45ee9a45cc33450897e5461b59b07839fae28b9d174eb1326a735df930190731af98c5c9c11c9c7209a8ed34abab788dda445ae23c2a79d7432dcf61f4cd16d3369404bff0008b45b6f2154746259c31270c3fe058acf999528da3721bad1add2e21ba8d5ae60d8563b1bcb92440370c4836f079c753d2af269f7772f7173653c19317972db44be52b0eec73c9c81818ef8aac2f357962b4b8d37c311dc17dcd34f777423023661e6607b6d34925f6bfa87916f636d6224b863114b597ccf2817016427d0838fc69a93ba25688bba71d1a5b58b4fd7a3732cfba38ada49d97ecaec0e18edf988de5bf2ad786db4aba996ed92ede01188e69208d9d4489c1604f20564bdcf9b6d14d05dd9dae045379cc72f1c849061fab11bbe94a7c43a44d716cf6fe2a56fb5c32416cb6d6c77c0e33e59ce08c1e73c56ad5ddc269c56e69cd69696e96f6ba6db5ebee6963864570564647039cf4c66a85fe851c6c24b883cd8e0908b8f3812594f425870df37a55db6d6749b2ba8af61ff009752abf69330937143967380bb413c75aa522182736f6ba4df4d25944d6a1a55658ddb3e77c84b1cf07d28ba349ff0d1434c9dad51efcdcec2b01d90ab8c75f97ad6ee9b6978973e63dd7d9ed9b2e26b721c2b328c9359d676ee6c609af743529302b3b0724c49e660038e995efdaa4d4bc3de21bd90d9dee9ed15b042d308f51764da0124b103e41b475359a4ea3d0ce09c5bf3193cb1699712d8693e30b82efb92e64857641961c657ae7de9d6316a7733ab47ac411cf7b0a19414605837ca0f23017e43d2a2b5b8b8b28b6dbeaa968ad88cb0815a6760a029673c9039c374ab9a68d2aead512fb53bbf2a46c79c22da2420f209fe2e7b8a9d6f61b565721bdb3866d56da1376ae86deea175963043ce10b26dce32bb947f4e702a76bc8207f3ac20b7b8965562aaf685ade3440c1395e41c13c9eb8f98038a92e154cb642df4fb792ead351f2fcb9623b7cb27ef67d4607eb5b1359f87ff00b267b5b9d3639a705765cdabb22c8ac8a0b1dbd81207d48abe47dc505291ca5dc920d56e2f0ce629e7b3937dec332ef5c4b9fba7ee1e3827b67d6a9788dee0ead26a5298667d464528c92292cabb0b31078dd80791ef5a53dbdb4de278ded94c11c8b7642c2e855db0922e4f52324714ef17c82ed4f88b53d36ceea792226183cbf954aa808411df1b7f3a8e67190926d99e742d415a4b516330501a56c955421882a4e39231cd49a65abb34918b50449244db1272a9236d5cc8a3af0339fc6b46d6dede4bd965b3d2a1606d162244f9e03338503d7e76fca92f742bb530dc0f0f3a470caccc923056452ea3672c3b906af9b9b41a6d4ac41aa433dade4ed6972bb4392bbdcb070400180e879e2a2b63a858a2a25e5a3cd1dec8e3ce5da4c6aa42e7d783c0f5ab579a1daa01713412c122bbc6b6bb81243fcb91863d3e63f8532ff4a89eca6b99acae9a2863864062da1a489461dc3370070bf5a3979753430d349d46dd2de1b882d6ed52152f70afb03e09cee3d9867a56cdbba48e96ba7cbc4c8448b3a966450a4e171c638ef8159b7e93e9f119a08b7ed6825c3bc4d249295dc62f2c9c64e7a9eb8e2a7b4f10b6a36316af70aacbbd3cb7961cc939f28ed298e701fe523a71c77a6a4dbd84ecd5ae6bd968bafac702dedc5d46502b4663e0797b7722ed1c7cccc07069fa7cb2de2092eccb1b8c18aea4383b8eef311791b4820e49c8c71deafe8b69f6cd3ed64b10f316890b08d8958f28d82be870067f0a65fe9935c594d6b641d9a69e3885cc07cd9778da40c7f08eb9f5ab0f76da3b95a2f14586a160aa8b35c2bdb95d925b08d53cb6ff0058818e028cf4ea3af39a6cd6fa06a6f2ea7a5eb76d379b202f6e97197791149cf3cb0ebc1e2a59a4b98a092d6f6c43bb1c6d5743e60763bc6d6e33fbb5eb597a969fa2a2adfded8c8e0b8645484212adc0036f195c1e9eb49bb2083524d95ae3c31ab44cb0db2d94eab68cc22565579589ddb0e79279e31e955ec343d66def2def2d7c2c93a4aac26f2e620a363d06412befd2adea767617b65f698358923891245692f4ec9546df271f98a6693797ba35c8b37d6aedf60058c3c9215428c7eb4d5ed721fc465456be33df159cfaa4d6972afb423a204f9b20138ebc71cd44f6fafda09aeac63220b50418eeadcba9643f330dbea4d4dacdc35e2d84524f22473e19e731977fbc7aaf7e95a576d34f792595a6bffe8ed0ef48d86d0ffc3bff00d9619c62a949b7b09ea65c4fa85cb086f59adc1b7fb3c723c4c10331e8b81c0f63cd581a52a5c1d32eade09edade25e8e4bceca76fe3822ab6a12f889218a4b2f115e95917e79ae0a30211b66307e957deeeeeda133cf64ce2df644268e30ab1073f7db1dcf4fc2ad2b9b35186857d434c9ed7ccbab8b6ba416e1592558b0bcf0157d4f407db156f51bcd4cd88596eede2616e5c4518c9da7ef007e9b5bdb06a18f57f14245e6e8515f34170b242be647b8295386207a639cd59d3ef6eecae8bc7e16b6756816392f7cb6190031c9f7c93cf51fc3939a525657309492914753bebf6b3679b589a56408d3b46817cd3818703fba460fa734db54b49ede6d463f0f4b2b3a949e124324b091f32e33f78ff002157a6d4f529ad925bb486172b1346047958c28fbc547a82067db9e7356ec435ae932c4965966b77dcb14a38918e57e9df8ab8bba2d6d738a62b6a2ede3d48b5c5ac19436f1794ecb9e634fe13f2ed1ff0134e375a8ddffa55adecb0389903dc0947ef908eb22f6e78fc2afeacda2dd6a118804f6dfda31042f2b0c26485f307ca7ee9ddf9d4d0da402f45969da9cb2c1736fcbcd02318bca6652b9c0e38cf4fe2a1bb18f2fbe54b4d6f54d3ed974cd4cdb5c35ddc0dd2ab2ae2700e501ceec7ddfce9ada8c977a65c596ada7c401711ceb212ca4b1ddc31e73c74abb73a25c4da7497d1e9ae616dae672a029cf7007d3ad4579a0ea2be5c5a9d9235a4f2a0b79addf0e5b6ee2083e9eb427706d524258369c67b675484c2eac4c49036e6c70083d063a56845159470c9737a6e23774902892f1650f900abb6dfba00e95850af973a5fd942bfbc69446af7010a929cf3df9ed492eb92e96c6c5eed4b796a6569a2c46c9b5be463fef743de86ae5f3272b1d0717d30d2a3bc94b4f23379938321d91c6b97053eeaf18c8e71c1e39aaf7968d7776211702480bf9f17969f3619917f87803d00e00e0549a6789758997625ada0962dcca90058ca2b2a96059ba8c923e957e6d4db4cb916b05cc0b73287531d9940044cc5be563f28ebd1be427a9a493451c77fc2a3bdff00a887fdf0f47fc2a3bdff00a887fdf0f5d47f615bff007f51ff00bf7a37ff001da3fb0adffbfa8ffdfbd1bff8ed5014755b5b5babcf284de5bc72f97fb897cd73ff005d049d2a0d2e39a286e61b79a3c83be0964678fcb7ee2965b4bd3079f15dc77573e6ff00ab922ff571d5ab3b6d5ed76ccd2ba0488398a3ff00968fdff795c533ab95f52c98b599ac625826b5fb42498b875982663ac8bcbb9e69aee4178545ca8820b058b78775e4973d8d6acda0ea735bdcded9c4fbf3906e473e5f54fd12b334998e93387859ef5d2558dad9e1c16471907ebd294637349351e847756b24df668a69e20157799a38f8707f87f0abba65845f627b49219e3786208d340d1fef5cb6e047bedaafa9eb7ac488f6906977509b95508fe6465d5c7527f9d59f0f5b4d6f6cd24ef19cbb2891e48c9589c6e6603be4af4f7a9313265b474b92cb7775e5bc8c30ed1ef5cf7345fd959ddc62fa680c66de3283ed24859571cedf73daacc17775069b33c9a26fb871b9a272498be6f958247c0cad0975a94f6d1adf5aac70ac723dc3a45218d4070407f7ad60ed0e627dfee534b3925051256b486550d10b5e5891eb503208a44d357538dcc2ace8c21dc19cf4453ee783e95ab70c7514ddf6ab6802dc36c0abe59db1ef1b87a119cd53d226964024b6fb222b5b19e469640ef2027692a7b1f4a2fcecca5072ea74d711eba8175b5d37222fddce126da7715f9703b9aa56ab75713cb0d9c5211048047186f98423e4040ee726a5365733cb22dcea2f9dc59079b1fca36f5a66a3e16b9bb36f1453cd0f972b83323a12f91d80ab1c62e3d491b58d1a78841a85b484cc85649605cb7d08a95a5d31a4834e962b86887989e549f2996523e57c77c554b18a79ef52533c51c924823962652a198700a11d17e4e4d4cd6c93dd4d71e62317b8646701d8463efe7278141a29109bdb749a3927be668df3879f8f3004ea9f4a826b69a486e23b0ded3b3c4cb2490fef01c82327b0e3ad5cbcd4b4648e4985d3b2ddb092d4c5db1c1a75bea115e4825892e036024a2d25f364654e3aff000527b0548ad18dd06286ee14b0dd7697705ba899b3b566de72e33838e47a56d6956854cfa5d85f4b6aa5c6d87782d9ea486d831c67bd7377712ea2890c12a9b71705895b8da1594161cf63902b563b33a45d45acdd7992c530516e91dc9249743bbe61c800f27d81ac024af1b17e47b7d4a5bbfecefb53ac08aac36677ed604fcddba1acf8f40926d5152cf45f22297f7e22b6bbd8e3231927231d7d6b41f5c4d2bfe24e34f50e11647bc9de421c6e076e7fe79f1d69f30bd4b999e4d4ac66171f2ada465e765cfc9c67809f2d54575317a3b149b414134b60162f2a1424948cbb8e39cc81ce0e3dbdbbd3f46b7b7b369b5183c3e1fc96e66b829b022a1233b7e7fcbbf5e29d6775a3346c97b7b71118835bdc5b5ba62355033951dfdea04bd8126b633dac97ac58c70a4f1e006c1c13f45c9fc2b44f99054775634f44d4f4ab58b6596a16f16e55b9b98d2142002139f9b9a924f17c97f3dbc16da4cf294691c9288ad10dfc383e86a9eb7697b711417969a75b48f3ca25792df017fbb824f03ebda92de7f145bdedc345a6d8d9f9f030189d3cc9b6ae7ef0fbff00d2a795a5b9a27ed12897d752f126a2f259dc6a3722eb119ff499638f0b9255811e98ac33aaea16b1edd66d668a3d8c27cea636b633f39f5ce7a77abf6b02ddb432dccf30b90bfbd1105f90606725b823dba9aa9349e1bb1bb804be12b5b8b759c3cf39b861bf72eec95fbaa73fc3de9537cb20e4b49a2d69fad2c17413c3da269de5c28245cae5e21b006e3be41ce7b62b4bc3127d9dd74fbbb61322c8ce8d2b11b62604afcc3a0c8e9df8acfb55bbbc78c69fa11689902a6a0908891dd9b943bb86c002b574cd92de496524f1cee6eb6cbe4ec884781d303a9ad1aea16e6d053aa69faa6893db5fc168f2cf2c490491452c93ac85c2932e3a632307dea1d56c6fe3b996cef163fb1bcd3bcf21badf81f2a6ef29ba74fd7deacddd9c9aa5b5ee9d6b78f14b1366ec3c599195412154faf03f2aad26a579b04fab6a7785d6cd26588dab3c639046f0bd4e01e3a554752a9bd5aec51d7748bf8a7b5f12e936329b8533c3231b00f1b94418c44bce77e79f6aa7ab5ff8bae34ffed94b086d8fd9638dcc97037b310778d9fc0338e3e9573c45a9c9a7e9167aa7f6c4f1dbfda1999668f7e187eec1455f99471d0f14be20f0f5cdb5a46354d72f2592d88133491b48812253270c7ee9c1fbbfe159cd26c5185a5732ad2e7c5b636cd1dbe9eb15bb5bfcf761b7156c83951dcff4ad1b2b7f14ea9135dea37e36c7348b6c823f2d2472f819cfdd6f7fc2b3a58f53d25e78d6d49fb52c72314557288bf219307a725867deba6d363b2b3ba4d4edb51b9d8b188a186599511c37de242f271d78e4755e6a52b482514b5326d20b813db45ab306374244ba300d8a181dbb707ef9ce39f6a9e087525f24cda51b979660b23453847dcbc1608df2f5009cfe15a7a72f876daf9047ae7951accd6e86d65f2565054925bfe7a67a6f1f7beeb7cd504b3e946dd753b69e7795a689ada151811c4328caa3b1c73b7f1ad24ec8ce52d0e4f54beb7ba8dada49b4f67bab65ba5bb8f2d2215c80c73ce4ed23fbbc715474e8219c4d776fa9c48b1332c933c3fbc0d850c54ff0e30327b56fcba569ab6896f1c332a3b4a908bb876ed4427073fc5ce6b0944d1df3eaf6f6b7115c4717c80c31ac528527e705396ce7bd3714ac115dce8ac7568fc98da1ba6b59ed67dcad1a6239d0003781dc9cf2fd1b8f4ab46eb52d2aea7b6b49ad24894112c530d9e5b3721f70f981ebc0eb595a2dd982e60b658d92e42ed1bedb1031fbdc9fa918abf6f023acd72120903cb988f9ec1832918e474182303bd27a15cd08cb62edadee9ed6606b77702592a811bba323063feb5b1f7b057a16eb838ef505c4da6ea862d32e752792381ccb6fe5161b8853e52863d33f27d6b334f7b296fdddb4a92e9e1b3dd3246ad0ed05db7e15ba9e060d3edec2cad629a1d221bc55b88e69105cc3ba785401c0f639fd2aeda5c88ab31754b2f0fdc34baa4cd7705b39fb3dc594f6eaeaaafb4925cf3f7c1e955a4f2e0865b7bad4e26b7d558a08a3dcceacc40dab9e9f773c7a53a6d6b563633dc586a33b6e70c96f7706c04a6c1b7776ebbbfe03507dbaf6fecfed86ed8868d3cb65b6ca49217c33eeef907f4aa525b587256d45d42d7fd162b65617ad69e5a43218f0f918fe438a75d41a6de34acfab3c6049f3798563287bb8cf2cbdb02a86ab75a95b5e48acc9e44133931db8e64642163cb7fcb3ea7e6a9a1b81a1da46757bad32e93ed055a599198e1d3748876fdd21b6fd7ad3d02da0fb4f0e5d7da26b2d5d607b14bc8c453d846e644474c6e11b7462dcf1c62a32b676d75169d7dac5edbc51c2c85e23be29428e331f5dd8eb535dea372b7305ebe90de73bc4a52195800ec4afcb9ed8aad3691a0eaa5f4fb89aee3b810192de171994ed62088cfd41cd2b5ca94f999d25bffc23fa8d89934ff10491b285923558f04900023db86e954f51d023b3fb45f699e28b88eddf64170d2fef194293c05fae79f7aa96512cf1c504da9496d2dc6c5516f709b622091d0f3938c1a9cc174f1245696af712c176d6d35b4b147f38c07ea39ed9fc6a1ddbb1938dddcca487c37a725a91addc79770ce6e3ed51eff35f254051fc23e6149aa04d3a08e6b83ab412adab452ab3063b0380853d39cf15d1da6a1a34164d6d77a6450626124858b224aaf824ee6fb840ddd383802addd5d69df6e78de70a60b7f352509bd2eb69c94dbec49e3f87aff15689d914b44705a94f0497296d7d13c5359a3491adc32013ee619ce79dc3009fc2a18ad6ee640da65c99164859e164b858f9440490e38039fbbfc55d478a6ffc39a9deb2b436d70f66e1d6cb646ca6664621771f998af5cf4e47a5719a3dce931ba584720517857cb90020a38230067b1f987e1437715b5b9d04de23f154c91349aaa3dbc8f13ac78da91b04e77af61d2a6b9f14f89ae7fd33528ed9912d888a58addd4124fdfc8e303eefe359961059ea76eb6d6334890d9405f64af88e75327cd1b7fba73f9d4f35a595afdaf597d50c718b6916db6aee7881ced54f60d4e3bd8ca525276688753bdb0bdb606f3c3b6e5e191847e55d10202546579e770ef4f1a169faa3dce754bbb54824136cba4dcb909b77e7d01e7fe0151c9e1db88d64bdbed522368142c51a33ab6e64dc1881c60f56f7aced434cd663d222b3d3255b8b89e36ba3f67979489e221feff1b7238f6ad271e57636b45ea91b9a41456874f9ee6ceeed961d8a628fcb784f7915bf8867923b56cadf7852d75491ad2e6176b6b7123b4242f983684fbcdf2ae71c86f909e4d702f789044c66d2e38964d97000642d1283bbccf938fbacc6b52c0d8dc4e34391b0d2ce61f39ddd03173d72386e9520747f63f0ff00fd02e6ff00beb40ffe2e8fb1f87ffe81737fdf5a07ff00174dfb1c7ff414b4ff00bf327f851f638ffe82969ff7e64ff0a00fffd9	(66) 99904-5963	lucasgabriel.programador@gmail.com	t
2	Carlos Eduardo Silva	123.456.789-01	1995-04-12	659874123	M	AB	1234567	SSP	SP	B	São Paulo	SP	Brasileiro	\N	(11) 98765-4321	carlos.silva@email.com	t
3	Ana Beatriz Souza	987.654.321-09	1998-07-23	658745963	F	A	2345678	SSP	RJ	A	Rio de Janeiro	RJ	Brasileira	\N	(21) 96547-8521	ana.souza@email.com	t
4	Marcos Vinicius Lima	159.753.468-20	2000-10-05	657894321	M	C	3456789	SSP	MG	C	Belo Horizonte	MG	Brasileiro	\N	(31) 94567-1234	marcos.lima@email.com	f
5	Juliana Mendes Costa	258.147.369-88	1993-01-15	652314789	F	AB	4567890	SSP	RS	B	Porto Alegre	RS	Brasileira	\N	(51) 99632-4785	juliana.costa@email.com	t
6	Rafael dos Santos	321.654.987-44	1997-12-30	657412389	M	D	5678901	SSP	PR	D	Curitiba	PR	Brasileiro	\N	(41) 98574-3210	rafael.santos@email.com	f
7	Gabriela Ferreira Lopes	741.852.963-55	1996-09-18	654789321	F	B	6789012	SSP	SC	B	Florianópolis	SC	Brasileira	\N	(48) 98745-6987	gabriela.lopes@email.com	t
8	Fernando Oliveira Ramos	963.852.741-22	1994-06-21	653214987	M	E	7890123	SSP	GO	E	Goiânia	GO	Brasileiro	\N	(62) 99856-4789	fernando.ramos@email.com	t
9	Camila Souza Andrade	852.963.741-33	2002-02-14	651478236	F	AB	8901234	SSP	BA	B	Salvador	BA	Brasileira	\N	(71) 97485-6321	camila.andrade@email.com	f
10	Diego Martins Ribeiro	369.258.147-77	1999-08-09	658974512	M	A	9012345	SSP	PE	A	Recife	PE	Brasileiro	\N	(81) 96587-4123	diego.ribeiro@email.com	t
11	Larissa Alves Moreira	741.369.852-11	1991-11-25	659874123	F	C	0123456	SSP	CE	C	Fortaleza	CE	Brasileira	\N	(85) 99874-5214	larissa.moreira@email.com	f
\.


--
-- TOC entry 3127 (class 0 OID 91548)
-- Dependencies: 220
-- Data for Name: taulasfotos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taulasfotos (id_aula, id_aluno, nome_aluno, id_instrutor, id_veiculo, data_aula, duracao, foto_istrutorincial, foto_alunoinicial, video_aula, foto_instrutorfinal, foto_alunofinal) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 66784)
-- Dependencies: 209
-- Data for Name: taulasinfo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taulasinfo (id_aula, id_aluno, id_instrutor, id_veiculo, data_aula, duracao, status, data_criacao) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 66839)
-- Dependencies: 210
-- Data for Name: taulasvid; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taulasvid (id_aula, id_aluno, nome_aluno, id_instrutor, id_veiculo, data_aula, duracao, status) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 66740)
-- Dependencies: 205
-- Data for Name: tdispositivos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tdispositivos (id_dispositivo, descricao, tipo, status, data_cadastro) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 66768)
-- Dependencies: 207
-- Data for Name: tempresa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tempresa (id_empresa, nome_empresa, cnpj_empresa, logradouro, telefone_empresa, email_empresa, data_criacao, fantasia_empresa, numero_endereco, bairro_endereco) FROM stdin;
1	Meridional Centro de Formacao de Condutores Ltda	37.482.361/0001-21	Av das Acacias	66 3531-2588	autoescolameridional@gmail.com	2025-01-12 20:18:57.84389	AUTO ESCOLA MERIDIONAL	383	Jd Botânico
\.


--
-- TOC entry 3110 (class 0 OID 66728)
-- Dependencies: 203
-- Data for Name: tinstrutores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tinstrutores (id_instrutor, nome_instrutor, cpf_instrutor, data_nascimento, telefone, email_instrutor, data_admissao, status, data_criacao) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 66870)
-- Dependencies: 212
-- Data for Name: tsaldos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tsaldos (id_saldo, id_aluno, saldo_atual, data_atualizacao) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 66885)
-- Dependencies: 214
-- Data for Name: ttransferencias; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ttransferencias (id_transferencia, id_aluno_origem, id_aluno_destino, valor, data_transferencia, descricao) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 66976)
-- Dependencies: 219
-- Data for Name: tusuarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tusuarios (id_usuario, nome_usuario, email_usuario, senha_usuario, data_criacao, id_empresa, licenca_acesso) FROM stdin;
1	admin	admin	admin	2025-01-12 20:20:21.564451	1	Dev01/24
\.


--
-- TOC entry 3108 (class 0 OID 66716)
-- Dependencies: 201
-- Data for Name: tveiculos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tveiculos (id_veiculo, modelo, marca, ano_fabricacao, placa, data_aquisicao, status, data_criacao) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 215
-- Name: talunos_id_aluno_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.talunos_id_aluno_seq', 11, true);


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 208
-- Name: taulasinfo_id_aula_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taulasinfo_id_aula_seq', 1, false);


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 204
-- Name: tdispositivos_id_dispositivo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tdispositivos_id_dispositivo_seq', 1, false);


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 206
-- Name: tempresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tempresa_id_empresa_seq', 1, true);


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 202
-- Name: tinstrutores_id_instrutor_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tinstrutores_id_instrutor_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 211
-- Name: tsaldos_id_saldo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tsaldos_id_saldo_seq', 1, false);


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 213
-- Name: ttransferencias_id_transferencia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ttransferencias_id_transferencia_seq', 1, false);


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 218
-- Name: tusuarios_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tusuarios_id_empresa_seq', 13, true);


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 217
-- Name: tusuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tusuarios_id_usuario_seq', 14, true);


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 200
-- Name: tveiculos_id_veiculo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tveiculos_id_veiculo_seq', 1, false);


--
-- TOC entry 2961 (class 2606 OID 66952)
-- Name: talunos talunos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talunos
    ADD CONSTRAINT talunos_pkey PRIMARY KEY (id_aluno);


--
-- TOC entry 2955 (class 2606 OID 66791)
-- Name: taulasinfo taulasinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasinfo
    ADD CONSTRAINT taulasinfo_pkey PRIMARY KEY (id_aula);


--
-- TOC entry 2945 (class 2606 OID 66747)
-- Name: tdispositivos tdispositivos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tdispositivos
    ADD CONSTRAINT tdispositivos_pkey PRIMARY KEY (id_dispositivo);


--
-- TOC entry 2947 (class 2606 OID 67001)
-- Name: tempresa tempresa_cnpj_empresa_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tempresa
    ADD CONSTRAINT tempresa_cnpj_empresa_key UNIQUE (cnpj_empresa);


--
-- TOC entry 2949 (class 2606 OID 66781)
-- Name: tempresa tempresa_email_empresa_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tempresa
    ADD CONSTRAINT tempresa_email_empresa_key UNIQUE (email_empresa);


--
-- TOC entry 2951 (class 2606 OID 66999)
-- Name: tempresa tempresa_fantasia_empresa_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tempresa
    ADD CONSTRAINT tempresa_fantasia_empresa_key UNIQUE (fantasia_empresa);


--
-- TOC entry 2953 (class 2606 OID 66777)
-- Name: tempresa tempresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tempresa
    ADD CONSTRAINT tempresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 2941 (class 2606 OID 66737)
-- Name: tinstrutores tinstrutores_cpf_instrutor_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tinstrutores
    ADD CONSTRAINT tinstrutores_cpf_instrutor_key UNIQUE (cpf_instrutor);


--
-- TOC entry 2943 (class 2606 OID 66735)
-- Name: tinstrutores tinstrutores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tinstrutores
    ADD CONSTRAINT tinstrutores_pkey PRIMARY KEY (id_instrutor);


--
-- TOC entry 2957 (class 2606 OID 66877)
-- Name: tsaldos tsaldos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsaldos
    ADD CONSTRAINT tsaldos_pkey PRIMARY KEY (id_saldo);


--
-- TOC entry 2959 (class 2606 OID 66891)
-- Name: ttransferencias ttransferencias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ttransferencias
    ADD CONSTRAINT ttransferencias_pkey PRIMARY KEY (id_transferencia);


--
-- TOC entry 2963 (class 2606 OID 66988)
-- Name: tusuarios tusuarios_email_usuario_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tusuarios
    ADD CONSTRAINT tusuarios_email_usuario_key UNIQUE (email_usuario);


--
-- TOC entry 2965 (class 2606 OID 66990)
-- Name: tusuarios tusuarios_licenca_acesso_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tusuarios
    ADD CONSTRAINT tusuarios_licenca_acesso_key UNIQUE (licenca_acesso);


--
-- TOC entry 2967 (class 2606 OID 66986)
-- Name: tusuarios tusuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tusuarios
    ADD CONSTRAINT tusuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2937 (class 2606 OID 66723)
-- Name: tveiculos tveiculos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tveiculos
    ADD CONSTRAINT tveiculos_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 2939 (class 2606 OID 66725)
-- Name: tveiculos tveiculos_placa_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tveiculos
    ADD CONSTRAINT tveiculos_placa_key UNIQUE (placa);


--
-- TOC entry 2974 (class 2606 OID 91554)
-- Name: taulasfotos taulasfotos_id_aula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasfotos
    ADD CONSTRAINT taulasfotos_id_aula_fkey FOREIGN KEY (id_aula) REFERENCES public.taulasinfo(id_aula);


--
-- TOC entry 2975 (class 2606 OID 91559)
-- Name: taulasfotos taulasfotos_id_instrutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasfotos
    ADD CONSTRAINT taulasfotos_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES public.tinstrutores(id_instrutor);


--
-- TOC entry 2976 (class 2606 OID 91564)
-- Name: taulasfotos taulasfotos_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasfotos
    ADD CONSTRAINT taulasfotos_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES public.tveiculos(id_veiculo);


--
-- TOC entry 2968 (class 2606 OID 66797)
-- Name: taulasinfo taulasinfo_id_instrutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasinfo
    ADD CONSTRAINT taulasinfo_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES public.tinstrutores(id_instrutor);


--
-- TOC entry 2969 (class 2606 OID 66802)
-- Name: taulasinfo taulasinfo_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasinfo
    ADD CONSTRAINT taulasinfo_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES public.tveiculos(id_veiculo);


--
-- TOC entry 2970 (class 2606 OID 66843)
-- Name: taulasvid taulasvid_id_aula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasvid
    ADD CONSTRAINT taulasvid_id_aula_fkey FOREIGN KEY (id_aula) REFERENCES public.taulasinfo(id_aula);


--
-- TOC entry 2971 (class 2606 OID 66858)
-- Name: taulasvid taulasvid_id_instrutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasvid
    ADD CONSTRAINT taulasvid_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES public.tinstrutores(id_instrutor);


--
-- TOC entry 2972 (class 2606 OID 66863)
-- Name: taulasvid taulasvid_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taulasvid
    ADD CONSTRAINT taulasvid_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES public.tveiculos(id_veiculo);


--
-- TOC entry 2973 (class 2606 OID 66991)
-- Name: tusuarios tusuarios_id_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tusuarios
    ADD CONSTRAINT tusuarios_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.tempresa(id_empresa);


-- Completed on 2025-02-22 10:24:39

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-02-22 10:24:39

--
-- PostgreSQL database cluster dump complete
--

