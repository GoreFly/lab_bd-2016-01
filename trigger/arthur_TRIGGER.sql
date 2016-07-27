-- TRIGGER EMPRESA

CREATE OR REPLACE FUNCTION public.insertempresa_proc()
  RETURNS trigger AS
$BODY$
begin
	if not exists(select 1 from empresa where cnpj = OLD.Empresa_cnpj) then
		raise exception 'Empresa --> % não existe/incorreta.', OLD.Empresa_cnpj;
		return null;
	end if;
	
	return NEW;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insertempresa_proc()
  OWNER TO postgres;


-- TRIGGER CURSO

CREATE OR REPLACE FUNCTION public.insertcurso_proc()
  RETURNS trigger AS
$BODY$
begin
	if not exists(select 1 from curso where codigo = OLD.Curso_codigo) then
		raise exception 'Curso --> % não existe/incorreto.', OLD.Curso_codigo;
		return null;
	elsif nome is not null and not exists(select 1 from curso where codigo = OLD.Curso_codigo) then
		raise exception 'Curso com nome --> % não existe/incorreto.', OLD.Curso_codigo;
		return null;
	end if;
	
	return NEW;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insertcurso_proc()
  OWNER TO postgres;
  
-- TRIGGER ESTAGIA

create or replace function insertEstagia_proc() 
returns trigger as $$
begin
	if not exists(select 1 from Estagia where estudante_cpf = OLD.Estagia_estudante_cpf) then
		raise exception 'CPF do Estudante --> % não existe/incorreto.', OLD.Disciplina_codigo;
		return null;
	elsif empresa_cnpj is not null and not exists(select 1 from estagia where empresa_cnpj = OLD.Estagia_empresa_cnpj) then
		raise exception 'CNPJ --> % não existe/incorreto.', OLD.Estagia_empresa_cnpj;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertEstagia_trig
before insert or update on Estagia for each row
execute procedure insertEstagia_proc();
