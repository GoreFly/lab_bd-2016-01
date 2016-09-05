--- codigos de curso, que uma pessoa participou em validacao
Drop Function CODCURSORC(rgP in varchar);

CREATE OR REPLACE FUNCTION CODCURSORC(rgP in varchar)
RETURNS varchar AS
$$
declare 
CODCURSOrec varchar;
begin
   CODCURSOrec:=participaRC.Reconhecimentocodigo
   from participaRC 
   where rgP=rg; 

   return CODCURSOrec;
END;
$$
LANGUAGE 'plpgsql';

