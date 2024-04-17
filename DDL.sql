CREATE SCHEMA login_registros;
CREATE SCHEMA pessoas;
CREATE SCHEMA saude;
CREATE SCHEMA endereco;
CREATE SCHEMA despesas;

CREATE TABLE pessoas.pessoa (
    idpessoa SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(15),
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro DATE,
    ultimo_acesso TIMESTAMP
);

CREATE TABLE pessoas.usuario (
	idusuario SERIAL PRIMARY KEY NOT NULL,
	matricula VARCHAR(45) NOT NULL,
	cargo VARCHAR(45) NOT NULL, 
	Ultimo_login TIMESTAMP NOT NULL,
	id_pessoa INT REFERENCES pessoas.pessoa (idpessoa) -- A FK deve referenciar o schema e a tabela
);

CREATE TABLE pessoas.administrador (
	idadministrador SERIAL PRIMARY KEY NOT NULL,
	matricula VARCHAR(45) NOT NULL,
	cargo VARCHAR(45) NOT NULL, 
	Ultimo_login TIMESTAMP NOT NULL,
	id_pessoa INT REFERENCES pessoas.pessoa (idpessoa) 
);

CREATE TABLE pessoas.paciente (
	idpaciente SERIAL PRIMARY KEY NOT NULL,
	cartao_sus VARCHAR(45) NOT NULL,
	autorizacao_laudo_medico VARCHAR(45)
	--id_viagem INT REFERENCES despesas.viagem (idviagem),
	-- id_tipo_transporte INT REFERENCES despesas.tipo_transporte (idtipo_transporte),
	-- id_especialidade INT REFERENCES saude.especialidade (idespecialidade),
	--id_pessoa INT REFERENCES pessoas.pessoa (idpessoa)
);

ALTER TABLE pessoas.paciente
ADD COLUMN id_viagem INT,
ADD COLUMN id_tipo_transporte INT,
ADD COLUMN id_especialidade INT,
ADD COLUMN id_pessoa INT;

ALTER TABLE pessoas.paciente
ADD CONSTRAINT FK_id_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoas.pessoa (idpessoa),
ADD CONSTRAINT FK_id_viagem FOREIGN KEY (id_viagem) REFERENCES despesas.viagem (idviagem),
ADD CONSTRAINT FK_id_tipo_transporte FOREIGN KEY (id_tipo_transporte) REFERENCES despesas.tipo_transporte (idtipo_transporte),
ADD CONSTRAINT FK_id_especialidade FOREIGN KEY (id_especialidade) REFERENCES saude.especialidade (idespecialidade);

CREATE TABLE pessoas.acompanhante_paciente (
	idacompanhante_paciente SERIAL PRIMARY KEY NOT NULL,
	-- id_viagem INT REFERENCES despesas.viagem (idviagem),
	id_paciente INT REFERENCES pessoas.paciente (idpaciente),
	id_pessoa INT REFERENCES pessoas.pessoa (idpessoa)
	-- id_tipo_transporte INT REFERENCES despesas.tipo_transporte (idtipo_transporte) 
);

ALTER TABLE pessoas.acompanhante_paciente
ADD COLUMN id_viagem INT,
ADD COLUMN id_tipo_transporte INT;

ALTER TABLE pessoas.acompanhante_paciente
ADD CONSTRAINT FK_id_tipo_transporte FOREIGN KEY (id_tipo_transporte) REFERENCES despesas.tipo_transporte (idtipo_transporte),
ADD CONSTRAINT FK_id_viagem FOREIGN KEY (id_viagem) REFERENCES despesas.viagem(idviagem);

CREATE TABLE login_registros.login (
	idlogin SERIAL PRIMARY KEY NOT NULL,
	matricula VARCHAR (45) NOT NULL,
	senha VARCHAR (45) NOT NULL,
	senha_esquecida VARCHAR (45) NOT NULL,
	login VARCHAR (45) NOT NULL,
	id_usuario INT REFERENCES pessoas.usuario (idusuario),
	id_administrador INT REFERENCES pessoas.administrador (idadministrador)
);

CREATE TABLE login_registros.cadastro_paciente (
	idcadastro_paciente SERIAL PRIMARY KEY NOT NULL, 
	data_cadastro DATE NOT NULL,
	id_usuario INT REFERENCES pessoas.usuario (idusuario),
	id_administrador INT REFERENCES pessoas.administrador (idadministrador)
);

CREATE TABLE despesas.viagem (
	idviagem SERIAL PRIMARY KEY NOT NULL,
	origem VARCHAR(45) NOT NULL,
	destino VARCHAR(45) NOT NULL,
	data_ida DATE NOT NULL,
	data_retorno DATE NOT NULL,
	status VARCHAR(45) NOT NULL,
	valor_ida DECIMAL(10,2) NOT NULL,
	valor_volta DECIMAL(10,2) NOT NULL,
	valor_total DECIMAL(10,2) NOT NULL,
	detalhes VARCHAR(200) NOT NULL,
	id_paciente INT REFERENCES pessoas.paciente (idpaciente)
	-- id_especialidade INT REFERENCES despesas.especialidade (idespecialidade),
	-- id_tipo_transporte_ida INT REFERENCES despesas.tipo_transporte (idtipo_transporte),
	-- id_tipo_transporte_volta INT REFERENCES despesas.tipo_transporte (idtipo_transporte)
);

ALTER TABLE despesas.viagem
ADD COLUMN id_especialidade INT,
ADD COLUMN id_tipo_transporte_ida INT,
ADD COLUMN id_tipo_transporte_volta INT;

ALTER TABLE despesas.viagem
ADD CONSTRAINT FK_id_tipo_transporte_ida FOREIGN KEY (id_tipo_transporte_ida) REFERENCES despesas.tipo_transporte (idtipo_transporte),
ADD CONSTRAINT FK_id_tipo_transporte_volta FOREIGN KEY (id_tipo_transporte_volta) REFERENCES despesas.tipo_transporte (idtipo_transporte),
ADD CONSTRAINT FK_id_especialidade FOREIGN KEY (id_especialidade) REFERENCES saude.especialidade (idespecialidade);

CREATE TABLE despesas.despesa (
	iddespesa SERIAL PRIMARY KEY NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	descricao VARCHAR(200) NOT NULL
	-- id_tipo_despesa INT REFERENCES despesas.tipo_despesa (idtipo_despesa),
	-- id_viagem INT REFERENCES despesas.viagem (idviagem)
);

ALTER TABLE despesas.despesa
ADD COLUMN id_tipo_despesa INT,
ADD COLUMN id_viagem INT;

ALTER TABLE despesas.despesa
ADD CONSTRAINT FK_id_tipo_despesa FOREIGN KEY (id_tipo_despesa) REFERENCES despesas.tipo_despesa(idtipo_despesa),
ADD CONSTRAINT FK_id_viagem FOREIGN KEY (id_viagem) REFERENCES despesas.viagem (idviagem);

CREATE TABLE despesas.tipo_despesa (
	idtipo_despesa SERIAL PRIMARY KEY NOT NULL,
	nome VARCHAR(45) NOT NULL,
	descricao VARCHAR(200) NOT NULL
);
CREATE TABLE despesas.tipo_transporte(
	idtipo_transporte SERIAL PRIMARY KEY NOT NULL,
	nome VARCHAR(45) NOT NULL,
	descricao VARCHAR(200) NOT NULL
);

CREATE TABLE despesas.paciente_tipo_transporte (
	idpaciente_tipo_transporte SERIAL PRIMARY KEY NOT NULL,
	id_paciente INT REFERENCES pessoas.paciente (idpaciente),
	id_tipo_transporte INT REFERENCES despesas.tipo_transporte (idtipo_transporte)
);

CREATE TABLE despesas.comprovante_agendamento(
	idcomprovante_agendamento SERIAL PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	nome_paciente VARCHAR(45) NOT NULL,
	especialidade VARCHAR(45) NOT NULL,
	data_ida DATE NOT NULL,
	data_retorno DATE NOT NULL,
	cidade_origem VARCHAR(45) NOT NULL,
	uf_origem CHAR(2) NOT NULL,
	cidade_destino VARCHAR(45) NOT NULL,
	uf_destino CHAR(2) NOT NULL,
	nome_acompanhante VARCHAR(45) NOT NULL,
	quantidade_dias int NOT NULL,
	id_paciente INT REFERENCES pessoas.paciente (idpaciente),
	id_usuario INT REFERENCES pessoas.usuario (idusuario),
	id_tipo_despesa INT REFERENCES despesas.tipo_despesa(idtipo_despesa)
);

CREATE TABLE saude.especialidade (
	idespecialidade SERIAL PRIMARY KEY NOT NULL,
	nome VARCHAR (45)NOT NULL,
	descricao VARCHAR (200) NOT NULL,
	id_paciente INT REFERENCES pessoas.paciente (idpaciente),
	id_viagem INT REFERENCES despesas.viagem (idviagem)
); 
CREATE TABLE endereco.endereco(
	idendereco SERIAL PRIMARY KEY NOT NULL,
	cep  VARCHAR (45)NOT NULL,
	rua VARCHAR (45)NOT NULL,
	bairro VARCHAR (45)NOT NULL,
	cidade VARCHAR (45)NOT NULL,
	uf CHAR (2) NOT NULL,
	id_paciente  INT REFERENCES pessoas.paciente (idpaciente),
	id_acompanhante INT REFERENCES pessoas.acompanhante_paciente (idacompanhante_paciente)
);
/* Criando chaves estangeiras:
Primeiro cria os campos e 
somente depois adiciona as FK.*/

ALTER TABLE pessoas.pessoa
DROP COLUMN ultimo_acesso;