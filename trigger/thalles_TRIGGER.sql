CREATE OR REPLACE FUNCTION atualizarFimCalendarioDataAtual()
RETURNS trigger AS $$ 

BEGIN

	NEW.dataFim=now();

	RETURN NEW;

END; 

$$ LANGUAGE plpgsql;

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

