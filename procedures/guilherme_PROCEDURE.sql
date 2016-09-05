
-----------------------------

CREATE OR REPLACE FUNCTION insereFase
	(
	f_comite_avaliador character varying(400),
	f_itens character varying(400),
	f_id character varying(10) not null,
	f_tipo INTEGER,
	f_documentos character varying(400),
	f_periodo date,
	f_ReconhecimentoDeCurso_codigo character varying(10), 
	f_curso_codigo INTEGER)
RETURNS void AS $$
BEGIN
	INSERT INTO Fase (comite,itens,id,tipo,doc,periodo,ReconhecimentoDeCursocodigo,cursocodigo)
		VALUES (
			f_comite_avaliador,
			f_itens,
			f_id,
			f_tipo,
			f_documentos,
			f_periodo,
			f_ReconhecimentoDeCurso_codigo,
			f_curso_codigo);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
end insereFase;

------------------------------------------------


CREATE OR REPLACE FUNCTION insereRDC
	(r_cod character varying(10),
	r_cursocod INTEGER)
RETURNS void AS $$
BEGIN
	INSERT INTO ReconhecimentoDeCurso (codigoRC,codigo)
		VALUES (r_cod,
			r_cursocod);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
end insereRDC;
