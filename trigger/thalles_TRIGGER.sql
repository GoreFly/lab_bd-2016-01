
-- Verifica novo valor do Ira que será alterado
CREATE OR REPLACE FUNCTION public.verifica_valor_ira() 
RETURNS TRIGGER AS 
$BODY$
  BEGIN


    IF (NEW.ira < 0 OR NEW.ira > 20000) THEN
        RAISE EXCEPTION 'Valor não permitido'
    END IF;

  END;
$BODY$
   LANGUAGE plpgsql VOLATILE
    COST 100;
  ALTER FUNCTION public.verifica_valor_ira()
    OWNER TO postgres;

