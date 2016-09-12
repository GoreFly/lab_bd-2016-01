-- View de eventos do calendário presencial
CREATE OR REPLACE VIEW view_eventoscalendariopresencial
AS
SELECT e.datainicio AS "Data de Início", e.datafim AS "Data de Término", e.descricao AS "Descrição"
FROM Evento AS e, Calendario AS c
WHERE e.calendario_data = c.datainicio AND
	  e.calendario_tipo = c.tipo AND
	  c.tipo = 'p'
ORDER BY e.datainicio, e.datafim;


-- View de eventos do calendario do Ensino à Distância
CREATE OR REPLACE VIEW view_eventoscalendarioead
AS
SELECT e.datainicio AS "Data de Início", e.datafim AS "Data de Término", e.descricao AS "Descrição"
FROM Evento AS e, Calendario AS c
WHERE e.calendario_data = c.datainicio AND
	  e.calendario_tipo = c.tipo AND
	  c.tipo = 'e'
ORDER BY e.datainicio, e.datafim;


-- View de eventos do calendario Administrativo
CREATE OR REPLACE VIEW view_eventoscalendarioadministrativo
AS
SELECT e.datainicio AS "Data de Início", e.datafim AS "Data de Término", e.descricao AS "Descrição"
FROM Evento AS e, Calendario AS c
WHERE e.calendario_data = c.datainicio AND
	  e.calendario_tipo = c.tipo AND
	  c.tipo = 'a'
ORDER BY e.datainicio, e.datafim;


create or replace view vw_calendario as
	select * from calendario;

create or replace view vw_evento as
	select * from evento;

create or replace view vw_ehanterior as
	select * from ehanterior;

create or replace view vw_reuniao as
	select * from reuniao;