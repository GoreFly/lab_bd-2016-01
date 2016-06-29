
create or replace view Reuniao_Mes_Atual(id_reuniao, pauta,Data_Inicio)
	as select numero , pauta ,dataInicio
	from Reuniao
	where dataInicio  BETWEEN date_trunc('month',current_date) AND  date_trunc('month',current_date) + INTERVAL'1 month' - INTERVAL'1 day';
select * 
from Reuniao_Mes_Atual;


