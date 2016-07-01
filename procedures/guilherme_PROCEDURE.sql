CREATE OR REPLACE FUNCTION insereVisita
	(v_periodo DATE,
	v_comite character varying(400),
	v_itens character varying(400),
v_cod character varying(10))
RETURNS void AS $$
BEGIN
	INSERT INTO visita (periodo, comite_avaliador,itens,ReconhecimentoDeCurso_codigo)
		VALUES (
			v_periodo,
			v_comite,
			v_itens,
			v_cod		);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;

-----------------------------

CREATE OR REPLACE FUNCTION insereFase
	(f_id character varying(10),
	f_doc character varying(400),
	f_periodo DATE,
f_cod character varying(10))
RETURNS void AS $$
BEGIN
	INSERT INTO Fase (id, documentos,periodo,ReconhecimentoDeCurso_codigo)
		VALUES (
			f_id,
			f_doc,
			f_periodo,
			f_cod		);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
end insereFase;

------------------------------------------------


CREATE OR REPLACE FUNCTION insereRDC
	(r_cod character varying(10))
RETURNS void AS $$
BEGIN
	INSERT INTO ReconhecimentoDeCurso (codigo)
		VALUES (r_cod);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
end insereRDC;
