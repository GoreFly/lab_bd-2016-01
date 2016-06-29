
-- Laboratorio de Banco de Dados
-- Nome: Osires Fernando Ribeiro Nhaga     RA: 574430


-- Trigger para atualizar data que docente foi cadastrado


CREATE OR REPLACE FUNCTION AtualizarDatasDoctNdocente()
RETURNS trigger AS $$ 
BEGIN
	NEW.periodo=now();

	RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

------
DROP TRIGGER DataDocente_NucleoD

CREATE TRIGGER DataDocente_NucleoD
BEFORE INSERT
ON PertenceDND
FOR EACH ROW
EXECUTE PROCEDURE atualizardatasdoctndocente();

----


INSERT INTO PertenceDND(Docente_Pessoa_rg, NucleoDocente_codigo, Docente_codigo, periodo) values('610179523', 115623850, 001525205, '02/08/2013');




