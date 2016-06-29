--Procedimento para inserir na tabela Disciplina
create or replace function InsereDisciplina (cod int, sgla char, nroCreditos int, catgr char)
returns void as $$
begin		
	INSERT INTO Disciplina (Codigo, Sigla, Nro_creditos, Categoria)
		VALUES (cod, sgla, nroCreditos, catgr);
end;
$$ language plpgsql;
end InsereDisciplina;

--Procedimento para inserir na tabela DisciplinaPreReq
create or replace function InsereDisciplinaPreRequisito (discCod int, codPreReq int)
returns void as $$
begin		
	INSERT INTO DisciplinaPreReq (Disciplina_codigo, codigoPreRequisito)
		VALUES (discCod,codPreReq);
end;
$$ language plpgsql;
end InsereDisciplinaPreRequisito;