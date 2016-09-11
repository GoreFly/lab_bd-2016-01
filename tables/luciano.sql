CREATE TABLE ConselhoCurso
(  
	representantepre character varying(20),
	representantemeio character varying(20),
	representantesobre character varying(20),
	id integer not null,

	CONSTRAINT representantefk FOREIGN KEY (representantepre,representantemeio,representantesobre) REFERENCES Pessoa(pre_nome,meio_nome,ultimo_nome),
	CONSTRAINT ConselhoCurso_pk PRIMARY KEY (id) 
);


CREATE TABLE PertenceCCP 
( 
	categoria character varying(20), 
	periodo date,
	Pessoa_rg integer,
	ConselhoCurso_id INTEGER,

	CONSTRAINT PertenceCP_Pessoa_fk FOREIGN KEY (Pessoa_rg) REFERENCES Pessoa (rg),
	CONSTRAINT PertenceCP_ConselhoCurso_fk FOREIGN KEY (ConselhoCurso_id) REFERENCES ConselhoCurso (id),
	CONSTRAINT pertence_PK PRIMARY KEY(Pessoa_rg, ConselhoCurso_id)
);

insert into Coselho_Curso(representante,id)
values ('Luciano', 'Gabriel' ,' Francisco', 552054)

insert into Coselho_Curso(representante,id)
values ('Lucas' ,' ',' Martins', 668515)



insert into pertenceCP(categoria, periodo)
values ('diretor', '05-03-2016')

insert into pertenceCP(categoria, periodo)
values ('secretario', '07-09-2014')
