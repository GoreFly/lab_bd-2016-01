create or replace function semestre_atual ()
returns integer as $$ 
declare
	sem_at INTEGER; 
begin
	sem_at := EXTRACT(month FROM CURRENT_DATE);
	if sem_at < 7 THEN
		sem_at := 1;
	else
		sem_at := 2;
	end if;
	return sem_at;
end;
$$ language plpgsql;