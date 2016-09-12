CREATE OR REPLACE FUNCTION AtualizarFimCalendarioDataAtual()

RETURNS trigger AS $$ 

BEGIN

	NEW.dataFim=now();



	RETURN NEW;

END; 

$$ LANGUAGE plpgsql;
