CREATE OR REPLACE VIEW view_registroreunioes
AS
SELECT a.Reuniao_numero AS "Numero Reuniao", r.dataInicio AS "Data Inicio"
FROM Ata As a, Reuniao AS r
WHERE a.Reuniao_numero = r.numero;

SELECT * FROM view_registroreunioes;
