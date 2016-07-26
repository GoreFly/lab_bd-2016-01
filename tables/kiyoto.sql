--Database: "Prograd"
DROP TABLE Disciplina;
DROP TABLE TelefonePolo;
DROP TABLE FotosPolo;
DROP TABLE PoloDistancia;
DROP TABLE Estudante;
 
CREATE DATABASE "Prograd"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;

 CREATE TABLE Estudante(
	RA INT CONSTRAINT estudante_PK  primary key,
	RG CHAR(9) NOT NULL,
	AnoConcEM CHAR(4),
	IRA INT NOT NULL,
	Presencial CHAR(1), -- atributo descriminatório: Presencial(s) ou Distancia(n) (7.2.1 - C Elmasri)
	Graduando BOOLEAN, -- Flag de reconhecimento Estudante Graduando
	PosGraduando BOOLEAN -- Flag de reconhecimento Estudante Pós Graduando(7.2.1 - D Elmasri)
 );

 CREATE TABLE PoloDistancia(
	Nome CHAR(12) CONSTRAINT Polo_PK primary key,
	RA_estudante INT,
	CEP CHAR(10),
	Rua CHAR(40),
	Complemento CHAR(20),
	Bairro CHAR(20),
	Cidade CHAR(20),
	UF CHAR(2),
	Pais CHAR(10),
	PontoGeoreferenciado CHAR(50),
	Coordenador_PreNome CHAR(12),
	Coordenador_SobreNome CHAR (20),
	Coordenador_email1 CHAR(20),
	Coordenador_email2 CHAR(20),
	Coordenador_telefone1 CHAR(20),
	Coordenador_telefone2 CHAR(20),
	Tutor_PreNome CHAR(12),
	Tutor_SobreNome CHAR(20),
	Tutor_email1 CHAR(20),
	Tutor_email2 CHAR(20),
	Tutor_telefone1 CHAR(20),
	Tutor_telefone2 CHAR(20),
	CONSTRAINT polo_FK foreign key (RA_estudante) references Estudante(RA)
 );
 
CREATE TABLE FotoPolo(
	Num_foto INT CONSTRAINT foto_PK primary key,
	Nome CHAR(12),
	Imagem CHAR(20),
	CONSTRAINT foto_FK foreign key (Nome) references PoloDistancia(Nome)
);

CREATE TABLE TelefonePolo(
	Tipo CHAR(10) CONSTRAINT Telefone_PK primary key,
	Nome CHAR(12),
	DDD CHAR(3),
	Fone CHAR(10),
	Ramal CHAR(5),
	Origem CHAR(10),
	CONSTRAINT Telefone_FK foreign key (Nome) references PoloDistancia(Nome)
);

CREATE TABLE Disciplina(
	Codigo CHAR(10) CONSTRAINT Disciplina_PK primary key,
	Sigla CHAR(7),
	Nro_creditos INT,
	--Vezes_Realizadas INT,
	--DataHorario DateTime, --(Não é atributo de turma?)
	Categoria CHAR(20)
	
);

INSERT INTO Estudante VALUES(
	407704,
	'37672173x',
	'2010',
	'10000',
	's', -- atributo descriminatório: Presencial(s) ou Distancia(n) (7.2.1 - C Elmasri)
	true, -- Flag de reconhecimento Estudante Graduando
	false
);

INSERT INTO Estudante VALUES(
	564898,
	'987471658',
	'1999',
	'16000',
	's', -- atributo descriminatório: Presencial(s) ou Distancia(n) (7.2.1 - C Elmasri)
	false, -- Flag de reconhecimento Estudante Graduando
	true
);

INSERT INTO Estudante VALUES(
	985589,
	'7658375679',
	'2005',
	'12335',
	'n', -- atributo descriminatório: Presencial(s) ou Distancia(n) (7.2.1 - C Elmasri)
	false, -- Flag de reconhecimento Estudante Graduando
	true
);

INSERT INTO PoloDistancia VALUES(
	'Sao Carlos',
	985589,
	'13564350',
	'Americo Jacomino Canhoto',
	'Bloco Portugal',
	'Nova Sta Paula',
	'Sao Carlos',
	'SP',
	'Brasil',
	'(13,456132),(86,45623)',
	'Bruce',
	'Wayne',
	'bruce@wayne.com',
	'notBatman@wayne.com',
	'16-981075230',
	'19-993434774',
	'Jason',
	'Todd',
	'redhood@wayne.com',
	'robin@wayne.com',
	'19-32876266',
	'16-34153334'
);

INSERT INTO FotoPolo VALUES(
	1,
	'Sao Carlos',
	':)'
);

INSERT INTO FotoPolo VALUES(
	2,
	'Sao Carlos',
	':´('
);

INSERT INTO TelefonePolo VALUES(
	'Celular',
	'Sao Carlos',
	'019',
	'993434774',
	'321',
	'Celular1'
);

INSERT INTO TelefonePolo VALUES(
	'Fixo',
	'Sao Carlos',
	'016',
	'34153334',
	'321',
	'Fixo1'
);

INSERT INTO Disciplina VALUES(
	'08806',
	'Calculo',
	4,
	--Vezes_Realizadas INT,
	--DataHorario DateTime, --(Não é atributo de turma?)
	'Obrigatoria'
	
);

INSERT INTO Disciplina VALUES(
	'562312',
	'LabBD',
	2,
	--Vezes_Realizadas INT,
	--DataHorario DateTime, --(Não é atributo de turma?)
	'Obrigatoria'
	
);


