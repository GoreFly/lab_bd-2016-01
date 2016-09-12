--Possui (Conselho_Curso x Nucleo_Docente) - possuiCCND 
CREATE TABLE PossuiCCND
(
	conselho_id VARCHAR(10),
	nucleo_docente_codigo VARCHAR(10),

	CONSTRAINT possuiccnd_pk PRIMARY KEY (conselho_id, nucleo_docente_codigo),
	CONSTRAINT possuiccnd_conselho_fk FOREIGN KEY (conselho_id) REFERENCES Conselho_curso (id_conselho),
	CONSTRAINT possuiccnd_nucleodocente_fk FOREIGN KEY (nucleo_docente_codigo) REFERENCES Nucleo_Docente (Codigo_NDocente) 
);


--Inscreve (Estudante x Turma)
CREATE TABLE Inscreve
(
	data DATE,
	deferimento BOOLEAN,
	prioridade_inscricao INT,
	id_turma VARCHAR(1),
	ra INT,

	CONSTRAINT inscreve_pk PRIMARY KEY (ra, id_turma),
	CONSTRAINT inscreve_estudante_fk FOREIGN KEY (ra) REFERENCES Estudante (ra),
	CONSTRAINT inscreve_turma_fk FOREIGN KEY (id_turma) REFERENCES Turma (id_turma) 

);
