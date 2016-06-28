--Funcao que retorna o semestre atual(Caso Janeiro a Junho retorna 1 senão 2)
CREATE OR REPLACE FUNCTION semestre_atual
	RETURN INTEGER;
IS 
	sem_at INTEGER; 
BEGIN
	sem_at := EXTRACT(month FROM CURRENT_DATE);
	IF sem_at < 7 THEN
		sem_at := 1;
	ELSE
		sem_at := 2;
	ENDIF;
	RETURN sem_at;
END;

CREATE VIEW view_turmasSalasTodosSemestres AS
SELECT  dep.nome as "Departamento",
        dis.codigo as "Disciplina",
        tur.ano as "Ano",
        tur.semestre as "semestre",
        tur.id as "Turma",
        pes.pre_nome as "Docente",
        sal.codigo as "Sala"
FROM    Departamento as dep,
        PertenceDD as pdd,
        Disciplina as dis,
        Pessoa as pes,
        Docente as doc,
        Turma as tur,
        Sala as sal
WHERE   tur.Docente_codigo = doc.codigo AND
        doc.Pessoa_rg = pes.rg AND --Seleciona Docente
        dep.sigla = pdd.Departamento_sigla AND -- Seleciona Departamento
        dis.codigo = pdd.Disciplina_codigo AND
        tur.Disciplina_codigo = dis.Codigo AND -- Seleciona Disciplina
        tur.id = sal.Turma_id; -- Seleciona Turma

CREATE VIEW view_turmasSalasSemestreAtual AS
SELECT  dep.nome as "Departamento",
        dis.codigo as "Disciplina",
        tur.ano as "Ano",
        tur.semestre as "semestre",
        tur.id as "Turma",
        pes.pre_nome as "Docente",
        sal.codigo as "Sala"
FROM    Departamento as dep,
        PertenceDD as pdd,
        Disciplina as dis,
        Pessoa as pes,
        Docente as doc,
        Turma as tur,
        Sala as sal
WHERE   tur.Docente_codigo = doc.codigo AND
        doc.Pessoa_rg = pes.rg AND --Seleciona Docente
        dep.sigla = pdd.Departamento_sigla AND -- Seleciona Departamento
        dis.codigo = pdd.Disciplina_codigo AND
        tur.Disciplina_codigo = dis.Codigo AND -- Seleciona Disciplina
        tur.id = sal.Turma_id AND -- Seleciona Turma
	tur.ano = date_part('year', timestamp localtimestamp) AND --Seleciona ano atual
	tur.semestre = semestre_atual; -- Seleciona semestre atual