CREATE TABLE ReconhecimentoDeCurso 
(
	codigoR character varying(10) not null,
	codigo integer,

	CONSTRAINT  ReconhecimentoDeCurso_fk FOREIGN KEY(codigo) REFERENCES Curso(codigo),
	CONSTRAINT ReconhecimentoDeCurso_pk PRIMARY KEY (codigo,codigoR)
);



CREATE TABLE Fase 
(
	comite_avaliador character varying(400),
	itens character varying(400),
	id character varying(10) not null,
	tipo INTEGER,
	documentos character varying(400),
	periodo date,
	ReconhecimentoDeCurso_codigo character varying(10), 
	curso_codigo INTEGER,


	CONSTRAINT Fase_pk PRIMARY KEY (id,curso_codigo,ReconhecimentoDeCurso_codigo),
	CONSTRAINT Fase_ReconhecimentoDeCurso_fk FOREIGN KEY (ReconhecimentoDeCurso_codigo,curso_codigo) REFERENCES ReconhecimentoDeCurso (codigoR,codigo) 
	on update cascade
);

CREATE TABLE participaRC
{
 	reconhecimentocodigo character varying(10) not null,
 	id character varying(10) not null,
 	curso_codigo INTEGER not null,
 	rg character varying(9) not null,
 	
 	CONSTRAINT participaRC_pk PRIMARY KEY(id,reconhecimentocodigo, curso_codigo, rg),
 	CONSTRAINT participaRC_fk FOREIGN KEY(reconhecimentocodigo,curso_codigo,id) REFERENCES Fase(ReconhecimentoDeCurso_codigo,curso_codigo,id),
 	CONSTRAINT participaRCPes_fk FOREIGN KEY(rg) REFERENCES Pessoa(rg)
};

INSERT INTO reconhecimento_de_curso VALUES('EC20152312',0215);
INSERT INTO reconhecimento_de_curso VALUES('EP20112334',0213);
INSERT INTO reconhecimento_de_curso VALUES('CC20160001',0212);

INSERT INTO fase VALUES('Sem Comite','itens','ENC2016001',1,'DOC','2016-10-13','EC2015231',0215);
INSERT INTO fase VALUES('Sem Comite','itens','ENC2016002',2,'DOC','2016-10-25','EC2015231',0215);
INSERT INTO fase VALUES('Comite1','itens','ENC2016003',3,'DOC','2016-10-13','EC2015231',0215);
INSERT INTO fase VALUES('Sem Comite','itens','ENP2016001',1,'DOC','2016-10-13','EP20112334',0213);

INSERT INTO participaRC VALUES('EC2015231','ENC2016003',0215,'123456789');
