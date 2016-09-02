--Cadastrar estudante
create or replace function insereEstudante
	(RA integer,
	 CPF character varying(15),
	 AnoConcEM character varying(4),
	 IRA integer,
	 Presencial char(1),
	 Graduando boolean,
	 PosGraduando boolean)
returns void as $$
begin
	if RA > 0 then 
		insert into vw_estudante values(RA, CPF, anoConcEM, IRA, presencial, graduando, posGraduando);
	else then
		raise exception 'RA deve ser positivo.';
		return null;
	end if;
end;
$$ language plpgsql called on null input;

--Cadastrar Polo EAD
create or replace function inserePoloDistancia
	(Nome character varying(12),
	 RA_estudante integer,
	 CEP character varying(10),
	 Rua character varying(40),
	 Complemento character varying(20),
	 Bairro character varying(20),
	 Cidade character varying(20),
	 UF character varying(2),
	 Pais character varying(10),
	 PontoGeoreferenciado character varying(50),
	 Coordenador_PreNome character varying(12),
	 Coordenador_SobreNome character varying(20),
	 Coordenador_email1 character varying(20),
	 Coordenador_email2 character varying(20),
	 Coordenador_telefone1 character varying(20),
	 Coordenador_telefone2 character varying(20),
	 Tutor_PreNome character varying(12),
	 Tutor_SobreNome character varying(20),
	 Tutor_email1 character varying(20),
	 Tutor_email2 character varying(20),
	 Tutor_telefone1 character varying(20),
	 Tutor_telefone2 character varying(20))
returns void as $$
begin
	if CEP = null then
		raise exception 'Polo deve possuir um endereco.';
	else then
		insert into vw_PoloDistancia values(Nome,RA_estudante,CEP,Rua,Complemento,Bairro,Cidade,UF,Pais,PontoGeoreferenciado,Coordenador_PreNome,Coordenador_SobreNome,Coordenador_email1,Coordenador_email2,Coordenador_telefone1,Coordenador_telefone2,Tutor_PreNome,Tutor_SobreNome,Tutor_email1,Tutor_email2,Tutor_telefone1,Tutor_telefone2);
	end if;
end;
$$ language plpgsql called on null input;

--Inserir Foto do polo EAD
create or replace function insereFotoPolo
	(Num_foto integer,
	 Nome character varying(12),
	 Imagem character varying(20))
returns void as $$
begin
	insert into vw_FotosPolo values(Num_foto, Nome, Imagem)
end;
$$ language plpgsql called on null input;

--Inserir telefone do Polo EAD
create or replace function insereTelefonePolo
	(Tipo character varying(10) ,
	 Nome character varying(12),
	 DDD character varying(3),
	 Fone character varying(10),
	 Ramal character varying(5),
	 Origem character varying(10))
returns void as $$
begin
	insert into vw_TelefonePolo values(Tipo, Nome, DDD, Fone, Ramal, Origem);
end;
$$ language plpgsql called on null input;
