CREATE OR REPLACE FUNCTION relatorioTurmasSemestreAno
	(disc character varying(50), anoV INTEGER, semestreV INTEGER)
RETURNS void AS $$
BEGIN		
	select * from view_relatorioturmasdisciplinasemestre v
	where v.disciplina = disc AND
		  v.ano = anoV AND
		  v.semestre = semestreV;
END; 
$$ LANGUAGE plpgsql;
