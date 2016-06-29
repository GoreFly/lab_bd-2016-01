--INSERIR_Endereco

CREATE OR REPLACE FUNCTION inserePessoaEndereco
	(Pessoa_rg character varying(9) ,num_casa int,rua varchar(15), complemento varchar(15), bairro varchar(15),uf varchar(2),cep int )
RETURNS void AS $$
BEGIN

if not exists(select 1 from Pessoa where rg != pessoa_rg) then
		raise exception 'RG não existe/incorreto.';
		return;
		else
            INSERT INTO vw_PessoaEndereco (Pessoa_rg ,num_casa, rua,complemento,bairro,uf,cep)
		VALUES (
			  Pessoa_rg ,num_casa,rua, complemento, bairro,uf,cep
		       );
end if; 
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

-- INSERIR_CONTACTO
CREATE OR REPLACE FUNCTION inserePessoaTelefone
	(Pessoa_rg character varying(9) ,ddd int , numero int,tipo varchar(6), ramal int)
RETURNS void AS $$
BEGIN
if not exists(select 1 from Pessoa where rg != pessoa_rg) then
		raise exception 'RG não existe/incorreto.';
		return;
		else
               INSERT INTO vw_PessoaTelefone(Pessoa_rg ,ddd,numero,ramal,tipo)
		VALUES (
			  Pessoa_rg,ddd,numero,ramal,tipo
	       );
	       end if;	
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
-- INSERIR_RECONHECIMENTO DE CURSO

CREATE OR REPLACE FUNCTION insereReconhecimentoDeCurso 
	(codigo character varying(10))
RETURNS void AS $$
BEGIN
INSERT INTO vw_ReconhecimentoDeCurso (codigo)
		VALUES (
			  codigo
		       );
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

-- INSERIR PESSOA
CREATE OR REPLACE FUNCTION inserePessoa
	(rg varchar(9),
         pre_nome varchar(20) default null,
         meio_nome varchar(20) default null,
         ultimo_nome varchar(20) default null,
         email varchar(20) default null,
         email_Institucional varchar(20) default null,
         etnia varchar(15) default null,
         sexo char default null,
         dataNascimento date default null,
         nome_mae varchar(20) default null,
         nome_pai varchar(20) default null,
         cidadeNata_nome varchar(20) default null,
         cod_rec_curso varchar(10) default null,
         pais_origem varchar(20) default null,
         nacionalidade varchar(15) default null
         )
RETURNS void AS $$
BEGIN
INSERT INTO vw_pessoa (rg, pre_nome , meio_nome, ultimo_nome,email,email_Institucional,etnia, sexo,dataNascimento, nome_mae,
         nome_pai,
         cidadeNata_nome,
         cod_rec_curso,
         pais_origem,
         nacionalidade
        )
	VALUES (
			  rg, pre_nome , meio_nome, ultimo_nome,email,email_Institucional,etnia, sexo,dataNascimento, nome_mae,
         nome_pai,
         cidadeNata_nome,
         cod_rec_curso,
         pais_origem,
         nacionalidade);
END;

$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

--INSERIR_Enade

CREATE OR REPLACE FUNCTION inserirEnade
	(realizacao date ,
	Estudante_ra integer ,
	Pessoa_rg character varying(9),
	nota numeric(4,2) default null,
	Curso_codigo integer default null
	)
RETURNS void AS $$
BEGIN
 if not exists(select 1 from Estudante where rg != pessoa_rg AND estudante_ra != ra) then
		raise exception 'RG ou RA não existe/incorreto.';
		return;
	elsif not exists(select 1 from Curso where codigo != Curso_codigo) then
		raise exception 'Este curso não existe/incorreto.';
		return;
	else
         INSERT INTO vw_Enade (realizacao ,
	              nota ,
	              Estudante_ra,
	              Pessoa_rg,
	              Curso_codigo)
		VALUES (
			 realizacao ,
	                 nota ,
	                 Estudante_ra,
	                 Pessoa_rg,
	                 Curso_codigo
		       ); 
 End if;
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;


--INSERIR_Curso

CREATE OR REPLACE FUNCTION inserirCurso
	(codigo integer,
         website character varying(40),
         nome character varying(40),
         coordenador coord
	)
RETURNS void AS $$
BEGIN
 
         INSERT INTO vw_curso (codigo,
                               website,
                               nome,
                               coordenador)
		VALUES (
			 codigo,
                         website,
		         nome,
                         coordenador
		       ); 
 
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

--INSERIR_Empresa

CREATE OR REPLACE FUNCTION inserirEstagia
	(cnpj bigint,
         nome character varying(20),
         endereco endereco
	)
RETURNS void AS $$
BEGIN
 
         INSERT INTO vw_Empresa (cnpj,
                               nome,
                              endereco
                              )
		VALUES (
			 cnpj,
                         nome,
                         endereco
		       ); 
 
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
--INSERIR_estagia

CREATE OR REPLACE FUNCTION inserirEstagia
	(Estudante_cpf character varying(15),
         Empresa_cnpj bigint ,
         dataInicio date default null,
         dataTermino date default null,
         supEmpresa supervisor default null,
         supUniversidade supervisor default null,
         cartaAvaliacao text default null,
         termoCompromisso text default null
	)
RETURNS void AS $$
BEGIN
 if not exists(select 1 from Estudante where cpf != Estudante_cpf) then
		raise exception 'CPF não existe/incorreto.';
		return;
	elsif not exists(select 1 from Empresa where cnpj!= Empresa_cnpj) then
		raise exception 'Codigo de empresa não existe/incorreto.';
		return;
	else
         INSERT INTO vw_Estagia (Estudante_cpf,
         Empresa_cnpj  ,
         dataInicio ,
         dataTermino ,
         supEmpresa ,
         supUniversidade ,
         cartaAvaliacao ,
         termoCompromisso
                              )
		VALUES (
			 Estudante_cpf,
                         Empresa_cnpj  ,
                         dataInicio ,
                         dataTermino ,
                         supEmpresa ,
                         supUniversidade ,
                         cartaAvaliacao ,
                         termoCompromisso
		       ); 
 End if;
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

--INSERIR_estagia

CREATE OR REPLACE FUNCTION inserirEstagia
	(Estudante_cpf character varying(15),
         Empresa_cnpj bigint,
         dataInicio date default null,
         dataTermino date default null,
         supEmpresa supervisor default null,
         supUniversidade supervisor default null,
         cartaAvaliacao text default null,
         termoCompromisso text default null
	)
RETURNS void AS $$
BEGIN
 if not exists(select 1 from Estudante where cpf != Estudante_cpf) then
		raise exception 'CPF não existe/incorreto.';
		return;
	elsif not exists(select 1 from Empresa where cnpj!= Empresa_cnpj) then
		raise exception 'Codigo de empresa não existe/incorreto.';
		return;
	else
         INSERT INTO vw_Estagia (Estudante_cpf,
         Empresa_cnpj  ,
         dataInicio ,
         dataTermino ,
         supEmpresa ,
         supUniversidade ,
         cartaAvaliacao ,
         termoCompromisso
                              )
		VALUES (
			 Estudante_cpf,
                         Empresa_cnpj  ,
                         dataInicio ,
                         dataTermino ,
                         supEmpresa ,
                         supUniversidade ,
                         cartaAvaliacao ,
                         termoCompromisso
		       ); 
 End if;
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;