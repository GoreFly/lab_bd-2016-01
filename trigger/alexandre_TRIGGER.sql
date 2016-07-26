--Trigger para testar se um Projeto Politico Pedagogico é nao-obrigatorio, nao-optativo e nao-eletivo ao mesmo tempo (inconsistencia)

CREATE OR REPLACE FUNCTION VerificaInconsistencia()
RETURNS trigger AS $$ 
BEGIN
	IF new.ProjetoPoliticoPedagogico.Optativa == False AND new.ProjetoPoliticoPedagogico.Obrigatoria == False AND new.ProjetoPoliticoPedagogico.Eletiva == False then
	
	RETURN;
	
END; 
$$ LANGUAGE plpgsql;


CREATE TRIGGER TestarInconsistencia
BEFORE INSERT
ON ProjetoPoliticoPedagogico
FOR EACH ROW
EXECUTE PROCEDURE VerificaInconsistencia();