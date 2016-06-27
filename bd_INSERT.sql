-- todo: 
--		Pessoa, Enade, Pessoa_Endereco, Pessoa_Telefone, Ata,
-- 		PossuiCCND, PertenceCCP, PossuiRCF, Inscreve


---------------------
----- ENTIDADES -----
---------------------

-- ATIVIDADE COMPLEMENTAR 
INSERT INTO atcomp VALUES (60, 'IC');
INSERT INTO atcomp VALUES (60, 'CATIJR');
INSERT INTO atcomp VALUES (20, 'PYLADIES');
INSERT INTO atcomp VALUES (120, 'MARATONA');
INSERT INTO atcomp VALUES (40, 'PETBCC');

-- RECONHECIMENTO DE CURSO 
INSERT INTO reconhecimento_de_curso VALUES('EC20152312');
INSERT INTO reconhecimento_de_curso VALUES('EM20112334');
INSERT INTO reconhecimento_de_curso VALUES('CC20160001');

-- CAMPUS
INSERT INTO campus VALUES ('Universidade Federal de São Carlos', 'http://www2.ufscar.br/home/index.php', 'UFSCARSC', '16 3216-8520','', 'Rua dos passarinhos 1');
INSERT INTO campus VALUES ('Universidade Federal de São Carlos', 'http://www2.ufscar.br/home/index.php', 'UFSCARARA', '16 3216-8530','', 'Rua dos passarinhos 2');
INSERT INTO campus VALUES ('Universidade Federal de São Carlos', 'http://www2.ufscar.br/home/index.php', 'UFSCARSO', '16 3216-8540','', 'Rua dos passarinhos 3');
INSERT INTO campus VALUES ('Universidade Federal de São Carlos', 'http://www2.ufscar.br/home/index.php', 'UFSCARLAG', '16 3216-8550','', 'Rua dos passarinhos 4');
INSERT INTO campus VALUES ('Universidade Federal de São Carlos', 'http://www2.ufscar.br/home/index.php', 'UFSCAR', '16 3216-8560','', 'Rua dos passarinhos 5');

-- CENTRO
INSERT INTO centro VALUES ('Centro de Ciências Exatas e de Tecnologia', 'http://www.ccet.ufscar.br/', '10,10', 'CCET', '16 3315-8888');
INSERT INTO centro VALUES ('Centro de Ciências Biológicas e da Saúde', 'http://www.ccbs.ufscar.br/', '10,20', 'CCBS', '16 3315-5555');
INSERT INTO centro VALUES ('Centro de Educação e Ciências Humanas', 'http://www.cech.ufscar.br/', '10,30', 'CECH', '16 3315-4444');
INSERT INTO centro VALUES ('Centro de Ciências Agrárias', 'http://www.cca.ufscar.br/', '10,40', 'CCA', '16 3315-6666');
INSERT INTO centro VALUES ('Centro de Qualquer Coisa', 'http://www.cqc.ufscar.br/', '10,50', 'CQC', '16 3315-1111');

-- CONSELHO DE CURSO
INSERT INTO conselhocurso VALUES ('Luciano Gabriel Francisco', 552054);
INSERT INTO conselhocurso VALUES ('Lucas Martins', 668515);

-- CURSO
INSERT INTO curso VALUES (0212, 'www.dc.ufscar.br/~bcc', 'Ciência da Computação', ROW('Indiana Jones', ROW('Sala1', 'Fixo', 05, 16, 34521452)));
INSERT INTO curso VALUES (0213, 'www2.dc.ufscar.br/~enc', 'Engenharia da Computação', ROW('He-man', ROW('Sala2', 'Fixo', 04, 16, 34521443)));
INSERT INTO curso VALUES (0214, 'www.dm.ufscar.br', 'Matematica', ROW('Aristoteles', ROW('Sala8', 'Fixo', 06, 16, 34521474)));
INSERT INTO curso VALUES (0215, 'www.dep.ufscar.br', 'Engenharia de Producao', ROW('Mario Bros', ROW('Sala', 'Fixo', 01, 16, 34521485)));
INSERT INTO curso VALUES (0216, 'www.dpsi.ufscar.br', 'Psicologia', ROW('James Bond', ROW('Sala007', 'Fixo', 02, 16, 34521007)));

-- DISCIPLINA
INSERT INTO disciplina VALUES ('08806', 'Calculo', 4, 'Obrigatoria');
INSERT INTO disciplina VALUES ('562312', 'LabBD', 2, 'Obrigatoria');
INSERT INTO disciplina VALUES ('1010', 'CAP', 8, 1, 'a');
INSERT INTO disciplina VALUES ('2020', 'CC1', 4, 1, 'a');
INSERT INTO disciplina VALUES ('3030', 'SO1', 4, 1, 'a');
INSERT INTO disciplina VALUES ('4040', 'ES2', 4, 1, 'a');
INSERT INTO disciplina VALUES ('5050', 'ADM', 4, 1, 'b');
INSERT INTO disciplina VALUES ('08806', 'Calculo 1', 4,	0, 'Obrigatoria');
INSERT INTO disciplina VALUES ('08807', 'Calculo 2', 4, 0, 'Obrigatoria');
INSERT INTO disciplina VALUES ('08808', 'Calculo 3', 4, 0, 'Obrigatoria');
INSERT INTO disciplina VALUES ('08809', 'Calculo 4', 4, 0, 'Obrigatoria');
INSERT INTO disciplina VALUES ('08810', 'Calculo Numerico', 4, 0, 'Obrigatoria');
INSERT INTO disciplina VALUES ('562311', 'BD', 2, 0, 'Obrigatoria');
INSERT INTO disciplina VALUES ('562312', 'LabBD', 2, 0, 'Obrigatoria');

-- EMPRESA
INSERT INTO empresa VALUES (2566856, 'Samsung', ROW('Rua da Samsung', 'Sem complemento', 'Centro', 'Jaguariúna', 'SP', 'Brasil', 13654987));
INSERT INTO empresa VALUES (2566855, 'Sony', ROW('Rua da Sony', 'Sem complemento', 'Centro', 'Campinas', 'SP', 'Brasil', 13654986));
INSERT INTO empresa VALUES (2566854, 'Panasonic', ROW('Rua da Panasonic', 'Sem complemento', 'Tijuco Preto', 'Sao Carlos', 'SP', 'Brasil', 13654985));
INSERT INTO empresa VALUES (2566853, 'Geico', ROW('Rua da Geico', 'Sem complemento', 'Ita', 'Jaguariúna', 'SP', 'Brasil', 13654984));
INSERT INTO empresa VALUES (2566852, 'Toshiba', ROW('Rua da Toshiba', 'Sem complemento', 'Centro', 'Jaguariúna', 'SP', 'Brasil', 13654983));

-- PESSOA

-- NUCLEO DOCENTE
INSERT INTO nucleodocente VALUES ('Jonas Filho', 66521);
INSERT INTO nucleodocente VALUES ('Vicente Joaquim', 74852);

-- ESTUDANTE
INSERT INTO estudante VALUES (407704, '41879402866', '2010', 10000, 's', true, false);
INSERT INTO estudante VALUES (564898, '65423215899', '1999', 16000, 's', false, true);
INSERT INTO estudante VALUES (985589, '84565878502', '2005', 12335, 'n', false, true);
INSERT INTO estudante VALUES (555555, '12345678900', '2016', 15000, 'p', true, false);
INSERT INTO estudante VALUES (444444, '45678909938', '2015', 11000, 'p', true, false);
INSERT INTO estudante VALUES (653243, '62547613783', '2018', 13000, 'p', false, false);
INSERT INTO estudante VALUES (615273, '12345678900', '2018', 15400, 'p', false, false);
INSERT INTO estudante VALUES (557218, '76283761111', '2016', 15000, 'p', false, false);


-- REUNIAO
INSERT INTO reuniao	VALUES (1, 'Pauta Reuniao 1', '2013-09-10');
INSERT INTO reuniao VALUES (2, 'Pauta Reuniao 2', '2013-10-01');
INSERT INTO reuniao	VALUES (3, 'Pauta Reuniao 3', '2013-10-12');
INSERT INTO reuniao VALUES (4, 'Pauta Reuniao 4', '2013-10-20');
INSERT INTO reuniao	VALUES (5, 'Pauta Reuniao 5', '2013-11-07');

-- CALENDARIO
INSERT INTO calendario VALUES ('2014-01-20', 138, 'p', 1);
INSERT INTO calendario VALUES ('2014-02-01', 128, 'p', 2);
INSERT INTO calendario VALUES ('2014-02-28', 100, 'p', TRUE, 3);
INSERT INTO calendario VALUES ('2014-02-28', 100, 'e', TRUE, 3);
INSERT INTO calendario VALUES ('2014-02-28', 100, 'a', TRUE, 2);

-- EVENTO
INSERT INTO evento VALUES ('2014-02-01', '2014-02-03', 'Inscrição em disciplinas', '2014-02-28', 'p');
INSERT INTO evento VALUES ('2014-03-07', '2014-03-07', 'Início das aulas', '2014-02-28', 'p');
INSERT INTO evento VALUES ('2014-02-14', '2014-02-28', 'Período para digitação das notas referente a 2015/2', '2014-02-28', 'e');
INSERT INTO evento VALUES ('2014-03-22', '2014-03-22', 'Prazo máximo para digitação das notas REC referente a 2015/2', '2014-02-28', 'e');
INSERT INTO evento VALUES ('2014-03-12', '2014-03-12', 'Prazo máximo para apresentação de recursos junto á ProGrad', '2014-02-28', 'a');
INSERT INTO evento VALUES ('2014-04-25', '2014-04-25', 'Prazo máximo para envio da Ficha de caracterização de Atividades curriculares/turmas referentes a 2015/2', '2014-02-28', 'a');

-- ATIVIDADE
INSERT INTO atividade VALUES ('2014-03-10', '2014-03-12', 'c', '2014-01-20', 'a');
INSERT INTO atividade VALUES ('2014-03-10', '2014-03-14', 'c', '2014-01-20', 'a');
INSERT INTO atividade VALUES ('2014-03-10', '2014-03-16', 'c', '2014-01-20', 'a');
INSERT INTO atividade VALUES ('2014-03-10', '2014-03-18', 'd', '2014-01-20', 'a');
INSERT INTO atividade VALUES ('2014-03-10', '2014-03-20', 'd', '2014-01-20', 'a');

-- DOCENTE
INSERT INTO docente VALUES ('A2020', 5286001623);
INSERT INTO docente VALUES ('B2020', 0058962587);

-- ENADE

-- VISITA
INSERT INTO visita VALUES ('2016-10-13','EM20112334','COMITe1','item');

-- FASE
INSERT INTO fase VALUES ('DOC...', '2012-01-01','EM1F12012A', 'CC20160001');

-- TÉCNICO ADMINISTRATIVO
INSERT INTO tecadm VALUES ('A2020', 5286001623);
INSERT INTO tecadm VALUES ('B2020', 0058962587);

-- PROJETO POLÍTICO-PEDAGÓGICO

-- POLO À DISTÂNCIA
INSERT INTO polodistancia VALUES(
	'Sao Carlos',
	985589,
	'13564350',
	'Americo Jacomino Canhoto',
	'Bloco Portugal',
	'Nova Sta Paula',
	'Sao Carlos',
	'SP',
	'Brasil',
	'(13,456132),(86,45623)',
	'Bruce',
	'Wayne',
	'bruce@wayne.com',
	'notBatman@wayne.com',
	'16-981075230',
	'19-993434774',
	'Jason',
	'Todd',
	'redhood@wayne.com',
	'robin@wayne.com',
	'19-32876266',
	'16-34153334'
);

-- FOTOS DE UM POLO
INSERT INTO polodistancia_foto VALUES (1, 'Sao Carlos',	':)');
INSERT INTO polodistancia_foto VALUES (2, 'Sao Carlos',	':´(');

-- TELEFONES DE UM POLO
INSERT INTO polodistancia_telefone VALUES ('Celular', 'Sao Carlos', '019', '993434774', '321', 'Celular1');
INSERT INTO polodistancia_telefone VALUES ('Fixo', 'Sao Carlos', '016', '34153334', '321', 'Fixo1');

-- TURMA
INSERT INTO turma VALUES ('A', 30, '08806',	5286001623);
INSERT INTO turma VALUES ('B', 25, '08806', 5286001623);
INSERT INTO turma VALUES ('A', 60, '562312', 0058962587);

-- SALA
INSERT INTO Sala VALUES ('A', '08806', 'AT9-129');
INSERT INTO Sala VALUES ('B', '08806', 'AT5-100');
INSERT INTO Sala VALUES ('A', '562312', 'AT9-131');

-- DEPARTAMENTO
INSERT INTO departamento VALUES ('Computação', 'http://www2.ufscar.br/home/index.php', 'DC', '16 3414-6582','', 'Estrada 1', 'UFSCARSC');
INSERT INTO departamento VALUES ('Biologia', 'http://www2.ufscar.br/home/index.php', 'DBIO', '16 3414-1010','', 'Estrada 2', 'UFSCARARA');
INSERT INTO departamento VALUES ('Ciências Sociais', 'http://www2.ufscar.br/home/index.php', '16 3414-2020','', 'Estrada 3', 'UFSCARSO');
INSERT INTO departamento VALUES ('Agronomia', 'http://www2.ufscar.br/home/index.php', 'DAG', '16 3414-3036','', 'Estrada 4', 'UFSCARLAG');
INSERT INTO departamento VALUES ('Deboa', 'http://www2.ufscar.br/home/index.php', 'DBOA', '16 3414-0000','', 'Estrada 5', 'UFSCAR');

-- ENDEREÇO DE PESSOA

-- TELEFONE DE PESSOA

-- ATA


---------------------
-- RELACIONAMENTOS --
---------------------

-- Possui (Conselho_Curso x Nucleo_Docente)

-- Pertence (ConselhoCurso x Pessoa)

-- PertenceDD (Disciplina x Departamento)
INSERT INTO pertencedd VALUES('DC', '08806');
INSERT INTO pertencedd VALUES('DC', '562312');

-- Pertence (Docente x NucleoDocente)	
INSERT INTO pertencednd VALUES ('A2020', 5286001623, '557784007', '02/08/2013');
INSERT INTO pertencednd VALUES ('B2020', 0058962587, '557785019', '25/02/2014');

-- Possui (Reconhecimento_Curso x Fase)

-- Realiza (AtComp x Estudante)
INSERT INTO realizaace VALUES ('407704', 'IC');
INSERT INTO realizaace VALUES ('985589', 'CATIJR');
INSERT INTO realizaace VALUES ('444444', 'PYLADIES');
INSERT INTO realizaace VALUES ('407704', 'MARATONA');
INSERT INTO realizaace VALUES ('564898', 'CATIJR');

-- Realiza (ConselhoCurso x Reuniao)
INSERT INTO realizaccre VALUES (1, 'abc');
INSERT INTO realizaccre VALUES (2, 'abcd');
INSERT INTO realizaccre VALUES (3, 'abcde');
INSERT INTO realizaccre VALUES (4, 'abcdef');
INSERT INTO realizaccre VALUES (5, 'abcdefg');

-- Compoe (Disciplina x Curso)
INSERT INTO compoe VALUES (1010, 10, true, '1');
INSERT INTO compoe VALUES (1010, 2, true, '1');
INSERT INTO compoe VALUES (5050, 10, true, '6');
INSERT INTO compoe VALUES (5050, 2, true, '7');
INSERT INTO compoe VALUES (3030, 10, true, '6');

-- Cursa (Estudante x Turma)
insert into cursa values (551910,1,3,5.9,10,'P');
insert into cursa values (551911,2,7,2.7,6,'A');
insert into cursa values (551912,3,5,3.9,7,'A');
insert into cursa values (551913,4,1,9.9,1,'P');
insert into cursa values (551914,5,2,7.9,11,'P');

-- Disciplina Pré-Requisito (Disciplina x Disciplina)
INSERT INTO disciplinaprereq VALUES ('08807', '08806');
INSERT INTO disciplinaprereq VALUES ('08808', '08807');
INSERT INTO disciplinaprereq VALUES ('08809', '08808');
INSERT INTO disciplinaprereq VALUES ('08810', '08806');
INSERT INTO disciplinaprereq VALUES ('562312', '562311');

-- Efetua (NucleoDocente x Reuniao)
INSERT INTO efetua VALUES (1914, 1);
INSERT INTO efetua VALUES (1914, 2);
INSERT INTO efetua VALUES (2020, 3);
INSERT INTO efetua VALUES (2020, 4);
INSERT INTO efetua VALUES (2020, 5);

-- Estagia (Estudante x Empresa)
INSERT INTO estagia VALUES('2016-02-20', '2016-06-21', '41879402866', 2566856, ROW(25145885696, 'Ronaldo'), ROW(154448556225, 'Ademar'), 'Carta Avaliacao', 'Termo Compromisso');
INSERT INTO estagia VALUES('2016-04-28', '2016-10-09', '65423215899', 2566855, ROW(25145885697, 'Jose'), ROW(154448556225, 'Ademar'), 'Carta Avaliacao1', 'Termo Compromisso1');
INSERT INTO estagia VALUES('2016-04-10', '2015-12-13', '84565878502', 2566854, ROW(25145885695, 'Carlos'), ROW(154448556225, 'Ademar'), 'Carta Avaliacao2', 'Termo Compromisso2');
INSERT INTO estagia VALUES('2016-02-20', '2016-10-07', '84565878504', 2566853, ROW(25145885694, 'Arthur'), ROW(154448556225, 'Ademar'), 'Carta Avaliacao3', 'Termo Compromisso3');
INSERT INTO estagia VALUES('2016-02-03', '2016-12-11', '84565878503', 2566852, ROW(25145885693, 'Joaquina'), ROW(154448556225, 'Ademar'), 'Carta Avaliacao4', 'Termo Compromisso4');

--Inscreve (Estudante x Turma)

-- Matriculado (Estudante x Curso)
INSERT INTO matriculado VALUES (555555, 10, 'grade 1', '6', true, '6', '2013-03-01', '2016-12-01');
INSERT INTO matriculado VALUES (444444, 10, 'grade 1', '8', true, '6', '2012-03-01', '2015-12-01');
INSERT INTO matriculado VALUES (653243, 2, 'grade 1', '2', true, '2', '2016-03-01', '2020-12-01');
INSERT INTO matriculado VALUES (615273, 2, 'grade 1', '2', true, '2', '2016-03-01', '2020-12-01');
INSERT INTO matriculado VALUES (557218, 10, 'grade 1', '6', true, '6', '2013-03-01', '2016-12-01');

-- EhAnterior (Calendario (Anterior) x Calendario (Posterior))
INSERT INTO ehanterior VALUES ('2014-02-01', 'p', '2014-02-28', 'p');
INSERT INTO ehanterior VALUES ('2014-01-20', 'p', '2014-02-01',	'p');

-- Projeto Politico Pedagogico
INSERT INTO ProjetoPoliticoPedagogico VALUES (ROW("true", "false", "false"), 552054, 0212);
INSERT INTO ProjetoPoliticoPedagogico VALUES (ROW("false", "true", "false"), 668515, 0213);
INSERT INTO ProjetoPoliticoPedagogico VALUES (ROW("false", "false", "true"), 668515, 0213);
