CREATE OR REPLACE FUNCTION TrocaIra(nRa integer, novoIra integer)
RETURN void AS $$
BEGIN
    UPDATE vw_estudante
    SET ira = novoIra
    WHERE ra = nRa;
END;
$$ LANGUAGE plpgsql;
