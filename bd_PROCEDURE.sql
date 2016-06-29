-------------------------------------
----- PROCEDIMENTOS DE INSERÇÃO -----
-------------------------------------

-- ATIVIDADE COMPLEMENTAR
create or replace function InsereAtComp
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
create or replace function InsereCampus
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
create or replace function InsereCentro
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
CREATE OR REPLACE FUNCTION insereCurso
	(codigo integer,
    website character varying(40) default null,
    nome character varying(40) default null,
    coordenador coord default null)
RETURNS void AS $$
BEGIN
    INSERT INTO vw_curso VALUES (codigo, website, nome, coordenador); 
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

-- DISCIPLINA
create or replace function InsereDisciplina 
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
CREATE OR REPLACE FUNCTION insereEmpresa
	(cnpj bigint,
    nome character varying(20) default null,
    endereco endereco default null)
RETURNS void AS $$
BEGIN
    INSERT INTO vw_empresa VALUES (cnpj, nome, endereco); 
 
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

-- PESSOA
CREATE OR REPLACE FUNCTION inserePessoa
	(rg character varying(9),
	pre_nome character varying(20) default null,
	meio_nome character varying(20) default null,
	ultimo_nome character varying(20) default null,
	email character varying(20) default null,
	email_Institucional character varying(20) default null,
	etnia character varying(15) default null,
	sexo character default null,
	dataNascimento date default null,
	nome_mae character varying(20) default null,
	nome_pai character varying(20) default null,
	cidadeNata_nome character varying(20) default null,
	cod_rec_curso character varying(10) default null,
	pais_origem character varying(20) default null,
	nacionalidade character varying(15) default null)
RETURNS void AS $$
BEGIN
	INSERT INTO vw_pessoa VALUES (rg, pre_nome, meio_nome, ultimo_nome, email, email_Institucional, etnia,
		sexo,dataNascimento, nome_mae, nome_pai, cidadeNata_nome, cod_rec_curso, pais_origem, nacionalidade);
END;
$$ language plpgsql called on null input;

-- ENDEREÇO DE PESSOA
CREATE OR REPLACE FUNCTION inserePessoaEndereco
	(Pessoa_rg character varying(9),
	rua character varying(15),
	num_casa integer,
	complemento character varying(15) default null,
	bairro character varying(15) default null,
	uf character varying(2) default null,
	cep integer default null)
RETURNS void AS $$
BEGIN

	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
		else
            insert into vw_pessoaendereco values (Pessoa_rg, rua, num_casa, complemento, bairro, uf, cep);
	end if; 
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

-- TELEFONE DE PESSOA
CREATE OR REPLACE FUNCTION inserePessoaTelefone
	(Pessoa_rg character varying(9),
	ddd integer,
	numero integer,
	tipo character varying(6),
	ramal integer)
RETURNS void AS $$
BEGIN
	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	else
        insert into vw_pessoatelefone values (Pessoa_rg, ddd, numero, ramal, tipo);
	end if;	
END;
$$ LANGUAGE plpgsql;

-- NUCLEO DOCENTE
-- ESTUDANTE
-- REUNIÃO
create or replace function InsereReuniao
	(p_numero integer,
	 p_pauta text default null,
	 p_dataInicio date default null)
returns void as $$
begin
	insert into vw_reuniao values (p_numero, p_pauta, p_dataInicio);
end;
$$ language plpgsql called on null input;

-- CALENDÁRIO
create or replace function InsereCalendario
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
create or replace function InsereEvento
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
create or replace function InsereProjetoPoliticoPedagogico
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
create or replace function InsereDepartamento
	(sigla character varying(10),
	telefone1 character varying(20),
	endereco character varying(100),
	campus_sigla character varying(10) default null,
	nome character varying(50) default null,
	website character varying(100) default null,
	telefone2 character varying(20) default null)
returns void as $$
begin
	if campus_sigla is not null and not exists(select 1 from vw_campus where sigla = campus_sigla) then
		raise exception 'Campus --> % não existe/incorreto.', campus_sigla;
		return;
	end if;

	insert into vw_departamento values (nome, website, sigla, telefone1, telefone2, endereco, campus_sigla);
end;
$$ language plpgsql called on null input;

-- ATA
-- POSSUI (Conselho_Curso x Nucleo_Docente)
-- PERTENCE (ConselhoCurso x Pessoa)
CREATE OR REPLACE FUNCTION inserePertenceCCP
	(Pessoa_rg character varying(9),
	ConselhoCurso_id integer,
	categoria character varying(20) default null, 
	periodo date default null)
RETURNS void AS $$
BEGIN
	if not exists(select 1 from vw_pessoa where rg = pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	elsif not exists(select 1 from vw_conselhocurso where id = ConselhoCurso_id) then
		raise exception 'Conselho de Curso --> % não existe/incorreto.', ConselhoCurso_id;
		return;
	end if;

	INSERT INTO vw_pertenceccp VALUES (Pessoa_rg, ConselhoCurso_id, categoria, periodo);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

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
		raise exception 'RG --> % ou RA --> % não existe/incorreto.', rg, estudante_ra;
		return;
	elsif not exists(select 1 from vw_atcomp where atcomp_codigo = codigo) then
		raise exception 'Atividade Complementar --> % não existe/incorreto.', atcomp_codigo;
		return;
	elsif exists(select 1 from vw_realizaace where realizaace.atcomp_codigo = insererealizaace.atcomp_codigo AND insererealizaace.estudante_ra = realizaace.estudante_ra) then
		update vw_realizaace
		set nrosemestres = nrosemestres + semestres;
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
create or replace function InsereDisciplinaPreReq 
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
create or replace function insereEstagia
	(Estudante_cpf character varying(15),
	Empresa_cnpj bigint,
	dataInicio date default null,
	dataTermino date default null,
	supEmpresa supervisor default null,
	supUniversidade supervisor default null,
	cartaAvaliacao text default null,
	termoCompromisso text default null)
returns void as $$
begin
	if not exists (select 1 from vw_estudante where cpf != Estudante_cpf) then
		raise exception 'CPF --> % não existe/incorreto.', Estudante_cpf;
		return;
	elsif not exists (select 1 from vw_empresa where cnpj != Empresa_cnpj) then
		raise exception 'CNPJ --> % não existe/incorreto.', Empresa_cnpj;
		return;
	else
		insert into vw_estagia values (Estudante_cpf, Empresa_cnpj, dataInicio, dataTermino, supEmpresa, 
			supUniversidade, cartaAvaliacao, termoCompromisso); 
	end if;
end;
$$ language plpgsql called on null input;

-- INSCREVE (Estudante x Turma)
-- MATRICULADO (Estudante x Curso)
-- CALENDARIO ANTERIOR (Calendario (Anterior) x Calendario (Posterior))
	-- automaticamente inserido pelo InsereCalendario()
	
-- ENADE
CREATE OR REPLACE FUNCTION insereEnade
	(realizacao date,
	Estudante_ra integer ,
	Pessoa_rg character varying(9),
	nota numeric(4,2) default null,
	Curso_codigo integer default null)
RETURNS void AS $$
BEGIN
	if not exists(select 1 from vw_estudante where rg = pessoa_rg AND estudante_ra = ra) then
		raise exception 'RG --> % ou RA --> % não existe/incorreto.', Pessoa_rg, Estudante_ra;
		return;
	elsif not exists(select 1 from vw_curso where codigo != Curso_codigo) then
		raise exception 'Curso --> % não existe/incorreto.', Curso_codigo;
		return;
	else
        INSERT INTO vw_enade VALUES (realizacao, nota, Estudante_ra, Pessoa_rg, Curso_codigo); 
	end if;
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;




-- ETC
CREATE OR REPLACE FUNCTION TurmasSalasSemestre
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

create or replace function TurmasSalasSemestreAtual
	(semestre_atual integer)
returns void as $$
begin
	select * 
		from vw_turmasSalasTodosSemestres as vw
		where vw.ano = date_part('year', now()) and
			  vw.semestre = semestre_atual; 
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION AlteraCodigoTecAdm
	(codigoact integer, 
	newcodigo integer)
RETURNS void AS $$
BEGIN
	UPDATE TecADM
	SET codigo = newcodigo
	WHERE TecADM.codigo = codigoact;
END;
$$
LANGUAGE plpgsql;