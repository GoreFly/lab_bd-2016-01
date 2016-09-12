--Listar Pós graduandos
CREATE OR REPLACE VIEW vw_AlunosPosComp
AS 
SELECT e.RA, e.RG
FROM Estudante AS e
WHERE e.PosGraduando = true
ORDER BY e.RA;


--Listar graduandos
CREATE OR REPLACE VIEW vw_AlunosGradComp
AS 
SELECT e.RA, e.RG
FROM Estudante AS e
WHERE e.Graduando = true
ORDER BY e.RA;

--Listar maiores IRAs da graduação 
CREATE OR REPLACE VIEW vw_MaiorIRAGrad
AS 
SELECT e.IRA, e.RA
FROM Estudante AS e
WHERE e.Graduando = true
ORDER BY e.IRA;



