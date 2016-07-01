-- função que retorna nome de EMPRESA ao informar cpnj

CREATE OR REPLACE FUNCTION nomeEmpresa(cnpjEmpresa in bigint)
RETURNS integer AS
$$
declare 
nomeE varchar;
begin
   nomeE := Empresa.nome
   from Empresa
   where cpnjEmpresa = cnpj;

   return nomeE;
END;
$$
LANGUAGE 'plpgsql';


-- funcao que retorna nome do CURSO ao informar codigo
CREATE OR REPLACE FUNCTION nomeCurso(codigoCurso in integer)
RETURNS integer AS
$$
declare 
nomeC varchar;
begin
   nomeC := Curso.nome
   from Curso
   where codigoCurso = codigo;

   return nomeC;
END;
$$
LANGUAGE 'plpgsql';
