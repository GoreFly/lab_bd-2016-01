CREATE OR REPLACE FUNCTION public.insertRealizaACE_proc()
  RETURNS trigger AS
$BODY$
begin
	if not exists(select 1 from Estudante where pessoa_rg = NEW.pessoa_rg AND ra = NEW.ra) then
		raise exception 'RG ou RA não existe/incorreto.';
		return null;
	elsif not exists(select 1 from AtComp where codigo = NEW.codigo) then
		raise exception 'Código da atividade complementar não existe/incorreto.';
		return null;
		elsif exists(select 1 from RealizaACE where realizaace.atcomp_codigo = insererealizaace.atcomp_codigo AND insererealizaace.estudante_ra = realizaace.estudante_ra) then
			update RealizaACE
			set nrosemestres = nrosemestres + semestres;
			return null;
		end if;
	
	return NEW;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insertRealizaACE_proc()
  OWNER TO postgres;
