﻿--	Procedure para realizar inserções na tabela ConselhoCurso
CREATE OR REPLACE FUNCTION insereConselhoCurso
	(novo_id integer,
	novo_representante character varying(20) default null)
RETURNS void AS $$
BEGIN
	INSERT INTO vw_conselhocurso VALUES (novo_representante, novo_id);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;


--	Procedure para realizar inserções na tabela PertenceCCP
CREATE OR REPLACE FUNCTION inserePertenceCCP
	(Pessoa_rg character varying(9),
	ConselhoCurso_id integer,
	categoria character varying(20) default null, 
	periodo date default null)
RETURNS void AS $$
BEGIN
	INSERT INTO vw_pertenceccp VALUES (Pessoa_rg, ConselhoCurso_id, categoria, periodo);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;





