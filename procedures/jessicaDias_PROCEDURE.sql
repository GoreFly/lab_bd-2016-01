-- Cadastrar atividades complementares.
create or replace function InsereAtComp
	(codigo character varying(10),
	creditos integer,
	nome character varying(100) default null)
returns void as $$
begin
	insert into vw_AtComp values (codigo,creditos, nome); --número de créditos por semestre.
end;
$$ language plpgsql called on null input;

-- Cadastrar Campus.
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

-- Cadastrar Centro.
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

-- Cadastrar Departamento.
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
	insert into vw_departamento values (nome, website, sigla, telefone1, telefone2, endereco, campus_sigla);
end;
$$ language plpgsql called on null input;

-- Insere relacionamento (Atividade complementar x estudante)
create or replace function insereRealizaACE
	(rg character varying(9),
	 estudante_ra integer,
	 atcomp_codigo integer,
	 semestres integer DEFAULT 1
	 )
returns void as $$
begin
	insert into vw_realizaace values (rg, estudante_ra, atcomp_codigo, semestres);
end;
$$ language plpgsql called on null input;


-- Esses outros dois não é a minha parte (fiz para ajudar) por isso não corrigi. Caso seja necessário que eu corrija, é só me avisar
-- Cadastra Técnico Administrativo
create or replace function insereTecAdm (
	rg character varying,
	codigo_tec integer default null)
	returns void as $$
begin

	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	else
		insert into vw_tecadm values (rg, codigo_tec);
	end if; 
end;
$$ language plpgsql called on null input;

-- Cadastra docente
create or replace function insereDocente (
	rg character varying,
	codigo_docente integer default null)
	returns void as $$
begin

	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	else
		insert into vw_docente values (rg, codigo_docente);
	end if; 
end;
$$ language plpgsql called on null input; 
