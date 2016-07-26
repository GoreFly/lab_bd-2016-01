-- Function: public.verifica_rg()
-- DROP FUNCTION public.verifica_rg();

--Verifica se o RG do estudante inserido está previamente cadastrado como pessoa
CREATE OR REPLACE FUNCTION public.verifica_rg()
  RETURNS trigger AS
$BODY$
begin
	if NEW.rg is not null and not exists(select 1 from vw_pessoa where rg = NEW.rg) then
		raise exception 'RG nao cadastrado.';
		return null;
	else
		return NEW;
	end if;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.verifica_rg()
  OWNER TO postgres;


-- Function: public."verificaCr_disc"()
-- DROP FUNCTION public."verificaCr_disc"();

--Verifica se o número de créditos é positivo e par
CREATE OR REPLACE FUNCTION public."verificaCr_disc"()
  RETURNS trigger AS
$BODY$
begin
	if NEW.nro_creditos <0 then
		raise exception 'Uma disciplina nao pode ter creditos negativos.';
		return null;
	else if NEW.nro_creditos %2 != 0 then
		raise exception 'Nao pode ter numero de creditos impar.';
		return null;
	else
		return NEW;
	end if;
	
	end if;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public."verificaCr_disc"()
  OWNER TO postgres;
