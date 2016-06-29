CREATE OR REPLACE VIEW view_relatorioturmasdisciplinasemestre
AS
SELECT  dis.codigo as "Disciplina", tur.ano as "Ano", tur.semestre as "semestre", tur.id as "Turma",
FROM    vw_disciplina as dis, vw_turma as tur,
WHERE   tur.Disciplina_codigo = dis.Codigo AND -- Seleciona Disciplina
        tur.id = sal.Turma_id AND -- Seleciona Turma
		tur.ano = anoV AND -- Seleciona Ano
		tur.semestre = semestreV; -- Seleciona Semestre

SELECT * FROM view_relatorioturmasdisciplinasemestre;