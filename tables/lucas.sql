DROP TABLE DisciplinaPreReq;

CREATE TABLE DisciplinaPreReq
(
	Disciplina_codigo character varying(10) not null,
	codigoPreRequisito character varying (10) not null,

	CONSTRAINT Disciplina_FK foreign key (Disciplina_codigo) references Disciplina (codigo),
	CONSTRAINT PreReq_FK foreign key (codigoPreRequisito) references Disciplina(codigo),
	CONSTRAINT DisciplinaPreReq_pk primary key (Disciplina_codigo, codigoPreRequisito)
);
