-- Criação de Tabela Usuarios
CREATE TABLE TUSUARIOS (
    id_usuario SERIAL PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    email_usuario VARCHAR(255) UNIQUE NOT NULL,
    senha_usuario VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_empresa SERIAL REFERENCES TEmpresa (id_empresa),
    licenca_acesso VARCHAR(15) UNIQUE NOT NULL
);

-- Criação de tabela Veiculos
CREATE TABLE TVeiculos (
    id_veiculo SERIAL PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL,
    placa VARCHAR(7) UNIQUE NOT NULL,
    data_aquisicao DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'ativo',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de tabela Instrutores
CREATE TABLE TInstrutores (
    id_instrutor SERIAL PRIMARY KEY,
    nome_instrutor VARCHAR(100) NOT NULL,
    cpf_instrutor VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email_instrutor VARCHAR(255),
    data_admissao DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'ativo',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de tabela Dispositivos
CREATE TABLE TDispositivos (
    id_dispositivo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    status VARCHAR(50) DEFAULT 'ativo',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de tabela Alunos
CREATE TABLE talunos (
	id_aluno serial4 NOT NULL,
	nome_aluno varchar(255) NULL,
	cpf_aluno varchar(14) NULL,
	data_nascimento date NULL,
	renach varchar(50) NULL,
	sexo bpchar(1) NULL,
	cat_pretendida varchar(2) NULL,
	rg varchar(20) NULL,
	emissor varchar(20) NULL,
	uf varchar(2) NULL,
	cat_cnh varchar(2) NULL,
	local_nascimento varchar(100) NULL,
	uf_nascimento varchar(2) NULL,
	nacionalidade varchar(100) NULL,
	foto_aluno bytea NULL,
	CONSTRAINT talunos_pkey PRIMARY KEY (id_aluno)
);

-- Criação de Tabela Empresa
CREATE TABLE TEmpresa (
    id_empresa SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(150) NOT NULL,
    cnpj_empresa VARCHAR(14) UNIQUE NOT NULL,
    endereco_empresa VARCHAR(255),
    telefone_empresa VARCHAR(15),
    email_empresa VARCHAR(255) UNIQUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de Tabela InfoAulas
CREATE TABLE TAulasInfo (
    id_aula SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL REFERENCES TAlunos(id_aluno),
    id_instrutor INT NOT NULL REFERENCES TInstrutores(id_instrutor),
    id_veiculo INT REFERENCES TVeiculos(id_veiculo),
    data_aula TIMESTAMP NOT NULL,
    duracao INT NOT NULL, -- duração em minutos
    status VARCHAR(50) DEFAULT 'pendente',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de Tabela AulasFotos
CREATE TABLE TAulasFotos(
       id_aula INT NOT NULL REFERENCES TAulasInfo(id_aula),
       id_aluno INT NOT NULL REFERENCES talunos (id_aluno),
       nome_aluno VARCHAR(255) NOT NULL references TAlunos(nome_aluno), 
       id_instrutor INT NOT NULL REFERENCES TInstrutores (id_instrutor),
       id_veiculo INT NOT NULL REFERENCES  TVeiculos (id_veiculo),
       data_aula TIMESTAMP NOT NULL,
       duracao INT NOT NULL, -- duração em minutos   
       foto_istrutorIncial Bytea NOT NULL,
       foto_alunoInicial Bytea NOT NULL,
       video_aula Bytea NOT NULL,
       foto_instrutorFinal Bytea NOT NULL,
       foto_alunoFinal Bytea NOT NULL
);

-- Criação de Tabela Video Aulas
CREATE TABLE TAulasVid (
       id_aula INT NOT NULL REFERENCES TAulasInfo(id_aula),
       id_aluno INT NOT NULL REFERENCES  TAlunos(id_aluno),
       nome_aluno VARCHAR(255) NOT NULL references TAlunos(nome_aluno), 
       id_instrutor INT NOT NULL REFERENCES TInstrutores (id_instrutor),
       id_veiculo INT NOT NULL REFERENCES  TVeiculos (id_veiculo),
       data_aula TIMESTAMP NOT NULL,
       duracao INT NOT NULL, -- duração em minutos   
       status VARCHAR(50) DEFAULT 'pendente' 
);

-- Criação de Tabela Saldos
CREATE TABLE TSaldos (
    id_saldo SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL REFERENCES TAlunos(id_aluno),
    saldo_atual DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de Tabela Transferências
CREATE TABLE TTransferencias (
    id_transferencia SERIAL PRIMARY KEY,
    id_aluno_origem INT NOT NULL REFERENCES TAlunos(id_aluno),
    id_aluno_destino INT NOT NULL REFERENCES TAlunos(id_aluno),
    valor DECIMAL(10, 2) NOT NULL,
    data_transferencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao VARCHAR(255)
);



-- DROP DE TODAS AS TABELAS DO BANCO;
DROP TABLE public.tempresa;
DROP TABLE public.tveiculos;
DROP TABLE public.ttransferencias;
DROP TABLE public.tsaldos;
DROP TABLE public.tinstrutores;
DROP TABLE public.tdispositivos;
DROP TABLE public.taulas;
DROP TABLE public.talunos; 

COMMIT WORK;