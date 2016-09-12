-- Lista os estudantes (RA) que fazem atividade complementares e ordena (EaD e Presencial)

CREATE OR REPLACE VIEW vw_estudanteatividadecomp
AS
SELECT e.ra, r.AtComp_codigo, e.presencial
FROM Estudante AS e, RealizaACE AS r
WHERE r.Estudante_ra = e.ra
ORDER BY e.presencial;
