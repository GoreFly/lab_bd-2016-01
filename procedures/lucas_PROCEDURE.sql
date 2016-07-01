--Procedimento para inserir na tabela Disciplina
create or replace function InsereDisciplina (cod character varying(10), sgla char, nroCreditos int, catgr char)
returns void as $$
begin		
	INSERT INTO Disciplina (Codigo, Nome, Nro_creditos, Categoria)
		VALUES (cod, sgla, nroCreditos, catgr);
end;
$$ language plpgsql;

--Procedimento para inserir na tabela DisciplinaPreReq
create or replace function InsereDisciplinaPreRequisito (discCod character varying(10), codPreReq character varying(10) )
returns void as $$
begin		
	INSERT INTO DisciplinaPreReq (Disciplina_codigo, PreRequisito_codigo)
		VALUES (discCod,codPreReq);
end;
$$ language plpgsql;

-- Procedure Relatório
CREATE OR REPLACE FUNCTION RelatorioTurmasSemestreAno
	(disc character varying(50), turmaV char, anoV INTEGER, semestreV INTEGER)
RETURNS void AS $$
BEGIN		
	select * from view_relatorioturmasdisciplinasemestre  v
	where v.disciplina = disc AND
		  v.id = turmaV AND
		  v.ano = anoV AND
		  v.semestre = semestreV;
END; 
$$ LANGUAGE plpgsql;

--PERTENCEDND
create or replace function InserePertenceDND
	(Docente_Pessoa_rg character varying(9),
	NucleoDocente_codigo integer,
	Docente_codigo integer,
	periodo timestamp)
returns void as $$
begin
	if not exists(select 1 from vw_docente where Pessoa_rg = Docente_Pessoa_rg) then
		raise exception 'RG de pessoa não existe.';
		return;
	elsif not exists(select 1 from vw_nucleodocente where codigo = NucleoDocente_codigo) then
		raise exception 'Codigo de nucleo docente não existe.';
		return;
	elsif not exists(select 1 from vw_docente where codigo = Docente_codigo) then
		raise exception 'Codigo de docente não existe.';
		return;
		else
			insert into vw_pertencednd values (Docente_Pessoa_rg, NucleoDocente_codigo, Docente_codigo, periodo);
		end if;
end;
$$ language plpgsql called on null input;
