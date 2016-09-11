
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
                                      
                                          Ppre character varying(20) default null,
                                          Pmeio character varying(20) default null,
                                          Psobre character varying(20) default null,
                                          codigoI INTEGER
	                                  )
RETURNS void AS $$
BEGIN


            INSERT INTO vw_NucleoDocente (
                                           
                                           Presidentepre,
                                           Presidentemeio,
                                           Presidentesobre,
                                           codigo
                                         )
		VALUES (
			Ppre,
                        Pmeio,
                        Psobre,
                        codigoI
		       );
 
END; $$ LANGUAGE plpgsql CALLED ON NULL INPUT;

