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


create or replace function inicializa_periodo_DND_proc()
returns trigger as $$
begin
	NEW.periodo=now();
	return NEW;
end;
$$ language plpgsql;

create trigger inicializa_periodo_DND_trigger before insert
on PertenceDND for each row
execute procedure inicializa_periodo_dnd_proc();

create or replace function insertAtCompVer_proc() 
returns trigger as $$
begin
	if OLD.creditos % 2 = 0 then
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
	if not exists(select 1 from Pessoa where rg = OLD.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', OLD.Pessoa_rg;
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
		raise exception 'RG --> % não existe/incorreto.', OLD.Pessoa_rg;
		return null;
	else
        return NEW;
	end if;	
end;
$$ language plpgsql;

create trigger insertPessoaTelefoneVer_trig
before insert or update on PessoaTelefone for each row
execute procedure insertPessoaTelefoneVer_proc();


create or replace function insertEstudanteVer_proc() 
returns trigger as $$
begin
	if OLD.Estudante_ra > 0 then 
		if not exists(select 1 from Pessoa where rg = OLD.Pessoa_rg) then
			raise exception 'RG --> % não existe/incorreto.', OLD.Pessoa_rg;
			return null;
		else
			return NEW;
		end if;
	else
		raise exception 'RA deve ser positivo.';
	end if;
end;
$$ language plpgsql;

create trigger insertEstudanteVer_trig
before insert or update on Estudante for each row
execute procedure insertEstudanteVer_proc();


create or replace function insertEventoVer_proc() 
returns trigger as $$
begin
	if OLD.Calendario_tipo <> 'p' and OLD.Calendario_tipo <> 'e' and OLD.Calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', OLD.Calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return null;
	elsif not exists(select 1 from calendario where dataInicio = p_calendario_data and tipo = p_calendario_tipo) then
		raise exception 'Calendário --> % inexistente.', OLD.Calendario_data::text || " " || OLD.Calendario_tipo::text;
		return null;
	end if;

	return NEW;
end;
$$ language plpgsql;

create trigger insertEventoVer_trig
before insert or update on Evento for each row
execute procedure insertEventoVer_proc();


create or replace function insertAtividadeVer_proc() 
returns trigger as $$
begin
	if OLD.Calendario_tipo <> 'p' and OLD.Calendario_tipo <> 'e' and OLD.Calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', OLD.Calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return null;
	elsif not exists(select 1 from calendario where dataInicio = OLD.Calendario_dataInicio and tipo = OLD.Calendario_tipo) then
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
	if not exists(select 1 from pessoa where rg = OLD.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', OLD.Pessoa_rg;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertDocenteVer_trig
before insert or update on Docente for each row
execute procedure insertDocenteVer_proc();


create or replace function insertVisitaVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from reconhecimentodecurso where codigo = OLD.ReconhecimentoDeCurso_codigo) then
		raise exception 'Reconhecimento de Curso --> % inexistente/incorreto.', OLD.ReconhecimentoDeCurso_codigo;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertVisitaVer_trig
before insert or update on Visita for each row
execute procedure insertVisitaVer_proc();


create or replace function insertFaseVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from reconhecimentodecurso where codigo = OLD.ReconhecimentoDeCurso_codigo) then
		raise exception 'Reconhecimento de Curso --> % inexistente/incorreto.', OLD.ReconhecimentoDeCurso_codigo;
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
	if not exists(select 1 from pessoa where rg = OLD.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', OLD.Pessoa_rg;
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
	if not exists(select 1 from disciplina where codigo = OLD.Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreta.', OLD.Disciplina_codigo;
		return null;
	elsif cod_doc is not null and not exists(select 1 from docente where codigo = OLD.Docente_codigo) then
		raise exception 'Docente --> % não existe/incorreto.', OLD.Docente_codigo;
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
	if not exists(select 1 from disciplina where codigo = OLD.Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreto.', OLD.Disciplina_codigo;
		return null;
	elsif not exists(select 1 from turma where id = OLD.id and ano = OLD.ano and semestre = OLD.semestre and Disciplina_codigo = OLD.Disciplina_codigo) then
		raise exception 'Turma % não existe.', OLD.Disciplina_codigo::text || OLD.ano::text || OLD.semestre::text || OLD.id::text;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertSalaVer_trig
before insert or update on Sala for each row
execute procedure insertSalaVer_proc();


create or replace function insertAtaVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from conselhocurso where id = OLD.ConselhoCurso_id) then
		raise exception 'Conselho --> % não existe/incorreto.', OLD.ConselhoCurso_id;
		return null;	
	elsif not exists(select 1 from reuniao where numero = OLD.Reuniao_numero) then
		raise exception 'Reuniao --> % não existe/incorreta.', OLD.Reuniao_numero;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertAtaVer_trig
before insert or update on Ata for each row
execute procedure insertAtaVer_proc();


create or replace function insertPertenceCCPVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from pessoa where rg = OLD.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', OLD.Pessoa_rg;
		return null;
	elsif not exists(select 1 from conselhocurso where id = OLD.ConselhoCurso_id) then
		raise exception 'Conselho de Curso --> % não existe/incorreto.', OLD.ConselhoCurso_id;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertPertenceCCPVer_trig
before insert or update on PertenceCCP for each row
execute procedure insertPertenceCCPVer_proc();
