create or replace function contaDisciplinasInscritas(ra in integer, semestre in integer, ano in integer)
returns integer AS $$
declare
		nroDisciplinas integer;
		c1 cursor for
		SELECT 	COUNT(*)
		FROM	vw_inscreve
		WHERE 	vw_inscreve.Estudante_ra = ra
		AND		vw_inscreve.Turma_ano = ano
		AND		vw_inscreve.Turma_semestre = semestre;
		cur_row RECORD;
begin
	OPEN c1;
	FETCH c1 INTO nroDisciplinas;
	CLOSE c1;
	return nroDisciplinas;
end;
$$ language plpgsql;