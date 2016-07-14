--PossuiCCND		view vw_possuiccnd
--PossuiRCF			vw_possuircf
--Inscreve			vw_inscreve


--POSSUICCND
create or replace function inserePossuiccnd(
	ConselhoCurso_id integer,
	NucleoDocente_codigo integer
	)
returns void as $$
begin
	if not exists(select 1 from vw_conselhocurso where id = ConselhoCurso_id) then
		raise exception 'ID do Conselho de Curso não existe/incorreto.';
		return;
	elsif not exists(select 1 from vw_nucleodocente where codigo = NucleoDocente_codigo) then
		raise exception 'Codigo do Nucleo Docente não existe/incorreto.';
		return;
		else
			insert into vw_possuiccnd values (ConselhoCurso_id, NucleoDocente_codigo);
		end if;
end;
$$ language plpgsql called on null input;


--POSSUIRCF
create or replace function inserePossuircf(
	periodo date,
	ReconhecimentoDeCurso_codigo character varying(10),
	Fase_id character varying(10)
	)
returns void as $$
begin
	if not exists(select 1 from vw_reconhecimentodecurso where codigo = ReconhecimentoDeCurso_codigo) then
		raise exception 'Reconhecimento de Curso não existe/incorreto.';
		return;
	elsif not exists(select 1 from vw_fase where id = Fase_id) then
		raise exception 'Fase não existe/incorreto.';
		return;
		else
			insert into vw_possuircf values (periodo, ReconhecimentoDeCurso_codigo, Fase_id);
		end if;
end;
$$ language plpgsql called on null input;


--INSCREVE
create or replace function insereInscreve(
	Turma_ano integer,
	Turma_semestre integer,
	Turma_id char,
	Turma_Disciplina_codigo character varying(10),
	Estudante_ra integer,
	periodo date default null,
	deferimento boolean default null,
	prioridade_inscricao integer default null
	)
returns void as $$
begin
	if not exists(select 1 from vw_estudante where estudante_ra = ra) then
		raise exception 'RA não existe/incorreto.';
		return;
	elsif not exists(select 1 from vw_turma where id = Turma_id) then
		raise exception 'Turma não existe/incorreto.';
		return;
		else
	insert into vw_inscreve values (periodo, deferimento, prioridade_inscricao, Turma_ano, Turma_semestre, Turma_id, Turma_Disciplina_codigo, Estudante_ra);
		end if;
end;
$$ language plpgsql called on null input;