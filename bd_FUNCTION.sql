-- retorna o semestre atual
create or replace function SemestreAtual()
returns INTEGER as $$
declare
	sem_at INTEGER; 
begin
	sem_at := EXTRACT(month from CURRENT_DATE);
	if sem_at < 7 THEN
		sem_at := 1;
	else
		sem_at := 2;
	end if;
	return sem_at;
end;
$$ language plpgsql;

-- função que retorna nome de EMPRESA ao informar cpnj
create or replace function GetNomeEmpresa(cnpjEmpresa bigint)
returns integer as $$
declare 
	nomeE varchar;
begin
   nomeE := Empresa.nome
   from Empresa
   where cpnjEmpresa = cnpj;

   return nomeE;
end;
$$ language plpgsql;

-- funcao que retorna nome do CURSO ao informar codigo
create or replace function GetNomeCurso(codigoCurso integer)
returns integer as $$
declare 
	nomeC varchar;
begin
   nomeC := Curso.nome
   from Curso
   where codigoCurso = codigo;

   return nomeC;
end;
$$ language plpgsql;

-- Função com cursor para calcular o total de créditos complementares feitos por um determinado estudante.
create or replace function TotalCreditosCompl(ra integer)
returns integer as $$
declare
	multiplicador integer;
	carga integer;
	total_creditos integer;
	c1 cursor for select r1.nrosemestres, a.creditos
	from vw_realizaace r1, vw_atcomp a, vw_estudante e
	where r1.estudante_ra = e.ra and
	      r1.atcomp_codigo = a.codigo and
	      e.ra = totalcreditoscompl.ra;
	cur_row RECORD;
begin		
	total_creditos := 0;
	open c1;
	loop
	fetch c1 into cur_row;
	exit when not found;
		multiplicador := cur_row.nrosemestres;
		carga := cur_row.creditos;
		total_creditos := total_creditos + (carga * multiplicador);
	end loop;
	close c1;
	return total_creditos;
end;
$$ language plpgsql;

-- Função com cursor para calcular o total de créditos obrigatórios feitos por um determinado estudante.
create or replace function TotalCreditosObrig(ra integer)
returns integer as $$
declare
	total_creditos integer;
	c1 cursor for select d.nro_creditos
	from vw_disciplina d, vw_compoe co, vw_cursa cs
	where cs.estudante_ra = ra and
	      cs.status = 'a' and
	      co.disciplina_codigo = cs.turma_disciplina_codigo and
	      co.obrigatoriedade = true and
	      d.codigo = cs.turma_disciplina_codigo;
	cur_row record;	      
begin
	total_creditos := 0;
	open c1;
	loop
		fetch c1 into cur_row;
		exit when not found;
		total_creditos := total_creditos + cur_row.nro_creditos;
	end loop;
	close c1;
	return total_creditos;
end;
$$ language plpgsql;

-- Função com cursor para calcular o total de créditos não obrigatórios feitos por um determinado estudante.
create or replace function TotalCreditosNaoObrig(ra integer)
returns integer as $$
declare
	total_creditos integer;
	c1 cursor for select d.nro_creditos
	from vw_disciplina d, vw_compoe co, vw_cursa cs
	where cs.estudante_ra = ra and
	      cs.status = 'a' and
	      co.disciplina_codigo = cs.turma_disciplina_codigo and
	      co.obrigatoriedade = false and
	      d.codigo = cs.turma_disciplina_codigo;
	cur_row record;	      
begin
	total_creditos := 0;
	open c1;
	loop
		fetch c1 into cur_row;
		exit when not found;
		total_creditos := total_creditos + cur_row.nro_creditos;
	end loop;
	close c1;
	return total_creditos;
end;
$$ language plpgsql;

--
create or replace function MostraNroCreditos (ra_estudante integer, status_materia char)
returns integer as $$
declare
	nroCreditos integer;
	c1 cursor for select SUM(nro_creditos)
		from Disciplina, Estudante, Turma, Cursa
		where  Estudante.ra = ra_estudante and	
			Cursa.Estudante_ra = ra_esturante and
			Cursa.status = status_materia and
			Cursa.Turma_id = Turma.id and
			Turma.Disciplina_codigo = Disciplina.codigo;
begin
	open c1;
	fetch c1 into nroCreditos;
	close c1;
	return nroCreditos;
end;
$$ language plpgsql;

--
create or replace function MostraNroVagasTurmas (id_turma char, ano_turma integer, semestre_turma integer)
returns integer as $$
declare
	turma_cur cursor for select SUM(vagas)
			     from   turma t
			     where  t.id = id_turma and
				    t.ano = ano_turma and
				    t.semestre = semestre_turma;
	nro_vagas integer;
begin		
	open turma_cur;
	fetch turma_cur into nro_vagas;
	close turma_cur;
	return nro_Vagas;
end;
$$ language plpgsql;

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
