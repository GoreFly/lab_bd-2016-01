-- Trigger para atualizar data inicio da Reuniao
CREATE OR REPLACE FUNCTION AtualizarDatasInicioReuniao()
RETURNS trigger AS $$ 
BEGIN
	NEW.periodo=now();

	RETURN NEW;
END; 
$$ LANGUAGE plpgsql;


CREATE TRIGGER DataInicioReuniao
BEFORE INSERT
ON Reuniao
FOR EACH ROW
EXECUTE PROCEDURE AtualizarDatasInicioReuniao();
