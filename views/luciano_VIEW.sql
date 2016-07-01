
create or replace view Reuniao_Mes_Atual
	as select numero , pauta ,dataInicio
	from Reuniao
	where dataInicio  BETWEEN date_trunc('month',current_date) AND  date_trunc('month',current_date) + INTERVAL'1 month' - INTERVAL'1 day';
select * 
from Reuniao_Mes_Atual;


