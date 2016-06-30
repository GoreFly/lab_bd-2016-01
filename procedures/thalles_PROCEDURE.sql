--Procedimento para inserir nas tabela Atividade
create or replace function InsereAtComp (cod character varying (10), cred integer, letra character varying(100) default null)
returns void as $$
begin		
	INSERT INTO AtComp(codigo,creditos,nome)
		VALUES (cod, cred, letra);
end;
$$ language plpgsql;

--Procedimento para inserir nas tabela Compoe (Disciplina x Curso)
create or replace function InsereCompoe(cod character varying (10), cod_curso integer, obg boolean default null,letra char default null)
returns void as $$
begin		
	INSERT INTO Compoe(Disciplina_codigo,Curso_codigo,obrigatoriedade ,	perfil)
		VALUES (cod , cod_curso , obg ,letra);
end;
$$ language plpgsql;

--Procedimento para inserir nas tabela Efetua
create or replace function InsereEfetua(cod integer,num integer)
returns void as $$
begin		
	INSERT INTO Efetua(NucleoDocente_codigo,Reuniao_numero)
		VALUES (cod ,num);
end;
$$ language plpgsql;

--Procedimento para inserir nas tabela Matriculado
create or replace function InsereMatriculado (ra integer, cod_curso integer, grade_matri character varying(15) default null,letra char default null, tempo char default null,stat boolean default null,perf char defaul null,ingresso date default null ,termino date default null)
returns void as $$
begin		
	INSERT INTO Matriculado(Estudante_ra,Curso_codigo ,	grade , periodo ,status, perfil , ano_ingresso,	ano_termino)
		VALUES (ra , cod_curso, grade_matri ,letra , tempo ,stat ,perf ,ingresso ,termino);
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION TrocaIra(nRa integer, novoIra integer)
RETURN void AS $$
BEGIN
    UPDATE vw_estudante
    SET ira = novoIra
    WHERE ra = nRa;
END;
$$ LANGUAGE plpgsql;
