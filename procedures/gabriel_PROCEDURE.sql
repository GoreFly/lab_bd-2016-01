create or replace function TurmasSalasSemestre
	(anoV INTEGER, 
	semestreV INTEGER)
returns void as $$
begin		
	SELECT  dep.nome as "Departamento",
	        dis.codigo as "Disciplina",
	        tur.ano as "Ano",
	        tur.semestre as "semestre",
	        tur.id as "Turma",
	        pes.pre_nome as "Docente",
	        sal.codigo as "Sala"
	FROM    vw_departamento as dep,
        	vw_pertencedd as pdd,
	        vw_disciplina as dis,
	        vw_pessoa as pes,
	        vw_docente as doc,
	        vw_turma as tur,
	        vw_sala as sal
	WHERE   tur.Docente_codigo = doc.codigo AND
	        doc.Pessoa_rg = pes.rg AND --Seleciona Docente
	        dep.sigla = pdd.Departamento_sigla AND -- Seleciona Departamento
	        dis.codigo = pdd.Disciplina_codigo AND
	        tur.Disciplina_codigo = dis.Codigo AND -- Seleciona Disciplina
	        tur.id = sal.Turma_id AND -- Seleciona Turma
			tur.ano = anoV AND -- Seleciona Ano
			tur.semestre = semestreV -- Seleciona Semestre
	ORDER BY dis.codigo;
end; 
$$ language plpgsql; 


create or replace function InsereTurma 
	(id char,
	ano integer,
	semestre integer,
	cod_disc character varying(10),
	cod_doc integer default null,
	vagas integer default null)
returns void as $$
begin	
	insert into vw_Turma values (id, ano, semestre, cod_disc, cod_doc, vagas);
end;
$$ language plpgsql;

-- SALA
create or replace function InsereSala 
	(cod character varying(20),
	t_id char,
	t_ano integer,
	t_semestre integer,
	t_disc_cod character varying(10))
returns void as $$
begin
	insert into vw_sala values (cod, t_id, t_ano, t_semestre, t_disc_cod);
end;
$$ language plpgsql;


create or replace function InserePertenceDD 
	(Departamento_sigla character varying(100),
	Disciplina_codigo character)
returns void as $$
begin		
	insert into vw_pertencedd values (Departamento_sigla, Disciplina_codigo);
end;
$$language plpgsql;

