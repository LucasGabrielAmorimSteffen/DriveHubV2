-- Tabela TEmpresa
CREATE TABLE tempresa (
	id_empresa serial4 NOT NULL,
	nome_empresa varchar(150) NOT NULL,
	cnpj_empresa varchar(19) NOT NULL,
	logradouro varchar(255) NULL,
	telefone_empresa varchar(15) NULL,
	email_empresa varchar(255) NULL,
	data_criacao timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	fantasia_empresa varchar(150) NOT NULL,
	numero_endereco varchar(5) NULL,
	bairro_endereco varchar(50) NULL,
	CONSTRAINT tempresa_cnpj_empresa_key UNIQUE (cnpj_empresa),
	CONSTRAINT tempresa_email_empresa_key UNIQUE (email_empresa),
	CONSTRAINT tempresa_fantasia_empresa_key UNIQUE (fantasia_empresa),
	CONSTRAINT tempresa_pkey PRIMARY KEY (id_empresa)
);
-- Tabela TUsuarios
CREATE TABLE tusuarios (
	id_usuario serial4 NOT NULL,
	nome_usuario varchar(100) NOT NULL,
	email_usuario varchar(255) NOT NULL,
	senha_usuario varchar(255) NOT NULL,
	data_criacao timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	id_empresa serial4 NOT NULL,
	licenca_acesso varchar(15) NOT NULL,
	CONSTRAINT tusuarios_email_usuario_key UNIQUE (email_usuario),
	CONSTRAINT tusuarios_licenca_acesso_key UNIQUE (licenca_acesso),
	CONSTRAINT tusuarios_pkey PRIMARY KEY (id_usuario),
	CONSTRAINT tusuarios_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES tempresa(id_empresa)
);
-- Tabela TAlunos
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
	telefone varchar(21) NULL,
	email varchar(255) NULL,
	ativo bool NULL,
	CONSTRAINT talunos_pkey PRIMARY KEY (id_aluno)
);
-- Tabela Tdispositivos
CREATE TABLE tdispositivos (
	id_dispositivo serial4 NOT NULL,
	descricao varchar(255) NOT NULL,
	tipo varchar(50) NOT NULL,
	status varchar(50) DEFAULT 'ativo'::character varying NULL,
	data_cadastro timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT tdispositivos_pkey PRIMARY KEY (id_dispositivo)
);
-- Tabela Tinstrutores
CREATE TABLE tinstrutores (
	id_instrutor serial4 NOT NULL,
	nome_instrutor varchar(100) NOT NULL,
	cpf_instrutor varchar(11) NOT NULL,
	data_nascimento date NOT NULL,
	telefone varchar(15) NULL,
	email_instrutor varchar(255) NULL,
	data_admissao date NOT NULL,
	status varchar(50) DEFAULT 'ativo'::character varying NULL,
	data_criacao timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT tinstrutores_cpf_instrutor_key UNIQUE (cpf_instrutor),
	CONSTRAINT tinstrutores_pkey PRIMARY KEY (id_instrutor)
);
-- Tabela TSaldos
CREATE TABLE tsaldos (
	id_saldo serial4 NOT NULL,
	id_aluno int4 NOT NULL,
	saldo_atual numeric(10, 2) DEFAULT 0.00 NOT NULL,
	data_atualizacao timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT tsaldos_pkey PRIMARY KEY (id_saldo)
);
-- Tabela TTransferencias
CREATE TABLE ttransferencias (
	id_transferencia serial4 NOT NULL,
	id_aluno_origem int4 NOT NULL,
	id_aluno_destino int4 NOT NULL,
	valor numeric(10, 2) NOT NULL,
	data_transferencia timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	descricao varchar(255) NULL,
	CONSTRAINT ttransferencias_pkey PRIMARY KEY (id_transferencia)
);
-- Tabela TVeiculos
CREATE TABLE tveiculos (
	id_veiculo serial4 NOT NULL,
	modelo varchar(100) NOT NULL,
	marca varchar(50) NOT NULL,
	ano_fabricacao int4 NOT NULL,
	placa varchar(7) NOT NULL,
	data_aquisicao date NOT NULL,
	status varchar(50) DEFAULT 'ativo'::character varying NULL,
	data_criacao timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT tveiculos_pkey PRIMARY KEY (id_veiculo),
	CONSTRAINT tveiculos_placa_key UNIQUE (placa)
);
-- Tabela TAulasInfo
CREATE TABLE taulasinfo (
	id_aula serial4 NOT NULL,
	id_aluno int4 NOT NULL,
	id_instrutor int4 NOT NULL,
	id_veiculo int4 NULL,
	data_aula timestamp NOT NULL,
	duracao int4 NOT NULL,
	status varchar(50) DEFAULT 'pendente'::character varying NULL,
	data_criacao timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT taulasinfo_pkey PRIMARY KEY (id_aula),
	CONSTRAINT taulasinfo_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES tinstrutores(id_instrutor),
	CONSTRAINT taulasinfo_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES tveiculos(id_veiculo)
);
-- Tabela TAulasVid
CREATE TABLE taulasvid (
	id_aula int4 NOT NULL,
	id_aluno int4 NOT NULL,
	nome_aluno varchar(255) NOT NULL,
	id_instrutor int4 NOT NULL,
	id_veiculo int4 NOT NULL,
	data_aula timestamp NOT NULL,
	duracao int4 NOT NULL,
	status varchar(50) DEFAULT 'pendente'::character varying NULL,
	CONSTRAINT taulasvid_id_aula_fkey FOREIGN KEY (id_aula) REFERENCES taulasinfo(id_aula),
	CONSTRAINT taulasvid_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES tinstrutores(id_instrutor),
	CONSTRAINT taulasvid_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES tveiculos(id_veiculo)
);
-- Tabela TAulasFotos
CREATE TABLE taulasfotos (
	id_aula int4 NOT NULL,
	id_aluno int4 NOT NULL,
	nome_aluno varchar(255) NOT NULL,
	id_instrutor int4 NOT NULL,
	id_veiculo int4 NOT NULL,
	data_aula timestamp NOT NULL,
	duracao int4 NOT NULL,
	foto_istrutorincial bytea NOT NULL,
	foto_alunoinicial bytea NOT NULL,
	video_aula bytea NOT NULL,
	foto_instrutorfinal bytea NOT NULL,
	foto_alunofinal bytea NOT NULL,
	CONSTRAINT taulasfotos_id_aula_fkey FOREIGN KEY (id_aula) REFERENCES taulasinfo(id_aula),
	CONSTRAINT taulasfotos_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES tinstrutores(id_instrutor),
	CONSTRAINT taulasfotos_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES tveiculos(id_veiculo)
);