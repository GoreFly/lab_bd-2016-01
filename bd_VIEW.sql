-----------------------------
----- viewS DE CONTROLE -----
-----------------------------

create or replace view vw_atcomp as
	select * from atcomp;

create or replace  view vw_reconhecimentodecurso as
	select * from reconhecimentodecurso;

create or replace view vw_campus as
	select * from campus;

create or replace view vw_centro as
	select * from centro;

create or replace view vw_conselhocurso as
	select * from conselhocurso;

create or replace view vw_curso as
	select * from curso;

create or replace view vw_disciplina as
	select * from disciplina;

create or replace view vw_empresa as
	select * from empresa;

create or replace view vw_pessoa as
	select * from pessoa;

create or replace view vw_pessoaendereco as
	select * from pessoaendereco;

create or replace view vw_pessoatelefone as
	select * from pessoatelefone;

create or replace view vw_nucleodocente as
	select * from nucleodocente;

create or replace view vw_estudante as
	--select *, totalcreditoscompl(estudante.ra) from estudante;
	select * from estudante;

create or replace view vw_reuniao as
	select * from reuniao;

create or replace view vw_calendario as
	select * from calendario;

create or replace view vw_evento as
	select * from evento;

create or replace view vw_atividade as
	select * from atividade;

create or replace view vw_docente as
	select * from docente;

create or replace view vw_visita as
	select * from visita;

create or replace view vw_fase as
	select * from fase;

create or replace view vw_tecadm as
	select * from tecadm;

create or replace view vw_projetopoliticopedagogico as
	select * from projetopoliticopedagogico;

create or replace view vw_polodistancia as
	select * from polodistancia;

create or replace view vw_polodistanciafoto as
	select * from polodistanciafoto;

create or replace view vw_polodistanciatelefone as
	select * from polodistanciatelefone;

create or replace view vw_turma as
	select * from turma;

create or replace view vw_sala as
	select * from sala;

create or replace view vw_departamento as 
	select * from departamento;

create or replace view vw_ata as
	select * from ata;

create or replace view vw_possuiccnd as
	select * from possuiccnd;

create or replace view vw_pertenceccp as
	select * from pertenceccp;

create or replace view vw_pertencedd as
	select * from pertencedd;

create or replace view vw_pertencednd as
	select * from pertencednd;

create or replace view vw_pertenceepd as
	select * from pertenceepd;

create or replace view vw_possuircf as
	select * from possuircf;

create or replace view vw_realizaace as
	select * from realizaace;

create or replace view vw_realizaccre as
	select * from realizaccre;

create or replace view vw_compoe as
	select * from compoe;

create or replace view vw_cursa as
	select * from cursa;

create or replace view vw_disciplinaprereq as
	select * from disciplinaprereq;

create or replace view vw_efetua as
	select * from efetua;

create or replace view vw_estagia as
	select * from estagia;

create or replace view vw_inscreve as 
	select * from inscreve;

create or replace view vw_matriculado as
	select * from matriculado;

create or replace view vw_ehanterior as
	select * from ehanterior;

create or replace view vw_enade as
	select * from enade;


---------------
----- ETC -----
---------------

create or replace view vw_empresasAlunosEstagiam as
	select nome as "Empresa"
		from Empresa, Estudante, Estagia
		where Empresa.cnpj = Estagia.empresa_cnpj and
			  Estudante.ra = Estagia.estudante_ra;

create or replace view vw_turmasSalasTodosSemestres as
	select  dep.nome as "Departamento",
	        dis.codigo as "Disciplina",
	        tur.ano as "Ano",
	        tur.semestre as "Semestre",
	        tur.id as "Turma",
	        pes.pre_nome as "Docente",
	        sal.codigo as "Sala"
		from    Departamento dep,
		        PertenceDD pdd,
		        Disciplina dis,
		        Pessoa pes,
		        Docente doc,
		        Turma tur,
		        Sala sal
		where   tur.Docente_codigo = doc.codigo and
		        doc.Pessoa_rg = pes.rg and --Seleciona Docente
		        dep.sigla = pdd.Departamento_sigla and -- Seleciona Departamento
		        dis.codigo = pdd.Disciplina_codigo and
		        tur.Disciplina_codigo = dis.Codigo and -- Seleciona Disciplina
		        tur.id = sal.Turma_id; -- Seleciona Turma

create or replace view vw_turmasSalasSemestreAtual as
	select  dep.nome as "Departamento",
	        dis.codigo as "Disciplina",
	        tur.ano as "Ano",
	        tur.semestre as "semestre",
	        tur.id as "Turma",
	        pes.pre_nome as "Docente",
	        sal.codigo as "Sala"
		from    Departamento dep,
		        PertenceDD pdd,
		        Disciplina dis,
		        Pessoa pes,
		        Docente doc,
		        Turma tur,
		        Sala sal
		where   tur.Docente_codigo = doc.codigo and
		        doc.Pessoa_rg = pes.rg and --Seleciona Docente
		        dep.sigla = pdd.Departamento_sigla and -- Seleciona Departamento
		        dis.codigo = pdd.Disciplina_codigo and
		        tur.Disciplina_codigo = dis.Codigo and -- Seleciona Disciplina
		        tur.id = sal.Turma_id and -- Seleciona Turma
				tur.ano = date_part('year', now()) and --Seleciona ano atual
				tur.semestre = SemestreAtual(); -- Seleciona semestre atual

create or replace view vw_nomesdisciplinasprerequisitos as
	select d.nome as "Nome Disciplina Pré-Requisito", d2.nome as "Nome Disciplina"
		from Disciplina d, Disciplina d2, DisciplinaPreReq dp
		where d.codigo = dp.PreRequisito_codigo and d2.codigo = dp.Disciplina_codigo;
		--order by d.nome;

create or replace view vw_registroreunioes as
	select a.Reuniao_numero as "Numero Reuniao", r.dataInicio as "Data Inicio"
		from Ata a, Reuniao r
		where a.Reuniao_numero = r.numero;

create or replace view view_relatorioturmasdisciplinasemestre as
	select  dis.codigo as "Disciplina", tur.ano as "Ano", tur.semestre as "semestre", tur.id as "Turma", tur.vagas as "Vagas"
		from vw_disciplina dis, vw_turma tur
		where tur.Disciplina_codigo = dis.Codigo -- Seleciona Disciplina
		order by tur.ano, tur.semestre;

create or replace view vw_infosEstagio as
	select ra as "RA", nome as "Empresa", supEmpresa as "Sup. Empresa", supUniversidade as "Sup. Universidade"
		from Empresa, Estudante, Estagia
		where Empresa.cnpj = Estagia.empresa_cnpj and 
			  Estudante.ra = Estagia.estudante_ra;

create or replace view vw_estudanteatividadecomp as
	select e.ra as "Estudante", a.nome as "Atividade", a.codigo as "Codigo Atividade", e.presencial as "Presencial"
		from Estudante e, RealizaACE r, AtComp a
		where r.Estudante_ra = e.ra and
			  r.AtComp_codigo = a.codigo
		order by e.presencial;

create or replace view vw_reuniaomesatual as
	select numero, pauta, dataInicio
		from Reuniao
		where dataInicio between date_trunc('month',current_date) and
								 date_trunc('month',current_date) + INTERVAL'1 month' - INTERVAL'1 day';

create or replace view vw_estudanteturmasdisciplinas as
	select 	ra, nro_creditos, status
		from Estudante, Cursa, Turma, Disciplina
		where Estudante.ra = Cursa.Estudante_ra and
			  Cursa.Turma_id = Turma.id and
			  Turma.Disciplina_codigo = Disciplina.codigo
		order by Disciplina.codigo;
