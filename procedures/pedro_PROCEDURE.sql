create or replace function InsereCalendario
	(p_dataInicio date, 
	p_diasLetivos integer,
	p_tipo character,
	p_reuniao_numero integer default null,
	p_aprovado boolean default false,  
	p_Anterior_dataInicio date default null)
returns void as $$
begin
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


create or replace function InsereReuniao
	(p_numero integer,
	 p_pauta text default null,
	 p_dataInicio date default null)
returns void as $$
begin
	insert into Reuniao values (p_numero, p_pauta, p_dataInicio);
end;
$$ language plpgsql called on null input;


create or replace function InsereEvento
	(p_calendario_data date,
	 p_calendario_tipo char,
	 p_dataInicio date,
	 p_dataFim date default null,
	 p_descricao text default null)
returns void as $$
begin
	insert into vw_evento (dataInicio, dataFim, descricao, Calendario_data, Calendario_tipo)
		values (p_dataInicio, p_dataFim, p_descricao, p_calendario_data, p_calendario_tipo);
end;
$$ language plpgsql called on null input;
