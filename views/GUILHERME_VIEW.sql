CREATE OR REPLACE VIEW view_participaRC
AS
SELECT p.curso_codigo as "Cod Curso", r.pre_nome AS "Nome", r.sobre_nome AS "Sobrenome"
FROM Pessoa AS r, participaRC AS p
WHERE r.rg = p.rg
ORDER BY p.curso_codigo;
