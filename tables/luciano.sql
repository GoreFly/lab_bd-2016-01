CREATE TABLE ConselhoCurso
(  
	Pessoa_rg character varying(9),
	id integer not null,

	CONSTRAINT ConselhoCurso_Pessoa_fk FOREIGN KEY (Pessoa_rg) REFERENCES Pessoa(rg),
	CONSTRAINT ConselhoCurso_pk PRIMARY KEY (id) 
);

CREATE TABLE PertenceCCP 
( 
	categoria character varying(20), 
	periodo date,
	Pessoa_rg character varying(9) ,
	ConselhoCurso_id integer not null,

	CONSTRAINT PertenceCP_Pessoa_fk FOREIGN KEY (Pessoa_rg) REFERENCES Pessoa (rg),
	CONSTRAINT PertenceCP_ConselhoCurso_fk FOREIGN KEY (ConselhoCurso_id) REFERENCES ConselhoCurso (id),
	CONSTRAINT pertence_PK PRIMARY KEY(Pessoa_rg, ConselhoCurso_id)
);

insert into ConselhoCurso(Pessoa_rg,id)
values ('A2020', 552054);

insert into ConselhoCurso(Pessoa_rg,id)
values ('B2020', 668515);

insert into PertenceCCP(categoria, periodo,Pessoa_rg,ConselhoCurso_id )
values ('Diretor', '05-03-2016','A2020',552054);

insert into PertenceCCP(categoria, periodo,Pessoa_rg,ConselhoCurso_id )
values ('Secretario', '07-09-2014','B2020',668515);

