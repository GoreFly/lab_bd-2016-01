create or replace function InsereCalendario
	(p_dataInicio date, 
	p_diasLetivos integer,
	p_tipo character,
	p_reuniao_numero integer default null,
	p_aprovado boolean default false,  
	p_Anterior_dataInicio date default null)
returns void as $$
begin
	if p_tipo <> 'p' and p_tipo <> 'e' and p_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', p_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return;
	end if;

	if p_reuniao_numero is not null and 
		not exists(select 1 from vw_reuniao where numero = p_reuniao_numero) then
			raise exception 'Reunião --> % inexistente/incorreta.', p_reuniao_numero;
			return;
	end if;

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


create or replace function insereReuniao
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
	if p_calendario_tipo <> 'p' and p_calendario_tipo <> 'e' and p_calendario_tipo <> 'a' then
		raise exception 'Tipo de Calendario --> % inexistente.', p_calendario_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return;
	elsif not exists(select 1 from vw_calendario where dataInicio = p_calendario_data and tipo = p_calendario_tipo) then
		raise exception 'Calendário --> % do tipo --> ''%'' inexistente.', p_calendario_data, p_calendario_tipo;
		return;
	end if;

	insert into vw_evento (dataInicio, dataFim, descricao, Calendario_data, Calendario_tipo)
		values (p_dataInicio, p_dataFim, p_descricao, p_calendario_data, p_calendario_tipo);

end;
$$ language plpgsql called on null input;