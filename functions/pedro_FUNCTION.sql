-- Retorna o texto referente ao status de uma disciplina
create or replace function DecodeStatus(status char)
returns text as $$
begin
	case 
		when status='c' then return 'CANCELADA';
		when status='t' then return 'TRANCADA';
		when status='r' then return 'REPROVADO';
		when status='a' then return 'APROVADO';
		else return 'DESCONHECIDO';
	end case;
end;
$$ language plpgsql;

-- Retorna o histórico de um estudante, dado o RA
create or replace function GeraHistorico(p_estudante_ra integer)
returns table (
	  disciplina text
	, turma text
	, creditos integer
	, nota numeric(4,2)
	, frequencia numeric(4,2)
	, status text) as $$
begin
	return query
	select 	d.codigo::text || ' - ' || d.nome::text as "Disciplina"
			, t.ano::text || '/' || t.semestre::text || '-' || t.id::text as "Turma"
			, d.nro_creditos as "Créditos"
			, c.media as "Nota"
			, c.frequencia as "Frequencia"
			, DecodeStatus(c.status) as "Status"
	from  vw_disciplina d
		, vw_turma t
		, vw_cursa c
	where 	c.Estudante_ra = p_estudante_ra
			and c.Turma_Disciplina_codigo = t.Disciplina_codigo
			and c.Turma_id = t.id
			and c.Turma_ano = t.ano
			and c.Turma_semestre = t.semestre
			and t.Disciplina_codigo = d.codigo
	order by  t.ano
			, t.semestre
			, d.codigo;
end;
$$ language plpgsql;