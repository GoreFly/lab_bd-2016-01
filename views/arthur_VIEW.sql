--View B
--Lista os RA's do estudantes que estagiam e as infos dos estagios de cada um

CREATE OR REPLACE VIEW view_infosEstagio
AS
SELECT ra as "RA", nome as "Empresa", supEmpresa as "Sup. Empresa", supUniversidade as "Sup. Universidade"
FROM Empresa, Estudante, Estagia
WHERE Empresa.cnpj = Estagia.empresa_cnpj 
AND Estudante.cpf = Estagia.estudante_cpf;

--View L
-- Mostra os nomes das empresas nas quais existem alunos estagiando

CREATE OR REPLACE VIEW view_empresasAlunosEstagiam
AS
SELECT nome as "Empresa"
FROM Empresa, Estudante, Estagia
WHERE Empresa.cnpj = Estagia.empresa_cnpj 
AND Estudante.cpf = Estagia.estudante_cpf;
