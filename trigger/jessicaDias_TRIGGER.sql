-- Verifica se o número de créditos da atividade complementar cadastrada é par.
CREATE OR REPLACE FUNCTION public.insertatcompver_proc()
  RETURNS trigger AS
$BODY$
begin
	if NEW.creditos % 2 = 0 then
		return NEW;
	else
		raise exception 'Número de créditos por semestre incorreto.'
			using hint = 'O número de créditos deve ser par.';
	end if;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insertatcompver_proc()
  OWNER TO postgres;
  
  -- Verifica se a sigla do campus existe
CREATE OR REPLACE FUNCTION public.insertdeptover_proc()
  RETURNS trigger AS
$BODY$
begin
	if NEW.campus_sigla is not null and not exists(select 1 from vw_campus where sigla = NEW.campus_sigla) then
		raise exception 'Campus --> % não existe/incorreto.', NEW.campus_sigla;
		return null;
	else
		return NEW;
	end if;

end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insertdeptover_proc()
  OWNER TO postgres;
