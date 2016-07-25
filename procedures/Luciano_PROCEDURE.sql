--	Procedure para realizar inserções na tabela ConselhoCurso

CREATE OR REPLACE FUNCTION insereConselhoCurso
	(novo_Pessoa_rg character varying(20),
	novo_id integer )
RETURNS void AS $$
BEGIN
	INSERT INTO ConselhoCurso(Pessoa_rg,id)
		VALUES (
			novo_Pessoa_rg, 
			novo_id 
			
		);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
----------------------------------------------
--	Procedure para realizar inserções na tabela PertenceCCP
CREATE OR REPLACE FUNCTION inserePertenceCCP
	(new_categoria character varying(20), 
	new_periodo date,
	new_Pessoa_rg character varying(9) ,
	new_ConselhoCurso_id integer 
)
RETURNS void AS $$
BEGIN
	INSERT INTO PertenceCCP(categoria, periodo,Pessoa_rg,ConselhoCurso_id )
		VALUES (
			new_categoria , 
			new_periodo ,
			new_Pessoa_rg  ,
			new_ConselhoCurso_id 
			
		);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
