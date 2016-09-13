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