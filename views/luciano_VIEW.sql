--o usuário poderá ver  o nome completo do representante do conselho de Curso.

create or replace view Reuniao_Mes_Atual
	as select numero , pauta ,dataInicio
	from Reuniao
	where dataInicio  BETWEEN date_trunc('month',current_date) AND  date_trunc('month',current_date) + INTERVAL'1 month' - INTERVAL'1 day';


--View retorna o nome completo do Represetante do Conselho de Curso
create or replace view vw_NomeCompleto_Representante_ConselhoCurso as
	select pre_nome || ' '|| meio_nome || ' '||ultimo_nome as "Nome Completo"
		from ConselhoCurso, Pessoa
		where Pessoa_rg = rg ;

