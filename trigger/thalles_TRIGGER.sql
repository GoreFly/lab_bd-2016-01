CREATE OR REPLACE FUNCTION atualizarFimCalendarioDataAtual()
RETURNS trigger AS $$ 

BEGIN
	NEW.dataFim=now();
	
	RETURN NEW;

END; 

$$ LANGUAGE plpgsql;
