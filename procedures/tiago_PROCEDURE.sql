--Procedimento para inserir nas tabela Cursa
create or replace function InsereCursa (RG character varying (9), ra integer, cod character varying(10),id char , ano integer,semest integer,media numeric default null,frenq numeric default null, stat char default null)
returns void as $$
begin		
	INSERT INTO Cursa(Estudante_Pessoa_rg ,	Estudante_ra ,Turma_Disciplina_codigo ,	Turma_id ,Turma_ano ,Turma_semestre ,media,	frenquencia,status )
		VALUES (RG , ra , cod ,id , ano ,semest ,media ,frenq , stat );
end;
$$ language plpgsql;

 --Procedimento para inserir nas tabela RealizaCCRe
create or replace function InsereRealizaCCRe (id integer, codigo integer)
returns void as $$
begin		
	INSERT INTO RealizaCCRe (ID_conselho ,Codigo_Reuniao)
		VALUES (id,codigo);
end;
$$ language plpgsql;

--Procedimento para inserir nas tabela fase
create or replace function InsereFase (id_fase character varying(10),doc character varying(400) default null,tempo date default null,cod character varying(10) default null)
returns void as $$
begin		
	INSERT INTO Visita(id ,documentos,periodo , ReconhecimentoDeCurso_codigo)
		VALUES (id_fase,doc ,tempo ,cod);
end;
$$ language plpgsql;

--Procedimento para inserir nas tabela visita
create or replace function InsereVisita (tempo date, comitein character varying(10) default null,item character varying(400) default null,cod character varying default null)
returns void as $$
begin		
	INSERT INTO Visita(periodo ,comite_avaliador ,itens , ReconhecimentoDeCurso_codigo)
		VALUES (tempo , comitein ,item ,cod );
end;
$$ language plpgsql;

--Procedimento para inserir nas tabela ReconhecimentoDeCurso
create or replace function InsereReconhecimentoDeCurso  (cod character varying(10))
returns void as $$
begin		
	INSERT INTO ReconhecimentoDeCurso(codigo)
		VALUES (cod);
end;
$$ language plpgsql;
