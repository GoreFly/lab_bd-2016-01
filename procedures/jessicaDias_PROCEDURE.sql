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