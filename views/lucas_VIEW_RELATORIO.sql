CREATE OR REPLACE VIEW view_relatorioturmasdisciplinasemestre
AS
SELECT  dis.codigo as "Disciplina", tur.ano as "Ano", tur.semestre as "semestre", tur.id as "Turma", tur.vagas as "Vagas"
FROM    vw_disciplina as dis, vw_turma as tur
WHERE   tur.Disciplina_codigo = dis.Codigo -- Seleciona Disciplina
ORDER BY tur.ano, tur.semestre;
		
SELECT * FROM view_relatorioturmasdisciplinasemestre;
