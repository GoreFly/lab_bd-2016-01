-------------------------------------
----- PROCEDIMENTOS DE INSERÇÃO -----
-------------------------------------

-- ATIVIDADE COMPLEMENTAR
create or replace function insereAtComp
	(codigo character varying(10),
	creditos integer,
	nome character varying(100))
returns void as $$
begin
	if creditos % 2 = 0 then
		insert into vw_AtComp values (codigo,creditos, nome); --número de créditos por semestre.
	else
		raise exception 'Número de créditos por semestre incorreto. (O número de créditos deve ser par)';
	end if;
end;
$$ language plpgsql called on null input;

-- RECONHECIMENTO DE CURSO

-- CAMPUS
create or replace function insereCampus
	(sigla character varying(10),
	telefone1 character varying(20),
	endereco character varying(100),
	nome character varying(50) default null,
	website character varying(100) default null,
	telefone2 character varying(20) default null)
returns void as $$
begin
	insert into vw_campus values (nome, website, sigla, telefone1, telefone2, endereco);
end;
$$ language plpgsql called on null input;

-- CENTRO
create or replace function insereCentro
	(sigla character varying(10),
	telefone1 character varying(20),
	nome character varying(50) default null,
	website character varying(100) default null,
	geo character varying(50) default null,
	telefone2 character varying(20) default null)
returns void as $$
begin
	insert into vw_centro values (nome, website, geo, sigla, telefone1, telefone2);
end;
$$ language plpgsql called on null input;

-- CONSELHO DE CURSO
-- CURSO
-- DISCIPLINA
create or replace function insereDisciplina 
	(cod integer, 
	sgla character default null, 
	nroCreditos integer default null, 
	catgr character default null)
returns void as $$
begin		
	insert into vw_disciplina values (cod, sgla, nroCreditos, catgr);
end;
$$ language plpgsql called on null input;

-- EMPRESA
-- PESSOA
-- ENDEREÇO DE PESSOA
-- TELEFONE DE PESSOA
-- NUCLEO DOCENTE
-- ESTUDANTE
-- REUNIÃO
create or replace function insereReuniao
	(p_numero integer,
	 p_pauta text default null,
	 p_dataInicio date default null)
returns void as $$
begin
	insert into vw_reuniao values (p_numero, p_pauta, p_dataInicio);
end;
$$ language plpgsql called on null input;

-- CALENDÁRIO
create or replace function insereCalendario
	(p_tipo character,
	p_dataInicio date, 
	p_diasLetivos integer,
	p_reuniao_numero integer default null,
	p_aprovado boolean default false,  
	p_Anterior_dataInicio date default null)
returns void as $$
begin
	if p_tipo <> 'p' and p_tipo <> 'e' and p_tipo <> 'a' then
		raise exception 'Tipo de Calendario inexistente --> %', p_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return;
	end if;

	if p_reuniao_numero is not null and 
		not exists(select 1 from vw_reuniao where numero = p_reuniao_numero) then
			raise exception 'Reunião #% não existe.', p_reuniao_numero;
			return;
	end if;

	insert into vw_calendario (dataInicio, diasLetivos, tipo, aprovado, Reuniao_numero) 
		values (p_dataInicio, p_diasLetivos, p_tipo, p_aprovado, p_reuniao_numero);

	if p_Anterior_dataInicio is not null then
		insert into vw_ehanterior values (p_Anterior_dataInicio, p_tipo, p_dataInicio, p_tipo);
		update vw_calendario
			set aprovado = false
			where dataInicio = p_Anterior_dataInicio;
	end if;
end;
$$ language plpgsql called on null input;

-- EVENTO
create or replace function insereEvento
	(p_calendario_data date,
	 p_calendario_tipo char,
	 p_dataInicio date,
	 p_dataFim date default null,
	 p_descricao text default null)
returns void as $$
begin
	if not exists(select 1 from vw_calendario where dataInicio = p_calendario_data) then
		raise exception 'Calendário --> % inexistente', p_calendario_data;
		return;
	end if;

	insert into vw_evento (dataInicio, dataFim, descricao, Calendario_data, Calendario_tipo)
		values (p_dataInicio, p_dataFim, p_descricao, p_calendario_data, p_calendario_tipo);

end;
$$ language plpgsql called on null input;

-- ATIVIDADE
-- DOCENTE
-- VISITA
-- FASE
-- TÉCNICO ADMINISTRATIVO
-- PROJETO POLÍTICO-PEDAGÓGICO
create or replace function insereProjetoPoliticoPedagogico
	(p_conselhocurso_id integer,
	p_curso_codigo integer default null,
	p_optativa boolean default false,
	p_obrigatoria boolean default false,
	p_eletiva boolean default false)
returns void as $$
begin
	if not exists (select 1 from vw_conselhocurso where id = p_conselhocurso_id) then
		raise exception 'Conselho de Curso --> % não existe.', p_conselhocurso_id;
		return;
	end if;

	if p_curso_codigo is not null and not exists (select 1 from vw_curso where codigo = p_curso_codigo) then
		raise exception 'Curso --> % não existe.', p_curso_codigo;
		return;
	end if;

	insert into vw_projetopoliticopedagogico 
		values (row(p_optativa, p_obrigatoria, p_eletiva), p_conselhoCurso_id, p_curso_codigo);
end;
$$ language plpgsql called on null input;

-- POLO À DISTANCIA
-- FOTOS DE UM POLO 
-- TELEFONES DE UM POLO
-- TURMA
-- SALA
-- DEPARTAMENTO
create or replace function insereDepartamento
	(nome character varying(50),
	website character varying(100),
	sigla character varying(10),
	telefone1 character varying(20),
	telefone2 character varying(20),
	endereco character varying(100),
	campus_sigla character varying(10))
returns void as $$
begin
	insert into vw_departamento values (nome, website, sigla, telefone1, telefone2, endereco, campus_sigla);
end;
$$ language plpgsql called on null input;

-- ATA
-- POSSUI (Conselho_Curso x Nucleo_Docente)
-- PERTENCE (ConselhoCurso x Pessoa)
-- PERTENCE (Disciplina x Departamento)
-- PERTENCE (Docente x NucleoDocente)
-- PERTENCE (Estudante x PoloDistancia)
-- POSSUI (Reconhecimento_Curso x Fase)
-- REALIZA (AtComp x Estudante)
create or replace function insereRealizaACE
	(rg character varying(9),
	estudante_ra integer,
	atcomp_codigo character varying(10),
	semestres integer DEFAULT 1)
returns void as $$
begin
	if not exists(select 1 from vw_estudante where rg = pessoa_rg AND estudante_ra = ra) then
		raise exception 'RG ou RA não existe/incorreto.';
		return;
	elsif not exists(select 1 from vw_atcomp where atcomp_codigo = codigo) then
		raise exception 'Código da atividade complementar não existe/incorreto.';
		return;
		else
			insert into vw_realizaace values (rg, estudante_ra, atcomp_codigo, semestres);
		end if;
end;
$$ language plpgsql called on null input;

-- REALIZA (ConselhoCurso x Reuniao)
-- COMPOE (Disciplina x Curso)
-- CURSA (Estudante x Turma)
-- DISCIPLINA PRÉ-REQUISITO (Disciplina x Disciplina)
--Procedimento para inserir na tabela DisciplinaPreReq
create or replace function insereDisciplinaPreReq 
	(discCod integer, 
	codPreReq integer)
returns void as $$
begin
	if not exists (select 1 from vw_disciplina where codigo = discCod) then
		raise exception 'Disciplina --> % não existe', discCod;
		return;
	elsif not exists (select 1 from vw_disciplina where codigo = codPreReq) then
		raise exception 'Disciplina --> % não existe', codPreReq;
		return;
	end if;

	insert into vw_disciplinaprereq values (discCod,codPreReq);
end;
$$ language plpgsql;

-- EFETUA (NucleoDocente x Reuniao)
-- ESTAGIA (Estudante x Empresa)
-- INSCREVE (Estudante x Turma)
-- MATRICULADO (Estudante x Curso)
-- CALENDARIO ANTERIOR (Calendario (Anterior) x Calendario (Posterior))
-- ENADE




-- ETC
CREATE OR REPLACE FUNCTION turmasSalasSemestre
	(anoV INTEGER, 
	semestreV INTEGER)
RETURNS void AS $$
BEGIN		
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
			tur.semestre = semestreV; -- Seleciona Semestre
END; 
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION TrocaIra
	(nRa integer, 
	novoIra integer)
RETURNS void AS $$
BEGIN
    UPDATE vw_estudante
    SET ira = novoIra
    WHERE ra = nRa;
END;
$$ LANGUAGE plpgsql;