--Function
create or replace function MostraNroVagasTurmas (id_turma in char, ano_turma in integer, semestre_turma in integer)
returns integer as $$
declare
	turma_cur cursor for select SUM(vagas)
			     from   turma t
			     where  t.id = id_turma and
				    t.ano = ano_turma and
				    t.semestre = semestre_turma;
	nro_vagas integer;
begin		
	open turma_cur;
	fetch turma_cur into nro_vagas;
	close turma_cur;
return nro_Vagas;
end;
$$ language plpgsql;
end MostraNroVagasTurmas;



--Tabela Turma
 CREATE TABLE Turma(
 	id_turma character varying(1),
 	vagas integer,
 	codigo_disciplina character varying(10),
 	codigo_docente integer,
 	CONSTRAINT turma_codigo_disciplina foreign key (codigo_disciplina) references Disciplina(Codigo),
 	CONSTRAINT turma_codigo_docente foreign key (codigo_docente) references Docente(CodDocente),
 	CONSTRAINT turma_pk primary key (codigo_disciplina, id_turma)
 );
 
