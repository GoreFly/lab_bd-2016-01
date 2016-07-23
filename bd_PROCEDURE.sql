-------------------------------------
----- PROCEDIMENTOS DE INSERÇÃO -----
-------------------------------------

-- ATIVIDADE COMPLEMENTAR
create or replace function InsereAtComp
	(codigo character varying(10),
	creditos integer,
	nome character varying(100) default null)
returns void as $$
begin
	insert into vw_AtComp values (codigo,creditos, nome); --número de créditos por semestre.
end;
$$ language plpgsql called on null input;

-- RECONHECIMENTO DE CURSO
create or replace function InsereReconhecimentoDeCurso
	(codigo character varying(10))
returns void as $$
begin
	insert into vw_reconhecimentodecurso values (codigo);
end;
$$ language plpgsql;

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
create or replace function InsereConselhoCurso
	(id integer,
	representante character varying(20) default null)
returns void as $$
begin
	insert into vw_conselhocurso values (novo_representante, novo_id);
end;
$$ language plpgsql called on null input;

-- CURSO
create or replace function InsereCurso
	(codigo integer,
    website character varying(40) default null,
    nome character varying(40) default null,
    coordenador coord default null)
returns void as $$
begin
    insert into vw_curso values (codigo, website, nome, coordenador); 
end;
$$ language plpgsql called on null input;

-- DISCIPLINA
create or replace function InsereDisciplina 
	(cod character varying(10), 
	sgla character varying(50) default null, 
	nroCreditos integer default null, 
	catgr character varying(20) default null)
returns void as $$
begin		
	insert into vw_disciplina values (cod, sgla, nroCreditos, catgr);
end;
$$ language plpgsql called on null input;

-- EMPRESA
create or replace function InsereEmpresa
	(cnpj bigint,
    nome character varying(20) default null,
    endereco endereco default null)
returns void as $$
begin
    insert into vw_empresa values (cnpj, nome, endereco); 
 
end;
$$ language plpgsql called on null input;

-- PESSOA
create or replace function InserePessoa
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
returns void as $$
begin
	insert into vw_pessoa values (rg, pre_nome, meio_nome, ultimo_nome, email, email_Institucional, etnia,
		sexo,dataNascimento, nome_mae, nome_pai, cidadeNata_nome, cod_rec_curso, pais_origem, nacionalidade);
end;
$$ language plpgsql called on null input;

-- ENDEREÇO DE PESSOA
create or replace function InserePessoaEndereco
	(Pessoa_rg character varying(9),
	rua character varying(15),
	num_casa integer,
	complemento character varying(15) default null,
	bairro character varying(15) default null,
	uf character varying(2) default null,
	cep integer default null)
returns void as $$
begin

	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
		else
            insert into vw_pessoaendereco values (Pessoa_rg, rua, num_casa, complemento, bairro, uf, cep);
	end if; 
end;
$$ language plpgsql called on null input;

-- TELEFONE DE PESSOA
create or replace function InserePessoaTelefone
	(Pessoa_rg character varying(9),
	ddd integer,
	numero integer,
	tipo character varying(6),
	ramal integer)
returns void as $$
begin
	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	else
        insert into vw_pessoatelefone values (Pessoa_rg, ddd, numero, ramal, tipo);
	end if;	
end;
$$ language plpgsql;

-- NUCLEO DOCENTE
create or replace function InsereNucleoDocente
	(codigo integer,
	presidente character varying(20) default null)
returns void as $$
begin
	insert into vw_nucleodocente values (presidente, codigo);
END; 
$$ language plpgsql called on null input;

-- ESTUDANTE
create or replace function InsereEstudante
	(Pessoa_rg character varying(9),
	ra integer,
	ira integer,
	anoConcEM character varying(4) default null,
	presencial char default null,
	graduando boolean default null,
	posGraduando boolean default null)
returns void as $$
begin
	if RA > 0 then 
		if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
			raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
			return;
		else
			insert into vw_estudante values(Pessoa_rg, ra, ira, anoConcEM, presencial, graduando, posGraduando);
		end if;
	else
		raise exception 'RA deve ser positivo.';
	end if;
end;
$$ language plpgsql called on null input;

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
	(p_dataInicio date, 
	p_diasLetivos integer,
	p_tipo character,
	p_reuniao_numero integer default null,
	p_aprovado boolean default false,  
	p_Anterior_dataInicio date default null)
returns void as $$
begin
	if p_tipo <> 'p' and p_tipo <> 'e' and p_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', p_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return;
	end if;

	if p_reuniao_numero is not null and 
		not exists(select 1 from vw_reuniao where numero = p_reuniao_numero) then
			raise exception 'Reunião --> % inexistente/incorreta.', p_reuniao_numero;
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
	if p_calendario_tipo <> 'p' and p_calendario_tipo <> 'e' and p_calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', p_calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return;
	elsif not exists(select 1 from vw_calendario where dataInicio = p_calendario_data and tipo = p_calendario_tipo) then
		raise exception 'Calendário --> % do tipo --> ''%'' inexistente.', p_calendario_data, p_calendario_tipo;
		return;
	end if;

	insert into vw_evento (dataInicio, dataFim, descricao, Calendario_data, Calendario_tipo)
		values (p_dataInicio, p_dataFim, p_descricao, p_calendario_data, p_calendario_tipo);

end;
$$ language plpgsql called on null input;

-- ATIVIDADE
create or replace function InsereAtividade
	(dataInicio date,
	Calendario_dataInicio date,
	Calendario_tipo char,
	dataFim date default null,
	atributo char default null)
returns void as $$
begin
	if Calendario_tipo <> 'p' and Calendario_tipo <> 'e' and Calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', Calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return;
	elsif not exists(select 1 from vw_calendario v where v.dataInicio = Calendario_dataInicio and tipo = Calendario_tipo) then
		raise exception 'Calendário --> % do tipo --> ''%'' inexistente.', Calendario_dataInicio, Calendario_tipo;
		return;
	end if;

    insert into vw_atividade values (dataInicio, dataFim, atributo, Calendario_dataInicio, Calendario_tipo);
end;
$$ language plpgsql called on null input;

-- DOCENTE
create or replace function InsereDocente 
	(Pessoa_rg character varying,
	codigo integer default null)
returns void as $$
begin
	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	end if;

	insert into vw_docente values (Pessoa_rg, codigo);
end;
$$ language plpgsql called on null input; 


-- VISITA
create or replace function InsereVisita
	(ReconhecimentoDeCurso_codigo character varying(10),
	periodo date,
	comite character varying(400) default null,
	itens character varying(400) default null)
returns void as $$
begin
	if not exists(select 1 from vw_reconhecimentodecurso where codigo = ReconhecimentoDeCurso_codigo) then
		raise exception 'Reconhecimento de Curso --> % inexistente/incorreto.', ReconhecimentoDeCurso_codigo;
		return;
	end if;

	insert into vw_visita values (ReconhecimentoDeCurso_codigo, periodo, comite, itens);
end;
$$ language plpgsql called on null input;

-- FASE
create or replace function InsereFase
	(ReconhecimentoDeCurso_codigo character varying(10),
	id character varying(10),
	doc character varying(400) default null,
	periodo date default null)
returns void as $$
begin
	if not exists(select 1 from vw_reconhecimentodecurso where codigo = ReconhecimentoDeCurso_codigo) then
		raise exception 'Reconhecimento de Curso --> % inexistente/incorreto.', ReconhecimentoDeCurso_codigo;
		return;
	end if;

	insert into vw_fase values (ReconhecimentoDeCurso_codigo, id, doc, periodo);
end;
$$ language plpgsql called on null input;

-- TÉCNICO ADMINISTRATIVO
create or replace function InsereTecAdm 
	(Pessoa_rg character varying,
	codigo integer default null)
returns void as $$
begin
	if not exists(select 1 from vw_pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	end if;

	insert into vw_tecadm values (Pessoa_rg, codigo);
end;
$$ language plpgsql called on null input;

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
create or replace function InserePoloDistancia
	(nome character varying(12),
	 cep character varying(10) default null,
	 rua character varying(40) default null,
	 complemento character varying(20) default null,
	 bairro character varying(20) default null,
	 cidade character varying(20) default null,
	 uf character varying(2) default null,
	 pais character varying(10) default null,
	 pontoGeoreferenciado character varying(50) default null,
	 coordenador_PreNome character varying(12) default null,
	 coordenador_SobreNome character varying(20) default null,
	 coordenador_email1 character varying(20) default null,
	 coordenador_email2 character varying(20) default null,
	 coordenador_telefone1 character varying(20) default null,
	 coordenador_telefone2 character varying(20) default null,
	 tutor_PreNome character varying(12) default null,
	 tutor_SobreNome character varying(20) default null,
	 tutor_email1 character varying(20) default null,
	 tutor_email2 character varying(20) default null,
	 tutor_telefone1 character varying(20) default null,
	 tutor_telefone2 character varying(20) default null)
returns void as $$
begin
	insert into vw_PoloDistancia values(nome, cep, rua, complemento, bairro, cidade, uf, pais, pontoGeoreferenciado, 
		coordenador_PreNome, coordenador_SobreNome, coordenador_email1, coordenador_email2, coordenador_telefone1, coordenador_telefone2,
		tutor_PreNome, tutor_SobreNome, tutor_email1, tutor_email2, tutor_telefone1, tutor_telefone2);
end;
$$ language plpgsql called on null input;

-- FOTOS DE UM POLO
create or replace function InserePoloDistanciaFoto
	(PoloDistancia_nome character varying(12),
	numero integer,
	imagem character varying(20) default null)
returns void as $$
begin
	if not exists (select 1 from vw_polodistancia where nome = PoloDistancia_nome) then
		raise exception 'Polo à Distância --> % não existe/incorreto.', PoloDistancia_nome;
		return;
	end if;

	insert into vw_polodistanciafoto values(PoloDistancia_nome, numero, imagem);
end;
$$ language plpgsql called on null input;

-- TELEFONES DE UM POLO
create or replace function InserePoloDistanciaTelefone
	(PoloDistancia_nome character varying(12),
	tipo character varying(10),
	ddd character varying(3) default null,
	fone character varying(10) default null,
	ramal character varying(5) default null,
	origem character varying(10) default null)
returns void as $$
begin
	if not exists(select 1 from vw_polodistancia where nome = PoloDistancia_nome) then
		raise exception 'Polo à Distância --> % não existe/incorreto.', PoloDistancia_nome;
		return;
	end if;

	insert into vw_polodistanciatelefone values(PoloDistancia_nome, tipo, ddd, fone, ramal, origem);
end;
$$ language plpgsql called on null input;

-- TURMA
create or replace function InsereTurma 
	(id char,
	ano integer,
	semestre integer,
	cod_disc character varying(10),
	cod_doc integer default null,
	vagas integer default null)
returns void as $$
begin	
	if not exists(select 1 from vw_disciplina where codigo = cod_disc) then
		raise exception 'Disciplina --> % não existe/incorreta.', cod_disc;
		return;
	elsif cod_doc is not null and not exists(select 1 from vw_docente where codigo = cod_doc) then
		raise exception 'Docente --> % não existe/incorreto.', cod_doc;
		return;
	end if;

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
	if not exists(select 1 from w_disciplina where codigo = t_disc_cod) then
		raise exception 'Disciplina --> % não existe/incorreto.', t_disc_cod;
		return;
	elsif not exists(select 1 from vw_turma where id = t_id and ano = t_ano and t_semestre and Disciplina_codigo = t_disc_cod) then
		raise exception 'Turma % não existe.', t_disc_cod::text || t_ano::text || t_semestre::text || t_id::text;
		return;
	end if;

	insert into vw_sala values (cod, t_id, t_ano, t_semestre, t_disc_cod);
end;
$$ language plpgsql;

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
	insert into vw_departamento values (nome, website, sigla, telefone1, telefone2, endereco, campus_sigla);
end;
$$ language plpgsql called on null input;

-- ATA
create or replace function InsereAta
	(ConselhoCurso_id integer,
	Reuniao_numero integer,
	documentos character varying(20) default null)
returns void as $$
begin
	if not exists(select 1 from vw_conselhocurso where id = ConselhoCurso_id) then
		raise exception 'Conselho --> % não existe/incorreto.', ConselhoCurso_id;
		return;	
	elsif not exists(select 1 from vw_reuniao where numero = Reuniao_numero) then
		raise exception 'Reuniao --> % não existe/incorreta.', Reuniao_numero;
		return;
	end if;

    insert into vw_ata values (documentos, ConselhoCurso_id, Reuniao_numero);
end;
$$ language plpgsql called on null input;

-- POSSUI (Conselho_Curso x Nucleo_Docente)
create or replace function InserePossuiCCND
	(ConselhoCurso_id integer,
	NucleoDocente_codigo integer)
returns void as $$
begin
	if not exists(select 1 from vw_conselhocurso where id = ConselhoCurso_id) then
		raise exception 'Conselho de Curso --> % não existe/incorreto.', ConselhoCurso_id;
		return;
	elsif not exists(select 1 from vw_nucleodocente where codigo = NucleoDocente_codigo) then
		raise exception 'Nucleo Docente --> % não existe/incorreto.', NucleoDocente_codigo;
		return;
	end if;

	insert into vw_possuiccnd values (ConselhoCurso_id, NucleoDocente_codigo);
end;
$$ language plpgsql;

-- PERTENCE (ConselhoCurso x Pessoa)
create or replace function InserePertenceCCP
	(Pessoa_rg character varying(9),
	ConselhoCurso_id integer,
	categoria character varying(20) default null, 
	periodo date default null)
returns void as $$
begin
	if not exists(select 1 from vw_pessoa where rg = pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Pessoa_rg;
		return;
	elsif not exists(select 1 from vw_conselhocurso where id = ConselhoCurso_id) then
		raise exception 'Conselho de Curso --> % não existe/incorreto.', ConselhoCurso_id;
		return;
	end if;

	insert into vw_pertenceccp values (Pessoa_rg, ConselhoCurso_id, categoria, periodo);
end;
$$ language plpgsql called on null input;

-- PERTENCE (Disciplina x Departamento)
create or replace function InserePertenceDD 
	(Departamento_sigla character varying(100),
	Disciplina_codigo character)
returns void as $$
begin		
	if not exists(select 1 from vw_departamento where sigla = Departamento_sigla) then
		raise exception 'Departamento --> % não existe/incorreto.', Departamento_sigla;
		return;
	elsif not exists(select 1 from vw_disciplina where codigo = Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreto.', Disciplina_codigo;
		return;
	end if;

	insert into vw_pertencedd values (sigla, cod);
end;
$$language plpgsql;

-- PERTENCE (Docente x NucleoDocente)
create or replace function inserePossuiccnd
	(Docente_Pessoa_rg character varying(9),
	NucleoDocente_codigo integer,
	Docente_codigo integer,
	periodo timestamp default null)
returns void as $$
begin
	if not exists(select 1 from vw_pessoa where rg = Docente_Pessoa_rg) then
		raise exception 'Pessoa com RG --> % não existe/incorreto.', Docente_Pessoa_rg;
		return;
	elsif not exists(select 1 from vw_docente where codigo = Docente_codigo) then
		raise exception 'Docente --> % não existe/incorreto.', Docente_codigo;
		return;
	elsif not exists(select 1 from vw_nucleodocente where codigo = NucleoDocente_codigo) then
		raise exception 'Núcleo Docente --> % não existe/incorreto.', NucleoDocente_codigo;
		return;
	end if;
	
	insert into vw_pertencednd values (Docente_Pessoa_rg, NucleoDocente_codigo, Docente_codigo, periodo);
end;
$$ language plpgsql called on null input;

-- PERTENCE (Estudante x PoloDistancia)
create or replace function InserePessoaPertenceEPD
	(Estudante_ra integer,
	Estudante_Pessoa_rg character varying(9),
	PoloDistancia_nome character varying(12))
returns void as $$
begin
	if not exists(select 1 from vw_pessoa where rg = Estudante_Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', Estudante_Pessoa_rg;
		return;
	elsif not exists(select 1 from vw_estudante where ra = Estudante_ra) then
		raise exception 'RA --> % não existe/incorreto.', Estudante_ra;
		return;
	elsif not exists(select 1 from PoloDistancia where nome = PoloDistancia_nome) then
		raise exception 'O nome do polo a distância não existe/incorreto.';
		return;
	end if;

    insert into vw_pertenceepd values (Estudante_ra, Estudante_Pessoa_rg, PoloDistancia_nome);
end;
$$ language plpgsql;

-- POSSUI (Reconhecimento_Curso x Fase)
create or replace function InserePossuiRCF
	(periodo date,
	ReconhecimentoDeCurso_codigo character varying(10),
	Fase_id character varying(10))
returns void as $$
begin
	if not exists(select 1 from vw_reconhecimentodecurso where codigo = ReconhecimentoDeCurso_codigo) then
		raise exception 'Reconhecimento de Curso --> % não existe/incorreto.', ReconhecimentoDeCurso_codigo;
		return;
	elsif not exists(select 1 from vw_fase where id = Fase_id) then
		raise exception 'Fase --> % não existe/incorreta.', Fase_id;
		return;
	end if;

	insert into vw_possuircf values (periodo, ReconhecimentoDeCurso_codigo, Fase_id);
end;
$$ language plpgsql;

-- REALIZA (AtComp x Estudante)
create or replace function insereRealizaACE
	(rg character varying(9),
	 estudante_ra integer,
	 atcomp_codigo character varying(10),
	 semestres integer DEFAULT 1
	 )
returns void as $$
begin
	insert into vw_realizaace values (rg, estudante_ra, atcomp_codigo, semestres);
end;
$$ language plpgsql called on null input;

-- REALIZA (ConselhoCurso x Reuniao)
create or replace function InsereRealizaCCRe 
	(cc_id integer, 
	re_num integer)
returns void as $$
begin		
	if not exists(select 1 from vw_conselhocurso where id = cc_id) then
		raise exception 'Conselho de Curso --> % não existe/incorreto.', cc_id;
		return;
	elsif not exists(select 1 from vw_reuniao where numero = re_num) then
		raise exception 'Reuniao --> % não existe/incorreto.', re_num;
		return;
	end if;

	insert into vw_realizaccre values (cc_id, re_num);
end;
$$ language plpgsql;

-- COMPOE (Disciplina x Curso)
create or replace function InsereCompoe
	(Disciplina_codigo character varying (10), 
	Curso_codigo integer, 
	obg boolean default null,
	perfil char default null)
returns void as $$
begin		
	if not exists(select 1 from vw_disciplina where codigo = Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreto.', Disc_codigo;
		return;
	elsif not exists(select 1 from vw_curso where codigo = Curso_codigo) then
		raise exception 'Curso --> % não existe/incorreto.', Cur_codigo;
		return;
	end if;

	insert into vw_compoe values (Disciplina_codigo, Curso_codigo, obg, perfil);
end;
$$ language plpgsql called on null input;

-- CURSA (Estudante x Turma)
create or replace function InsereCursa 
	(est_pes_rg character varying (9), 
	est_ra integer,
	t_disc_cod character varying(10),
	t_id char,
	t_ano integer,
	t_semestre integer,
	media numeric default null,
	frequencia numeric default null,
	status char default null)
returns void as $$
begin
	if status <> 'c' and status <> 't' and status <> 'r' and status <> 'a' then
		raise exception 'Status --> % inválido.', status
			using hint = 'Deve ser ''c'' para Cancelado, ''t'' para Trancado, ''r'' para Reprovado ou ''a'' para Aprovado.';
		return;
	elsif not exists(select 1 from vw_estudante where Pessoa_rg = est_pes_rg AND ra = est_ra) then
		raise exception 'RG/RA % não existe/incorreto.', est_pes_rg::text || "/" || est_ra;
		return;
	elsif not exists(select 1 from vw_turma where id = t_id and ano = t_ano and semestre = t_semestre and Disciplina_codigo = t_disc_cod) then
		raise exception 'Turma % não existe.', t_disc_cod::text || t_ano::text || t_semestre::text || t_id::text;
		return;
	end if;

	insert into vw_cursa values (est_pes_rg, est_ra, t_disc_cod, t_id, t_ano, t_semestre, media, frequencia, status);
end;
$$ language plpgsql called on null input;

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
create or replace function InsereEfetua
	(nd_cod integer,
	reu_num integer)
returns void as $$
begin		
	if not exists (select 1 from vw_nucleodocente where codigo = nd_cod) then
		raise exception 'Núcleo Docente --> % não existe', nd_cod;
		return;
	elsif not exists (select 1 from vw_reuniao where numero = reu_num) then
		raise exception 'Reunião --> % não existe', reu_num;
		return;
	end if;

	insert into vw_efetua values (nd_cod, reu_num);
end;
$$ language plpgsql;

-- ESTAGIA (Estudante x Empresa)
create or replace function InsereEstagia
	(Estudante_ra integer,
	Empresa_cnpj bigint,
	dataInicio date default null,
	dataTermino date default null,
	supEmpresa supervisor default null,
	supUniversidade supervisor default null,
	cartaAvaliacao text default null,
	termoCompromisso text default null)
returns void as $$
begin
	if not exists (select 1 from vw_estudante where ra = Estudante_ra) then
		raise exception 'RA --> % não existe/incorreto.', Estudante_ra;
		return;
	elsif not exists (select 1 from vw_empresa where cnpj = Empresa_cnpj) then
		raise exception 'CNPJ --> % não existe/incorreto.', Empresa_cnpj;
		return;
	end if;

	insert into vw_estagia values (Estudante_ra, Empresa_cnpj, dataInicio, dataTermino, supEmpresa, 
		supUniversidade, cartaAvaliacao, termoCompromisso); 
end;
$$ language plpgsql called on null input;

-- INSCREVE (Estudante x Turma)
create or replace function InsereInscreve
	(Turma_ano integer,
	Turma_semestre integer,
	Turma_id char,
	Turma_Disciplina_codigo character varying(10),
	Estudante_ra integer,
	periodo date default null,
	deferimento boolean default null,
	prioridade_inscricao integer default null)
returns void as $$
begin
	if not exists(select 1 from vw_estudante where ra = Estudante_ra) then
		raise exception 'RA --> % não existe/incorreto.', Estudante_ra;
		return;
	elsif not exists(select 1 from vw_disciplina where codigo = Turma_Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreta.', Turma_Disciplina_codigo;
		return;
	elsif not exists(select 1 from vw_turma where id = t_id and ano = t_ano and semestre = t_semestre and Disciplina_codigo = t_disc_cod) then
		raise exception 'Turma % não existe.', t_disc_cod::text || t_ano::text || t_semestre::text || t_id::text;
		return;
	end if;

	insert into vw_inscreve values (periodo, deferimento, prioridade_inscricao, Turma_ano, Turma_semestre, Turma_id, Turma_Disciplina_codigo, Estudante_ra);
end;
$$ language plpgsql called on null input;

-- MATRICULADO (Estudante x Curso)
create or replace function InsereMatriculado 
	(Estudante_ra integer, 
	Curso_codigo integer, 
	grade_matri character varying(15) default null,
	periodo char default null, 
	stat boolean default null,
	perf char default null,
	ingresso date default null,
	termino date default null)
returns void as $$
begin		
	if not exists (select 1 from vw_estudante where ra = Estudante_ra) then
		raise exception 'RA --> % não existe/incorreto.', Estudante_ra;
		return;
	elsif not exists(select 1 from vw_curso where codigo = Curso_codigo) then
		raise exception 'Curso --> % não existe/incorreto.', Curso_codigo;
		return;
	end if;

	insert into vw_matriculado values (Estudante_ra, Curso_codigo, grade_matri, periodo, stat, perf, ingresso, termino);
end;
$$ language plpgsql called on null input;

-- CALENDARIO ANTERIOR (Calendario (Anterior) x Calendario (Posterior))
	-- automaticamente inserido pelo InsereCalendario()

-- ENADE
create or replace function InsereEnade
	(realizacao date,
	Estudante_ra integer ,
	Pessoa_rg character varying(9),
	nota numeric(4,2) default null,
	Curso_codigo integer default null)
returns void as $$
begin
	if not exists(select 1 from vw_estudante where rg = pessoa_rg AND estudante_ra = ra) then
		raise exception 'RG --> % ou RA --> % não existe/incorreto.', Pessoa_rg, Estudante_ra;
		return;
	elsif not exists(select 1 from vw_curso where codigo = Curso_codigo) then
		raise exception 'Curso --> % não existe/incorreto.', Curso_codigo;
		return;
	else
        insert into vw_enade values (realizacao, nota, Estudante_ra, Pessoa_rg, Curso_codigo); 
	end if;
end;
$$ language plpgsql called on null input;




-- ETC
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
			tur.semestre = semestreV; -- Seleciona Semestre
end; 
$$ language plpgsql;

create or replace function TrocaIra
	(nRa integer, 
	novoIra integer)
returns void as $$
begin
    UPDATE vw_estudante
    SET ira = novoIra
    WHERE ra = nRa;
end;
$$ language plpgsql;

create or replace function AlteraCodigoTecAdm
	(codigoact integer, 
	newcodigo integer)
returns void as $$
begin
	UPDATE vw_tecadm ta
	SET codigo = newcodigo
	WHERE ta.codigo = codigoact;
end;
$$
language plpgsql;

create or replace function RelatorioTurmasSemestreAno
	(disc character varying(50), 
	anoV INTEGER, 
	semestreV INTEGER)
returns void as $$
begin		
	select * from vw_relatorioturmasdisciplinasemestre v
	where v.disciplina = disc and
		  v.ano = anoV and
		  v.semestre = semestreV;
end; 
$$ language plpgsql;
