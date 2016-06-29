CREATE OR REPLACE VIEW view_registroreunioes
AS
SELECT a.id_Reuniao AS "Registro Reuniões", dt.Dia AS "Dia", dt.Mes AS "Mês", dt.Ano AS "Ano"
FROM Ata As a, Data_Termino AS dt
WHERE a.id_Reuniao = dt.id

SELECT * FROM view_registroreunioes;