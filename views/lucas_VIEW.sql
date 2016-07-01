CREATE OR REPLACE VIEW view_nomesdisciplinasprerequisitos
AS
SELECT d.nome AS "Nome Disciplina Pré-Requisito", d2.nome AS "Nome Disciplina"
FROM Disciplina AS d, Disciplina AS d2, DisciplinaPreReq AS dp
WHERE d.codigo = dp.codigoPreRequisito AND d2.codigo = dp.Disciplina_codigo;
--ORDER BY d.nome;
SELECT * FROM view_nomesdisciplinasprerequisitos;

CREATE OR REPLACE VIEW view_registroreunioes
AS
SELECT a.id_Reuniao AS "Registro Reuniões", dt.Dia AS "Dia", dt.Mes AS "Mês", dt.Ano AS "Ano"
FROM Ata As a, Data_Termino AS dt
WHERE a.id_Reuniao = dt.id

SELECT * FROM view_registroreunioes;

CREATE OR REPLACE VIEW view_relatorioturmasdisciplinasemestre
AS
SELECT  dis.codigo as "Disciplina", tur.ano as "Ano", tur.semestre as "semestre", tur.id as "Turma",
FROM    vw_disciplina as dis, vw_turma as tur,
WHERE   tur.Disciplina_codigo = dis.Codigo AND -- Seleciona Disciplina
        tur.id = sal.Turma_id AND -- Seleciona Turma
		tur.ano = anoV AND -- Seleciona Ano
		tur.semestre = semestreV; -- Seleciona Semestre

SELECT * FROM view_relatorioturmasdisciplinasemestre;