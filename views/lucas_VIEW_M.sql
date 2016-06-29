CREATE OR REPLACE VIEW view_nomesdisciplinasprerequisitos
AS
SELECT d.nome AS "Nome Disciplina Pré-Requisito", d2.nome AS "Nome Disciplina"
FROM Disciplina AS d, Disciplina AS d2, DisciplinaPreReq AS dp
WHERE d.codigo = dp.codigoPreRequisito AND d2.codigo = dp.Disciplina_codigo;
--ORDER BY d.nome;

SELECT * FROM view_nomesdisciplinasprerequisitos;
