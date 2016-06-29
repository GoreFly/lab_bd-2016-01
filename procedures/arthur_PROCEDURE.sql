-------------------------------------------------------------------------
-- Cadastrar Curso
create or replace function insereCurso
	(codigo integer,
	website character varying(40),
	nome character varying(40),
	coordenador coord
	)
returns void as $$
begin
	if codigo = null then
		raise exception 'Valor obrigatorio "Codigo" nulo, favor inserir valor valido.';
	else then
		insert into vw_curso values (codigo, website, nome, coordenador);
	end if;
end;
$$ language plpgsql called on null input


-------------------------------------------------------------------------
-- Cadastrar Empresa
create or replace function insereEmrpesa
	(cnpj bigint,
	nome character varying(20),
	endereco endereco
	)
returns void as $$
begin
	insert into vw_empresa values (cnpj, nome, endereco);
end;
$$ language plpgsql called on null input;


-------------------------------------------------------------------------
-- Cria relacao Estagia
create or replace function insereEstagia
	(Estudante_cpf character varying(15) NOT NULL,
	Empresa_cnpj bigint NOT NULL,
	dataInicio date,
	dataTermino date,
	supEmpresa supervisor,
	supUniversidade supervisor,
	cartaAvaliacao text,
	termoCompromisso text
	 )
returns void as $$
begin
	if not exists (select 1 from Estudante where cpf != Estudante_cpf) then
		raise exception 'CPF não existe/incorreto.';
		return;
	elsif not exists (select 1 from Empresa where cnpj != Empresa_cnpj) then
		raise exception 'Codigo de empresa não existe/incorreto.';
		return;
	else
		insert into vw_estagia values (Estudante_cpf, Empresa_cnpj, dataInicio,
                         dataTermino, supEmpresa, supUniversidade, cartaAvaliacao,
                         termoCompromisso
		       ); 
	end if;
end;
$$ language plpgsql called on null input;
