create or replace function calcula_dataFim_proc() 
returns trigger as $$
begin 
	NEW.dataFim = NEW.dataInicio + interval '1' day * NEW.diasLetivos;
	return NEW;
end;
$$ language plpgsql;

create trigger calcula_dataFim_trigger before insert or update
on Calendario for each row
execute procedure calcula_dataFim_proc ();


create or replace function insertCalendarioVer_proc()
returns trigger as $$
begin
	if NEW.tipo <> 'p' and NEW.tipo <> 'e' and NEW.tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', NEW.tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return NULL;
	elsif NEW.reuniao_numero is not null and not exists(select 1 from vw_reuniao where numero = NEW.reuniao_numero) then
		raise exception 'Reunião --> % inexistente/incorreta.', NEW.reuniao_numero;
		return NULL;
	end if;

	return NEW;
end;
$$ language plpgsql;

create trigger insertCalendarioVer_trig
before insert on Calendario 
for each row execute procedure insertCalendarioVer_proc();


create or replace function insertEventoVer_proc() 
returns trigger as $$
begin
	if NEW.Calendario_tipo <> 'p' and NEW.Calendario_tipo <> 'e' and NEW.Calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', NEW.Calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return null;
	elsif not exists(select 1 from calendario where dataInicio = NEW.calendario_data and tipo = NEW.calendario_tipo) then
		raise exception 'Calendário --> % inexistente.', NEW.Calendario_data::text || ' ' || NEW.Calendario_tipo::text;
		return null;
	end if;

	return NEW;
end;
$$ language plpgsql;

create trigger insertEventoVer_trig
before insert on Evento 
for each row execute procedure insertEventoVer_proc();


create or replace function inicializa_periodo_DND_proc()
returns trigger as $$
begin
	NEW.periodo=now();
	return NEW;
end;
$$ language plpgsql;


create or replace function insertEhAnteriorVer_proc()
returns trigger as $$
begin
	if NEW.Anterior_tipo <> 'p' and NEW.Anterior_tipo <> 'e' and NEW.Anterior_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', NEW.Anterior_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return NULL;
	elsif NEW.Posterior_tipo <> 'p' and NEW.Posterior_tipo <> 'e' and NEW.Posterior_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', NEW.Posterior_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return NULL;
	elsif NEW.Anterior_dataInicio is not null and not exists(select 1 from vw_calendario where dataInicio = NEW.Anterior_dataInicio and tipo = NEW.Anterior_tipo) then
		raise exception 'Calendário --> % inexistente.', NEW.Anterior_dataInicio::text || ' ' || NEW.Anterior_tipo::text;
		return null;
	elsif NEW.Posterior_dataInicio is not null and not exists(select 1 from vw_calendario where dataInicio = NEW.Posterior_dataInicio and tipo = NEW.Posterior_tipo) then
		raise exception 'Calendário --> % inexistente.', NEW.Posterior_dataInicio::text || ' ' || NEW.Posterior_tipo::text;
		return null;
	end if;

	return NEW;
end;
$$language plpgsql;

create trigger insertEhAnteriorVer_trig
before insert on EhAnterior
for each row execute procedure insertEhAnteriorVer_proc();


create trigger inicializa_periodo_DND_trigger before insert
on PertenceDND for each row
execute procedure inicializa_periodo_dnd_proc();

create or replace function insertAtCompVer_proc() 
returns trigger as $$
begin
	if NEW.creditos % 2 = 0 then
		return NEW;
	else
		raise exception 'Número de créditos por semestre incorreto.'
			using hint = 'O número de créditos deve ser par.';
	end if;
end;
$$ language plpgsql;

create trigger insertAtCompVer_trig
before insert or update on Atcomp for each row
execute procedure insertAtCompVer_proc();



create or replace function insertPessoaEnderecoVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from Pessoa where rg = NEW.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
		else
            return NEW;
	end if; 
end;
$$ language plpgsql;

create trigger insertPessoaEnderecoVer_trig
before insert or update on PessoaEndereco for each row
execute procedure insertPessoaEnderecoVer_proc();



create or replace function insertPessoaTelefoneVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from Pessoa where rg = Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
	else
        return NEW;
	end if;	
end;
$$ language plpgsql;

create trigger insertPessoaTelefoneVer_trig
before insert or update on PessoaTelefone for each row
execute procedure insertPessoaTelefoneVer_proc();

create or replace function insertDeptoVer_proc() 
returns trigger as $$
begin
	if NEW.campus_sigla is not null and not exists(select 1 from vw_campus where sigla = NEW.campus_sigla) then
		raise exception 'Campus --> % não existe/incorreto.', NEW.campus_sigla;
		return null;
	else
		return NEW;
	end if;
end;
$$ language plpgsql;

create trigger insertDeptoVer_trig
before insert or update on Departamento for each row
execute procedure insertDeptoVer_proc();


create or replace function insertEstudanteVer_proc() 
returns trigger as $$
begin
	if NEW.Estudante_ra > 0 then 
		if not exists(select 1 from Pessoa where rg = NEW.Pessoa_rg) then
			raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
			return null;
		else
			return NEW;
		end if;
	else
		raise exception 'RA deve ser positivo.';
		return null;
	end if;
end;
$$ language plpgsql;

create trigger insertEstudanteVer_trig
before insert or update on Estudante for each row
execute procedure insertEstudanteVer_proc();


CREATE OR REPLACE FUNCTION insertProjetoPoliticoPedagogicoVer_proc()
RETURNS trigger AS $$
BEGIN
	IF new.ProjetoPoliticoPedagogico.Optativa == False AND new.ProjetoPoliticoPedagogico.Obrigatoria == False AND new.ProjetoPoliticoPedagogico.Eletiva == False then
	RETURN null;
	END IF;

	return NEW;
END; 
$$ LANGUAGE plpgsql;


CREATE TRIGGER insertProjetoPoliticoPedagogicoVer_trig
BEFORE INSERT
ON ProjetoPoliticoPedagogico
FOR EACH ROW
EXECUTE PROCEDURE insertProjetoPoliticoPedagogicoVer_proc();

create or replace function insertCalendarioVer_proc()
returns trigger as $$
begin
	if NEW.p_tipo <> 'p' and NEW.p_tipo <> 'e' and NEW.p_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', NEW.p_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return NULL;
	elsif NEW.p_reuniao_numero is not null and not exists(select 1 from vw_reuniao where numero = NEW.p_reuniao_numero) then
		raise exception 'Reunião --> % inexistente/incorreta.', NEW.p_reuniao_numero;
		return NULL;
	end if;

	return NEW;
end;
$$ language plpgsql;


create or replace function insertAtividadeVer_proc() 
returns trigger as $$
begin
	if NEW.Calendario_tipo <> 'p' and NEW.Calendario_tipo <> 'e' and NEW.Calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', NEW.Calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return null;
	elsif not exists(select 1 from calendario where dataInicio = NEW.Calendario_dataInicio and tipo = NEW.Calendario_tipo) then
		raise exception 'Calendário --> % do tipo --> ''%'' inexistente.', Calendario_dataInicio, Calendario_tipo;
		return null;
	end if;
end;
$$ language plpgsql;

create trigger insertAtividadeVer_trig
before insert or update on Atividade for each row
execute procedure insertAtividadeVer_proc();


create or replace function insertDocenteVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from pessoa where rg = NEW.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertDocenteVer_trig
before insert or update on Docente for each row
execute procedure insertDocenteVer_proc();


create or replace function insertFaseVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from reconhecimentodecurso where codigoR = NEW.ReconhecimentoDeCurso_codigo) then
		raise exception 'Reconhecimento de Curso --> % inexistente/incorreto.', NEW.ReconhecimentoDeCurso_codigo;
		return null;
	end if;

	return NEW;
end;
$$ language plpgsql;

create trigger insertFaseVer_trig
before insert or update on Fase for each row
execute procedure insertFaseVer_proc();


create or replace function insertTecAdmVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from pessoa where rg = NEW.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertTecAdmVer_trig
before insert or update on TecAdm for each row
execute procedure insertTecAdmVer_proc();


create or replace function insertTurmaVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from disciplina where codigo = NEW.Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreta.', NEW.Disciplina_codigo;
		return null;
	elsif NEW.Docente_codigo is not null and not exists(select 1 from docente where codigo = NEW.Docente_codigo) then
		raise exception 'Docente --> % não existe/incorreto.', NEW.Docente_codigo;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertTurmaVer_trig
before insert or update on Turma for each row
execute procedure insertTurmaVer_proc();


create or replace function insertSalaVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from disciplina where codigo = NEW.Turma_Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreto.', NEW.Turma_Disciplina_codigo;
		return null;
	elsif not exists(select 1 from turma where id = NEW.Turma_id and ano = NEW.Turma_ano and semestre = NEW.Turma_semestre and Disciplina_codigo = NEW.Turma_Disciplina_codigo) then
		raise exception 'Turma % não existe.', NEW.Disciplina_codigo::text || NEW.ano::text || NEW.semestre::text || NEW.id::text;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertSalaVer_trig
before insert or update on Sala for each row
execute procedure insertSalaVer_proc();


create or replace function insertPertenceCCPVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from pessoa where rg = NEW.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
	elsif not exists(select 1 from conselhocurso where id = NEW.ConselhoCurso_id) then
		raise exception 'Conselho de Curso --> % não existe/incorreto.', NEW.ConselhoCurso_id;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;


create or replace function insertInscreve_proc() 
returns trigger as $$
begin
	if not exists(select 1 from Inscreve where Estudante_ra = NEW.Inscreve_estudante_ra) then
		raise exception 'RA do Estudante --> % não existe/incorreto.', NEW.Inscreve_estudante_ra;
		return null;
	elsif Turma_id is not null and not exists(select 1 from Inscreve where Turma_id = NEW.Inscreve_turma_id) then
		raise exception 'ID da Turma --> % não existe/incorreto.', NEW.Inscreve_turma_id);
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertInscreve_trig
before insert or update on Inscreve for each row
execute procedure insertInscreve_proc();

---------------------------------------------------------------
-- Trigger para Saber se o rg inserido na Tabela ConselhoCurso existe na Tabela Pessoa
create or replace function insertConselhoCursoVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from vw_pessoa  where rg = NEW.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertConselhoCursoVer_trig
before insert or update on ConselhoCurso for each row
execute procedure insertConselhoCursoVer_proc();

---------------------------------------------------------------
--Trigger para Saber se o rg e o id inserido na Tabela PertencemCCP existem na Tabela Pessoa e ConselhoCurso
create or replace function insertPertenceCCPVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from vw_pessoa  where rg = NEW.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
	end if;

	if not exists(select 1 from vw_conselhocurso  where id = NEW.ConselhoCurso_id) then
		raise exception 'ID --> % não existe/incorreto.', NEW.ConselhoCurso_id;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertPertenceCCPVer_trig
before insert or update on PertenceCCP for each row
execute procedure insertPertenceCCPVer_proc();

-- TRIGGER EMPRESA
CREATE OR REPLACE FUNCTION insertempresa_proc()
  RETURNS trigger AS
$BODY$
begin
	if not exists(select 1 from empresa where cnpj = NEW.Empresa_cnpj) then
		raise exception 'Empresa --> % não existe/incorreta.', NEW.Empresa_cnpj;
		return null;
	end if;
	
	return NEW;
end;
$BODY$
  LANGUAGE plpgsql;

create trigger insertEmpresa_trig
before insert or update on Empresa for each row
execute procedure insertempresa_proc();

-- TRIGGER CURSO
CREATE OR REPLACE FUNCTION insertcurso_proc()
  RETURNS trigger AS
$BODY$
begin
	if exists(select 1 from curso where codigo = NEW.codigo) then
		raise exception 'Curso --> % não existe/incorreto.', NEW.codigo;
		return null;
	elsif NEW.nome is not null and exists(select 1 from curso where codigo = NEW.codigo) then
		raise exception 'Curso com nome --> % não existe/incorreto.', NEW.codigo;
		return null;
	end if;
	
	return NEW;
end;
$BODY$
  LANGUAGE plpgsql;

create trigger insertCurso_trig
before insert or update on Curso for each row
execute procedure insertcurso_proc();

-- TRIGGER ESTAGIA
create or replace function insertEstagia_proc() 
returns trigger as $$
begin
	if not exists(select 1 from Estagia where estudante_cpf = NEW.Estagia_estudante_cpf) then
		raise exception 'CPF do Estudante --> % não existe/incorreto.', NEW.Disciplina_codigo;
		return null;
	elsif empresa_cnpj is not null and not exists(select 1 from estagia where empresa_cnpj = NEW.Estagia_empresa_cnpj) then
		raise exception 'CNPJ --> % não existe/incorreto.', NEW.Estagia_empresa_cnpj;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertEstagia_trig
before insert or update on Estagia for each row
execute procedure insertEstagia_proc();


CREATE OR REPLACE FUNCTION update_RECONHECIMENTODECURSO()
RETURNS trigger AS $$ 
BEGIN
      IF NOT EXISTS(SELECT 1 FROM ReconhecimentoDeCurso where codigo = OLD.codigo) THEN
      RETURN NULL;
      ELSE
	UPDATE ReconhecimentoDeCurso SET codigoR = NEW.codigoR WHERE codigo = OLD.codigo;
      END IF;
END;

$$ LANGUAGE plpgsql;
CREATE TRIGGER update_recRC
BEFORE UPDATE
ON ReconhecimentoDeCurso
FOR EACH ROW
EXECUTE PROCEDURE update_RECONHECIMENTODECURSO();


--Verifica se o RG do estudante inserido está previamente cadastrado como pessoa
CREATE OR REPLACE FUNCTION verifica_rg()
  RETURNS trigger AS
$BODY$
begin
	if NEW.rg is not null and not exists(select 1 from vw_pessoa where rg = NEW.rg) then
		raise exception 'RG nao cadastrado.';
		return null;
	else
		return NEW;
	end if;
end;
$BODY$
  LANGUAGE plpgsql;


--Verifica se o número de créditos é positivo e par
CREATE OR REPLACE FUNCTION verificaCr_disc()
  RETURNS trigger AS $$
begin
	if NEW.nro_creditos <0 then
		raise exception 'Uma disciplina nao pode ter creditos negativos.';
		return null;
	elsif NEW.nro_creditos %2 != 0 then
		raise exception 'Nao pode ter numero de creditos impar.';
		return null;
	else
		return NEW;
	end if;
end;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION insertRealizaACE_proc()
  RETURNS trigger AS
$BODY$
begin
	if not exists(select 1 from Estudante where pessoa_rg = NEW.pessoa_rg AND ra = NEW.ra) then
		raise exception 'RG ou RA não existe/incorreto.';
		return null;
	elsif not exists(select 1 from AtComp where codigo = NEW.codigo) then
		raise exception 'Código da atividade complementar não existe/incorreto.';
		return null;
		elsif exists(select 1 from RealizaACE where realizaace.atcomp_codigo = insererealizaace.atcomp_codigo AND insererealizaace.estudante_ra = realizaace.estudante_ra) then
			update RealizaACE
			set nrosemestres = nrosemestres + semestres;
			return null;
		end if;
	
	return NEW;
end;
$BODY$
  LANGUAGE plpgsql;
