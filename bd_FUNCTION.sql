create or replace function semestre_atual ()
returns integer as $$ 
declare
	sem_at INTEGER; 
begin
	sem_at := EXTRACT(month FROM CURRENT_DATE);
	if sem_at < 7 THEN
		sem_at := 1;
	else
		sem_at := 2;
	end if;
	return sem_at;
end;
$$ language plpgsql;

-- função que retorna nome de EMPRESA ao informar cpnj
CREATE OR REPLACE FUNCTION nomeEmpresa(cnpjEmpresa bigint)
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
LANGUAGE plpgsql;

-- funcao que retorna nome do CURSO ao informar codigo
CREATE OR REPLACE FUNCTION nomeCurso(codigoCurso integer)
RETURNS integer AS $$
declare 
	nomeC varchar;
begin
   nomeC := Curso.nome
   from Curso
   where codigoCurso = codigo;

   return nomeC;
END;
$$
LANGUAGE plpgsql;