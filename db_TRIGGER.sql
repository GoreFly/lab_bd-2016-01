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