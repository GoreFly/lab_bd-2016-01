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

create or replace function insertPertenceDDVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from vw_departamento where sigla = Departamento_sigla) then
		raise exception 'Departamento --> % não existe/incorreto.', Departamento_sigla;
		return;
	elsif not exists(select 1 from vw_disciplina where codigo = Disciplina_codigo) then
		raise exception 'Disciplina --> % não existe/incorreto.', Disciplina_codigo;
		return;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertPertenceDDVer_trig
before insert or update on PertenceDD for each row
execute procedure insertPertenceDDVer_proc();