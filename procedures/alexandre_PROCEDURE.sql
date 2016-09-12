--	Procedure para realizar inserções na tabela ProjetoPoliticoPedagogico

CREATE OR REPLACE FUNCTION inserePPP
	(p_Optativa BOOLEAN,
	p_Obrigatoria BOOLEAN,
	p_Eletiva BOOLEAN,
	P_cod INTEGER)
RETURNS void AS $$
BEGIN
	INSERT INTO ProjetoPoliticoPedagogico (optativa, obrigatoria, eletiva,pppcod)
		VALUES (
			p_Optativa,
			p_Obrigatoria,
			p_Eletiva,
			P_cod
		);
END;
$$ LANGUAGE plpgsql CALLED ON NULL INPUT;
