DROP TABLE ProjetoPoliticoPedagogico;

CREATE TYPE gradecurricular AS (
	Optativa BOOLEAN,
	Obrigatoria BOOLEAN,
	Eletiva BOOLEAN
);

CREATE TABLE ProjetoPoliticoPedagogico(
	grade gradecurricular
	ConselhoCurso_id integer NOT NULL, -- Conselho de Curso que define PPP
	Curso_codigo integer, -- Curso que possui PPP
	CONSTRAINT ProjetoPoliticoPedagogico_ConselhoCurso_fk FOREIGN KEY (ConselhoCurso_id) REFERENCES ConselhoCurso (id),
	CONSTRAINT ProjetoPoliticoPedagogico_Curso_fk FOREIGN KEY (Curso_codigo) REFERENCES Curso (codigo),
	CONSTRAINT ProjetoPoliticoPedagogico_pk PRIMARY KEY (ConselhoCurso_id, grade)
);
