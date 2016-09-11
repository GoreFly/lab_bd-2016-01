CREATE TABLE Nucleo_Docente
(  
	Presidentepre character varying(20),
	Presidentemeio character varying(20),
	Presidentesobre character varying(20),
	id integer not null,
	
	CONSTRAINT presidentepk FOREIGN KEY (Presidentepre,Presidentemeio,Presidentesobre) REFERENCES Pessoa(pre_nome,meio_nome,ultimo_nome),

	CONSTRAINT ConselhoCurso_pk PRIMARY KEY (id) 
);


CREATE TABLE Ata
( 
	Documentos character varying(20), 
	id_CC integer not null,
	id_Reuniao integer not null,
	

	CONSTRAINT Ata_CC_fk FOREIGN KEY (id_CC) REFERENCES Conselho_Curso (id),
	CONSTRAINT Ata_Reuniao_fk FOREIGN KEY (id_Reuniao) REFERENCES Reuniao (id),
	CONSTRAINT Ata_PK PRIMARY KEY(id_CC, id_Reuniao)
);



insert into Nucleo_Docente(Presidente,id)
values ('Jonas','', 'Filho', 66521)

insert into Nucleo_Docente(Presidente,id)
values ('Vicente',' ',' Joaquim', 74852)

insert into Ata(Documentos)
values (' ')
insert into Ata(Documentos)
values (' ')

