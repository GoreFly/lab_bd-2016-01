-- Cadastrar atividades complementares. Inserir número (par) de créditos por semestre e o nome da atividade complementar.
create or replace function insereAtComp
	(codigo character varying(10),
	 creditos integer,
	 nome character varying(100))
returns void as $$
begin
	if creditos % 2 = 0 then
		insert into vw_AtComp values (codigo,creditos, nome); --número de créditos por semestre.
	else then
		raise exception 'Número de créditos por semestre incorreto. (O número de créditos é par)';
	end if;
end;
$$ language plpgsql called on null input;

-- Cadastrar Campus.
create or replace function insereCampus
	(nome character varying(50),
	 website character varying(100),
	 sigla character varying(10),
	 telefone1 character varying(20),
	 telefone2 character varying(20),
	 endereco character varying(100)
	 )
returns void as $$
begin
	insert into vw_campus values (nome, website, sigla, telefone1, telefone2, endereco);
end;
$$ language plpgsql called on null input;

-- Cadastrar Centro.
create or replace function insereCentro
	(nome character varying(50),
	 website character varying(100),
	 geo character varying(50),
	 sigla character varying(10),
	 telefone1 character varying(20),
	 telefone2 character varying(20)
	 )
returns void as $$
begin
	insert into vw_centro values (nome, website, geo, sigla, telefone1, telefone2);
end;
$$ language plpgsql called on null input;

-- Cadastrar Departamento.
create or replace function insereDepartamento
	(nome character varying(50),
	 website character varying(100),
	 sigla character varying(10),
	 telefone1 character varying(20),
	 telefone2 character varying(20),
	 endereco character varying(100),
	 campus_sigla character varying(10)
	 )
returns void as $$
begin
	insert into vw_departamento values (nome, website, sigla, telefone1, telefone2, endereco, campus_sigla);
end;
$$ language plpgsql called on null input;

create or replace function insereRealizaACE
	(rg character varying(9),
	 estudante_ra integer,
	 atcomp_codigo character varying(10),
	 semestres integer DEFAULT 1
	 )
returns void as $$
begin
	if not exists(select 1 from Estudante where rg = pessoa_rg AND estudante_ra = ra) then
		raise exception 'RG ou RA não existe/incorreto.';
		return;
	elsif not exists(select 1 from AtComp where atcomp_codigo = codigo) then
		raise exception 'Código da atividade complementar não existe/incorreto.';
		return;
		elsif exists(select 1 from RealizaACE where realizaace.atcomp_codigo = insererealizaace.atcomp_codigo AND insererealizaace.estudante_ra = realizaace.estudante_ra) then
			update RealizaACE
			set nrosemestres = nrosemestres + semestres;
			return;
			else
				insert into vw_realizaace values (rg, estudante_ra, atcomp_codigo, semestres);
		end if;
end;
$$ language plpgsql called on null input;

-- Cadastra atas
create or replace function insereAta
	(conselhocurso_id integer,
	reuniao_numero integer,
	documentos character varying(20) DEFAULT NULL)
returns void as $$
begin
	if not exists(select 1 from vw_conselhocurso where conselhocurso_id = conselhocurso.id) then
		raise exception 'ID --> % do conselho do curso não existe/incorreto.', conselhocurso_id;
		return;
	elsif not exists(select 1 from vw_reuniao where reuniao_numero = reuniao.numero) then
		raise exception 'Número da reunião --> % não existe/incorreto.', reuniao_numero;
		return;
	else
		insert into vw_ata values (documentos, conselhocurso_id, reuniao_numero);
	end if;
end;
$$ language plpgsql called on null input;

-- Cadastra Núcleo Docente
create or replace function insereNucleoDocente
	(codigo integer,
	presidente character varying(20) DEFAULT NULL)
returns void as $$
begin
	if not exists(select 1 from docente where docente.codigo = codigo) then
		raise exception 'Código --> % do docente não existe/incorreto.', conselhocurso_id;
		return;
	else
		insert into nucleodocente values (presidente, codigo);
	end if;
end;
$$ language plpgsql called on null input;
