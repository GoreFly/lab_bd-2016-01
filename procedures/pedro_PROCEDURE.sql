--	Esta procedure faz inserções nas tabelas Calendário e EhAnterior (se aplicável).
--	A distinção do tipo de calendário (Presencial, EaD ou Administrativo),
--		é feita por meio do parâmetro "Calendario_tipo".
--	Calendario_tipo: 'p' -> presencial, 'e' -> EaD, 'a' -> Administrativo.
create or replace function insereCalendario
	(p_tipo character,
	 p_dataInicio date, 
	 p_diasLetivos integer,
	 p_reuniao_numero integer,
	 p_aprovado boolean default false,  
	 p_Anterior_dataInicio date default null)
returns void as $$
begin
	-- verifica se o tipo fornecido é válido.
	if p_tipo <> 'p' and p_tipo <> 'e' and p_tipo <> 'a' then
		raise exception 'Tipo de Calendario inexistente --> %', p_tipo
			using hint = 'Deve ser ''p'' para Presencial, ''e'' para EaD ou ''a'' para Administrativo.';
		return;
	end if;

	-- verifica se a reunião fornecida existe. Se não existir, adiciona na tabela.
	if not exists(select 1 from Reuniao where numero = p_reuniao_numero) then
		insert into Reuniao (numero) values (p_reuniao_numero);
	end if;

	-- insere o calendário na tabela.
	insert into Calendario (dataInicio, diasLetivos, tipo, aprovado, Reuniao_numero) 
		values (p_dataInicio, p_diasLetivos, p_tipo, p_aprovado, p_reuniao_numero);

	-- se houver o parâmetro indicando que esse calendário sucede outro calendário
	if p_Anterior_dataInicio is not null then
		-- insere a relação
		insert into EhAnterior values (p_Anterior_dataInicio, p_tipo, p_dataInicio, p_tipo);
		-- e caso o calendário anterior estivesse aprovado, torna-se desaprovado
		update Calendario
			set aprovado = false
			where dataInicio = p_Anterior_dataInicio;
	end if;
end;
$$ language plpgsql called on null input;


-- TESTES
--INSERT INTO Reuniao VALUES (6, 'Pauta Reuniao 6', '2011-12-09');
--INSERT INTO Reuniao VALUES (7, 'Pauta Reuniao 7', '2010-12-09');
--INSERT INTO Reuniao VALUES (8, 'Pauta Reuniao 8', '2011-01-10');
--SELECT insereCalendario('p'::char, '2012-03-16'::date, 120, 6, TRUE);
--SELECT insereCalendario('p'::char, '2011-02-20'::date, 120, 7, FALSE);
--SELECT insereCalendario('p'::char, '2011-03-01'::date, 100, 8, TRUE, '2011-02-20'::date);
--SELECT insereCalendario('p'::char, '2011-03-05'::date, 110, 9, TRUE, '2011-03-01'::date);

create or replace function insereReuniao
	(p_numero integer,
	 p_pauta text default null,
	 p_dataInicio date default null)
returns void as $$
begin
	insert into Reuniao values (p_numero, p_pauta, p_dataInicio);
end;
$$ language plpgsql called on null input;


create or replace function insereEvento
	(p_calendario_data date,
	 p_calendario_tipo char,
	 p_dataInicio date,
	 p_dataFim date default null,
	 p_descricao text default null)
returns void as $$
begin
	-- verifica se o calendário fornecido existe. Se não existir, retorna erro.
	if not exists(select 1 from Calendario where dataInicio = p_calendario_data) then
		raise exception 'Calendário --> % inexistente', p_calendario_data;
		return;
	end if;

	insert into Evento (dataInicio, dataFim, descricao, Calendario_data, Calendario_tipo)
		values (p_dataInicio, p_dataFim, p_descricao, p_calendario_data, p_calendario_tipo);

end;
$$ language plpgsql called on null input;