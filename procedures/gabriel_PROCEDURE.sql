PROCEDURE turmasSalasSemestre(anoV IN INTEGER, semestreV IN INTEGER) IS
  BEGIN
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
		tur.ano = anoV AND -- Seleciona Ano
		tur.semestre = semestreV; -- Seleciona Semestre
  END; 