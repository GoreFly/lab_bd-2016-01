--Listar todas as disciplinas
CREATE OR REPLACE VIEW vw_Disciplina
AS
SELECT *
FROM Disciplina AS d
ORDER BY d.Codigo;

--Listar todos os estudantes
CREATE OR REPLACE VIEW vw_Estudante
AS
SELECT *
FROM Estudante AS e
ORDER BY e.RA;

--Listar todos os polos a distancia
CREATE OR REPLACE VIEW vw_PoloDistancia
AS
SELECT *
FROM PoloDistancia AS p
ORDER BY p.Nome;

--Listar todos as fotos de polos a distancia
CREATE OR REPLACE VIEW vw_FotoPolo
AS
SELECT *
FROM FotoPolo AS f
ORDER BY f.Num_foto;

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



