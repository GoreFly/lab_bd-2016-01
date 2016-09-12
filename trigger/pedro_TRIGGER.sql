create or replace function calcula_dataFim_proc() 
returns trigger as $$
begin 
	NEW.dataFim = NEW.dataInicio + interval '1' day * NEW.diasLetivos;
	return NEW;
end;
$$ language plpgsql;

create trigger calcula_dataFim_trigger 
before insert or update on Calendario 
for each row execute procedure calcula_dataFim_proc ();



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



create or replace function insertEventoVer_proc() 
returns trigger as $$
begin
	if NEW.Calendario_tipo <> 'p' and NEW.Calendario_tipo <> 'e' and NEW.Calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', NEW.Calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return null;
	elsif not exists(select 1 from vw_calendario where dataInicio = NEW.calendario_data and tipo = NEW.calendario_tipo) then
		raise exception 'Calendário --> % inexistente.', NEW.Calendario_data::text || ' ' || NEW.Calendario_tipo::text;
		return null;
	end if;

	return NEW;
end;
$$ language plpgsql;

create trigger insertEventoVer_trig
before insert on Evento 
for each row execute procedure insertEventoVer_proc();