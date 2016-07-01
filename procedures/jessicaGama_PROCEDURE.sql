
-- INSEIR ATA

CREATE OR REPLACE FUNCTION insereAta( ConselhoCurso_id integer ,
	                              Reuniao_numero integer  )
RETURNS void AS $$
BEGIN

if not exists(select 1 from ConselhoCurso where id!= ConselhoCurso_id) then
		raise exception 'O ID de conselho de curso não existe/incorreto.';
		return;
		
elsif not exists(select 1 from Reuniao where numero!= Reuniao_numero) then
		raise exception 'O ID de conselho de curso não existe/incorreto.';
		return;
		else
            INSERT INTO vw_Ata (
                                  ConselhoCurso_id,
                                   Reuniao_numero
                                )
		VALUES (
			  ConselhoCurso_id,
                          Reuniao_numero
		       );
end if; 
END; $$ LANGUAGE plpgsql CALLED ON NULL INPUT;

-- INSERIR NUCLEO DOCENTE
CREATE OR REPLACE FUNCTION NucleoDocente( 
                                          codigo integer ,
                                          Presidente character varying(20) default null	                                 
	                                  )
RETURNS void AS $$
BEGIN


            INSERT INTO vw_NucleoDocente (
                                           codigo,
                                           Presidente
                                         )
		VALUES (
			  codigo,
                          Presidente
		       );
 
END; $$ LANGUAGE plpgsql CALLED ON NULL INPUT;

