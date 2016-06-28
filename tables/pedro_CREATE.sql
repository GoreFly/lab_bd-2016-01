--Database: "Prograd"
DROP TABLE Evento;
DROP TABLE Calendario;
DROP TABLE Reuniao;

--CREATE DATABASE "Prograd"
--	WITH OWNER = postgres
--		ENCODING = 'UTF8'	
--   		TABLESPACE = pg_default
--   		LC_COLLATE = 'Portuguese_Brazil.1252'
--   		LC_CTYPE = 'Portuguese_Brazil.1252'
--   		CONNECTION LIMIT = -1;

-- reunião
CREATE TABLE Reuniao 
(
	numero integer not null unique,
	pauta text,
	dataInicio date,

	CONSTRAINT Reuniao_pk PRIMARY KEY (numero)
);

-- calendários
CREATE TABLE Calendario 
(
	dataInicio date not null,
	dataFim date,
	diasLetivos integer not null,
	tipo char not null, -- atributo discriminatório Graduação Presencial (p), EaD (e) ou Administrativo (a)
	aprovado boolean default false,
	Reuniao_numero integer,

	CONSTRAINT Calendario_Reuniao_fk FOREIGN KEY (Reuniao_numero) REFERENCES Reuniao(numero)
		ON DELETE RESTRICT,
	CONSTRAINT Calendario_pk PRIMARY KEY (dataInicio, tipo)
);

-- eventos -> dependem de calendário
CREATE TABLE Evento 
(
	id serial not null unique,
	dataInicio date not null,
	dataFim date,
	descricao text,
	Calendario_data date not null, -- data de início do calendario ao qual o evento pertence
	Calendario_tipo char not null, -- tipo do calendario ao qual o eento pertence

	CONSTRAINT Evento_Calendario_fk FOREIGN KEY (Calendario_data, Calendario_tipo) REFERENCES Calendario(dataInicio, tipo)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT Evento_pk PRIMARY KEY (Calendario_data, calendarioTipo, id)
);

-- trigger para calcular data_fim
CREATE OR REPLACE FUNCTION calcula_dataFim_proc() RETURNS trigger
AS $$
BEGIN 
	NEW.dataFim = NEW.dataInicio + INTERVAL '1' DAY * NEW.diasLetivos;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calcula_dataFim_trigger BEFORE INSERT OR UPDATE
ON Calendario FOR EACH ROW
EXECUTE PROCEDURE calcula_dataFim_proc ();

-- EhAnterior (Calendario (Anterior) x Calendario (Posterior))
CREATE TABLE EhAnterior
{
	Anterior_dataInicio date not null,
	Anterior_tipo char not null,
	Posterior_dataInicio date not null,
	Posterior_tipo char not null,

	CONSTRAINT Calendario_Anterior_fk FOREIGN KEY (Anterior_dataInicio, Anterior_tipo) REFERENCES Calendario (dataInicio, tipo),
	CONSTRAINT Calendario_Posterior_fk FOREIGN KEY (Posterior_dataInicio, Posterior_tipo) REFERENCES Calendario (dataInicio, tipo),
	CONSTRAINT EhAnterior_pk PRIMARY KEY (Anterior_dataInicio, Anterior_tipo, Posterior_dataInicio, Posterior_tipo)
};