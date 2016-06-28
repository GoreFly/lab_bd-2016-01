--	Procedure para realizar inserções na tabela ProjetoPoliticoPedagogico

CREATE OR REPLACE FUNCTION inserePPP
	(p_Optativa BOOLEAN,
	p_Obrigatoria BOOLEAN,
	p_Eletiva BOOLEAN)
RETURNS void AS $$
BEGIN
	INSERT INTO ProjetoPoliticoPedagogico (optativa, obrigatoria, eletiva)
		VALUES (
			p_Optativa
			p_Obrigatoria
			p_Eletiva
		);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;