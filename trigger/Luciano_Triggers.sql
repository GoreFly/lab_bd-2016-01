---------------------------------------------------------------
-- Trigger para Saber se o rg inserido na Tabela ConselhoCurso existe na Tabela Pessoa
create or replace function insertConselhoCursoVer_proc() 
returns trigger as $$
begin
	if not exists(select 1 from Pessoa where rg = NEW.Pessoa_rg) then
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
	if not exists(select 1 from Pessoa where rg = NEW.Pessoa_rg) then
		raise exception 'RG --> % não existe/incorreto.', NEW.Pessoa_rg;
		return null;
	end if;

	if not exists(select 1 from ConselhoCurso where id = NEW.ConselhoCurso_id) then
		raise exception 'ID --> % não existe/incorreto.', NEW.ConselhoCurso_id;
		return null;
	end if;
	
	return NEW;
end;
$$ language plpgsql;

create trigger insertPertenceCCPVer_trig
before insert or update on PertenceCCP for each row
execute procedure insertPertenceCCPVer_proc();
