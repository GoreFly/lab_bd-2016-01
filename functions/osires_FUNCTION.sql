
-- Laboratorio de Banco de Dados
-- Nome: Osires Fernando Ribeiro Nhaga     RA: 574430


-- função que retorna codigo de Docente ao informar rg

Drop Function codDocente(rgF in varchar);

CREATE OR REPLACE FUNCTION codDocente(rgF in varchar)
RETURNS integer AS
$$
declare 
DocnteCodigo integer;
begin
   DocnteCodigo:=Docente.codigo
   from Pessoa, Docente 
   where rgF=rg and rgF=pessoa_rg and rg=pessoa_rg;

   return DocnteCodigo;
END;
$$
LANGUAGE 'plpgsql';

=======================================

-- função que retorna email de Docente ao informar rg

Drop Function EmailDocente(rgF in varchar);

CREATE OR REPLACE FUNCTION EmailDocente(rgF in varchar)
RETURNS varchar AS
$$
declare 
DocenteEmail varchar;
begin
   DocenteEmail:=Pessoa.email
   from Pessoa, Docente 
   where rgF=rg and rgF=pessoa_rg and rg=pessoa_rg;

   return DocenteEmail;
END;
$$
LANGUAGE 'plpgsql';

--------------

select EmailDocente('610179526');


