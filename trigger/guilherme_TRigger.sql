CREATE OR REPLACE FUNCTION update_RECONHECIMENTODECURSO()
RETURNS trigger AS $$ 
BEGIN
      IF NOT EXISTS(SELECT 1 FROM ReconhecimentoDeCurso where codigo = OLD.codigo) THEN
      RETURN NULL;
      ELSE
      UPDATE ReconhecimentoDeCurso SET codigoR = NEW.codigoR WHERE codigo = OLD.codigo
    ENDIF;
END;
$C$ LANGUAGE plpgsql;


CREATE TRIGGER update_recRC
BEFORE UPDATE
ON ReconhecimentoDeCurso
FOR EACH ROW
EXECUTE PROCEDURE update_RECONHECIMENTODECURSO();
