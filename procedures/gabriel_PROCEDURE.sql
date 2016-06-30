PROCEDURE turmasSalasSemestre(anoV IN INTEGER, semestreV IN INTEGER) IS
  BEGIN
	SELECT  dep.nome as "Departamento",
	        dis.codigo as "Disciplina",
	        tur.ano as "Ano",
	        tur.semestre as "semestre",
	        tur.id as "Turma",
	        pes.pre_nome as "Docente",
	        sal.codigo as "Sala"
	FROM    Departamento as dep,
        	PertenceDD as pdd,
	        Disciplina as dis,
	        Pessoa as pes,
	        Docente as doc,
	        Turma as tur,
	        Sala as sal
	WHERE   tur.Docente_codigo = doc.codigo AND
	        doc.Pessoa_rg = pes.rg AND --Seleciona Docente
	        dep.sigla = pdd.Departamento_sigla AND -- Seleciona Departamento
	        dis.codigo = pdd.Disciplina_codigo AND
	        tur.Disciplina_codigo = dis.Codigo AND -- Seleciona Disciplina
	        tur.id = sal.Turma_id AND -- Seleciona Turma
		tur.ano = anoV AND -- Seleciona Ano
		tur.semestre = semestreV; -- Seleciona Semestre
  END; 


create or replace function InsereSala 
	(cod character varying(20),
	t_id char,
	t_ano integer,
	t_semestre integer,
	t_disc_cod character varying(10))
returns void as $$
begin		
	INSERT INTO Visita VALUES (cod, t_id, t_ano, t_semestre, t_disc_cod);
end;
$$ language plpgsql;


create or replace function InsereTurma (id_turma char,ano_turma integer ,semest integer,cod_disc character varying(10),cod_doc integer default null,vaga_turma integer default null)
returns void as $$
begin		
	INSERT INTO Visita(id ,ano,semestre,Disciplina_codigo,Docente_codigo,vagas)
		VALUES (id_turma,ano_turma,semest ,cod_disc ,cod_doc ,vaga_turma );
end;
$$ language plpgsql;


create or replace function InserePertenceDD (sigla character varying(100),cod char)
returns void as $$
begin		
	INSERT INTO PertenceDD(Departamento_sigla,Disciplina_codigo)
		VALUES (sigla, cod);
end;

