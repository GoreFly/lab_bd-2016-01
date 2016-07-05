<?php
	require_once('dbconnect.php');

	if(isset($_POST['submit'])){
		switch ($_POST['submit']) {
			case 'Cadastrar Atividade Complementar':
				if($_POST['nome']!=""){
					$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereAtComp($1,$2,$3)');
					$param = array($_POST['codigo'],$_POST['creditos'],$_POST['nome']);
				}else{
					$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereAtComp($1,$2, )');
					$param = array($_POST['codigo'],$_POST['creditos']);
				}
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Reconhecimento de Curso':
				$param = array($_POST['codigo']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereReconhecimentoDeCurso($1)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Visita':
				$param = array($_POST['codigo'],$_POST['periodo']);
				if($_POST['comite']!=""){
					array_push($param, $_POST['comite']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['itens']!=""){
					array_push($param, $_POST['itens']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereVisita($1,$2,$3,$4)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Fase':
				$param = array($_POST['codigoRC'],$_POST['codigo']);
				if($_POST['documentos']!=""){
					array_push($param, $_POST['documentos']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['periodo']!=""){
					array_push($param, $_POST['periodo']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereFase($1,$2,$3,$4)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Pessoa':
				$param = array($_POST['rg']);
				if($_POST['pre_nome']!=""){
					array_push($param, $_POST['pre_nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['meio_nome']!=""){
					array_push($param, $_POST['meio_nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['ultimo_nome']!=""){
					array_push($param, $_POST['ultimo_nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['email']!=""){
					array_push($param, $_POST['email']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['email_institucional']!=""){
					array_push($param, $_POST['email_institucional']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['etnia']!=""){
					array_push($param, $_POST['etnia']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['sexo']!=""){
					array_push($param, $_POST['sexo']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['data_nascimento']!=""){
					array_push($param, $_POST['data_nascimento']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['nome_mae']!=""){
					array_push($param, $_POST['nome_mae']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['nome_pai']!=""){
					array_push($param, $_POST['nome_pai']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['origem_cidade']!=""){
					array_push($param, $_POST['origem_cidade']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['origem_estado']!=""){
					array_push($param, $_POST['origem_estado']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['origem_pais']!=""){
					array_push($param, $_POST['origem_pais']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InserePessoa($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Estudante':
				$param = array($_POST['pessoa_rg'],$_POST['ra'],$_POST['ira']);
				if($_POST['anoConcEM']!=""){
					array_push($param, $_POST['anoConcEM']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['presencial']!=""){
					array_push($param, $_POST['presencial']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['graduando']!=""){
					array_push($param, $_POST['graduando']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['posGraduando']!=""){
					array_push($param, $_POST['posGraduando']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereEstudante($1,$2,$3,$4,$5,$6,$7)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Docente':
				$param = array($_POST['pessoa_rg'],$_POST['codigo']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereDocente($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Tecnico Administrativo':
				$param = array($_POST['pessoa_rg'],$_POST['codigo']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereTecAdm($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Nucleo Docente':
				$param = array($_POST['codigo']);
				if($_POST['presidente']!=""){
					array_push($param, $_POST['presidente']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereNucleoDocente($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Campus':
				$param = array($_POST['sigla'],$_POST['telefone1'],$_POST['endereco']);
				if($_POST['nome']!=""){
					array_push($param, $_POST['nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['website']!=""){
					array_push($param, $_POST['website']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['telefone2']!=""){
					array_push($param, $_POST['telefone2']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereCampus($1,$2,$3,$4,$5,$6)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Departamento':
				$param = array($_POST['sigla'],$_POST['telefone1'],$_POST['endereco'],$_POST['campusSigla']);
				if($_POST['nome']!=""){
					array_push($param, $_POST['nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['website']!=""){
					array_push($param, $_POST['website']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['telefone2']!=""){
					array_push($param, $_POST['telefone2']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereDepartamento($1,$2,$3,$4,$5,$6,$7)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Centro':
				$param = array($_POST['sigla'],$_POST['telefone1']);
				if($_POST['nome']!=""){
					array_push($param, $_POST['nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['website']!=""){
					array_push($param, $_POST['website']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['geo']!=""){
					array_push($param, $_POST['geo']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['telefone2']!=""){
					array_push($param, $_POST['telefone2']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereCentro($1,$2,$3,$4,$5,$6)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Conselho de Curso':
				$param = array($_POST['id']);
				if($_POST['representante']!=""){
					array_push($param, $_POST['representante']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereConselhoCurso($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Curso':
				$param = array($_POST['codigo']);
				if($_POST['website']!=""){
					array_push($param, $_POST['website']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['nome']!=""){
					array_push($param, $_POST['nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['coord_nome']!=""){
					array_push($param, $_POST['coord_nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tel_origem']!=""){
					array_push($param, $_POST['tel_origem']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tel_tipo']!=""){
					array_push($param, $_POST['tel_tipo']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tel_ramal']!=""){
					array_push($param, $_POST['tel_ramal']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tel_ddd']!=""){
					array_push($param, $_POST['tel_ddd']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tel_numero']!=""){
					array_push($param, $_POST['tel_numero']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereCurso($1,$2,$3,($4,($5,$6,$7,$8,$9)))');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Projeto Político Pedagogico':
				$param = array($_POST['id'],$_POST['codigo']);
				if(isset($_POST['grade_optativa']) && $_POST['grade_optativa']!=""){
					array_push($param, $_POST['grade_optativa']);
				}else{
					array_push($param,NULL);
				}
				if(isset($_POST['grade_obrigatoria']) && $_POST['grade_obrigatoria']!=""){
					array_push($param, $_POST['grade_obrigatoria']);
				}else{
					array_push($param,NULL);
				}
				if(isset($_POST['grade_eletiva']) && $_POST['grade_eletiva']!=""){
					array_push($param, $_POST['grade_eletiva']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereProjetoPoliticoPedagogico($1,$2,$3,$4,$5)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Disciplina':
				$param = array($_POST['codigo']);
				if($_POST['nome']!=""){
					array_push($param, $_POST['nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['nro_creditos']!=""){
					array_push($param, $_POST['nro_creditos']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['categoria']!=""){
					array_push($param, $_POST['categoria']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereDisciplina($1,$2,$3,$4)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Turma':
				$param = array($_POST['id'],$_POST['ano'],$_POST['semestre'],$_POST['disciplina_codigo'],$_POST['docente_codigo']);
				if($_POST['vagas']!=""){
					array_push($param, $_POST['vagas']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereTurma($1,$2,$3,$4,$5,$6)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Sala':
				$pieces = explode('|', $_POST['turma']);
				$param = array($_POST['codigo'],$pieces[0],$pieces[1],$pieces[2],$pieces[3]);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereSala($1,$2,$3,$4,$5)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Empresa':
				$param = array($_POST['cnpj']);
				if($_POST['nome']!=""){
					array_push($param, $_POST['nome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['rua']!=""){
					array_push($param, $_POST['rua']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['complemento']!=""){
					array_push($param, $_POST['complemento']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['bairro']!=""){
					array_push($param, $_POST['bairro']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['cidade']!=""){	
					array_push($param, $_POST['cidade']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['uf']!=""){
					array_push($param, $_POST['uf']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['pais']!=""){
					array_push($param, $_POST['pais']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['cep']!=""){
					array_push($param, $_POST['cep']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereEmpresa($1,$2,($3,$4,$5,$6,$7,$8,$9))');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Reuniao':
				$param = array($_POST['numero']);
				if($_POST['pauta']!=""){
					array_push($param, $_POST['pauta']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['dataInicio']!=""){
					array_push($param, $_POST['dataInicio']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereReuniao($1,$2,$3)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Calendario':
				$param = array($_POST['dataInicio'],$_POST['diasLetivos'],$_POST['tipo'],$_POST['reuniao_numero'],$_POST['aprovado'],NULL);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereCalendario($1,$2,$3,$4,$5,$6)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Evento':
				$pieces = explode('|', $_POST['calendario']);
				$param = array($pieces[0],$pieces[1],$_POST['dataInicio']);
				if($_POST['dataFim']!=""){
					array_push($param, $_POST['dataFim']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['descricao']!=""){
					array_push($param, $_POST['descricao']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereEvento($1,$2,$3,$4,$5)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Atividade':
				$pieces = explode('|', $_POST['calendario']);
				$param = array($_POST['dataInicio'],$pieces[0],$pieces[1]);
				if($_POST['dataFim']!=""){
					array_push($param, $_POST['dataFim']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['atributo']!=""){
					array_push($param, $_POST['atributo']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereAtividade($1,$2,$3,$4,$5)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Ata':
				$param = array($param,$_POST['conselhoCurso_id'],$param,$_POST['reuniao_numero']);
				if($_POST['documentos']!=""){
					array_push($param, $_POST['documentos']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereAta($1,$2,$3)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Polo a Distancia':
				$param = array($_POST['nome']);
				if($_POST['cep']!=""){
					array_push($param, $_POST['cep']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['rua']!=""){
					array_push($param, $_POST['rua']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['complemento']!=""){
					array_push($param, $_POST['complemento']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['bairro']!=""){
					array_push($param, $_POST['bairro']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['cidade']!=""){
					array_push($param, $_POST['cidade']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['uf']!=""){
					array_push($param, $_POST['uf']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['pais']!=""){
					array_push($param, $_POST['pais']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['pontoGeoreferenciado']!=""){
					array_push($param, $_POST['pontoGeoreferenciado']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['coordenadorNome']!=""){
					array_push($param, $_POST['coordenadorNome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['coordenadorSobrenome']!=""){
					array_push($param, $_POST['coordenadorSobrenome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['coordenadorEmail1']!=""){
					array_push($param, $_POST['coordenadorEmail1']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['coordenadorEmail2']!=""){
					array_push($param, $_POST['coordenadorEmail2']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['coordenadorTelefone1']!=""){
					array_push($param, $_POST['coordenadorTelefone1']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['coordenadorTelefone2']!=""){
					array_push($param, $_POST['coordenadorTelefone2']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tutorNome']!=""){
					array_push($param, $_POST['tutorNome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tutorSobrenome']!=""){
					array_push($param, $_POST['tutorSobrenome']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tutorEmail1']!=""){
					array_push($param, $_POST['tutorEmail1']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tutorEmail2']!=""){
					array_push($param, $_POST['tutorEmail2']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tutorTelefone1']!=""){
					array_push($param, $_POST['tutorTelefone1']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['tutorTelefone2']!=""){
					array_push($param, $_POST['tutorTelefone2']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InserePoloDistancia($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar PertenceCCP':
				$param = array($_POST['pessoa'],$_POST['conselhoCurso']);
				if($_POST['categoria']!=""){
					array_push($param, $_POST['categoria']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['periodo']!=""){
					array_push($param, $_POST['periodo']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InserePertenceCCP($1,$2,$3,$4)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar PertenceDD':
				$param = array($_POST['departamento'],$_POST['Disciplina']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InserePertenceDD($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar PertenceDND':
				$pieces = explode('|', $_POST['docente']);
				$param = array($pieces[1],$_POST['nucleoDocente'],$pieces[0]);
				if($_POST['periodo']!=""){
					array_push($param, $_POST['periodo']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InserePossuiCCND($1,$2,$3,$4)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar PertenceEPD':
				$pieces = explode('|', $_POST['estudante']);
				$param = array($pieces[0],$pieces[1],$_POST['poloDistancia']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InserePessoaPertenceEPD($1,$2,$3)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar PertenceRCF':
				$param = array($_POST['periodo'],$_POST['reconhecimentoCurso'],$_POST['fase']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InserePossuiRCF($1,$2,$3)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar PertenceACE':
				$pieces = explode('|', $_POST['estudante']);
				$param = array($pieces[1],$pieces[0],$_POST['atividadeComplementar'],$_POST['semestres']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereRealizaACE($1,$2,$3,$4)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar RealizarCCRe':
				$param = array($_POST['conselhoCurso'],$_POST['reuniao']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereRealizaCCRe($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Compoe':
				$param = array($_POST['disciplina'],$_POST['curso']);
				if($_POST['obrigatoriedade']!=""){
					array_push($param, $_POST['obrigatoriedade']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['perfil']!=""){
					array_push($param, $_POST['perfil']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereCompoe($1,$2,$3,$4)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Cursa':
				$pieces = explode('|', $_POST['estudante']);
				$pieces2 = explode('|', $_POST['turma']);
				$param = array($pieces[1],$pieces[0],$pieces2[0],$pieces2[3],$pieces2[1],$pieces2[2]);
				if($_POST['media']!=""){
					array_push($param, $_POST['media']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['frequencia']!=""){
					array_push($param, $_POST['frequencia']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['status']!=""){
					array_push($param, $_POST['status']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereCursa($1,$2,$3,$4,$5,$6,$7,$8,$9)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar DisciplinaPreReq':
				$param = array($_POST['disciplina1'],$_POST['disciplina2']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereDisciplinaPreReq($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Efetua':
				$param = array($_POST['nucleoDocente'],$_POST['reuniao']);
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereEfetua($1,$2)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			case 'Cadastrar Estagia':
				$param = array($_POST['ra'],$_POST['empresa']);
				if($_POST['dataInicio']!=""){
					array_push($param, $_POST['dataInicio']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['dataTermino']!=""){
					array_push($param, $_POST['dataTermino']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['cpfSupervidorEmpresa']!=""){
					array_push($param, $_POST['cpfSupervidorEmpresa']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['nomeSupervidorEmpresa']!=""){
					array_push($param, $_POST['nomeSupervidorEmpresa']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['cpfSupervidorUniversidade']!=""){
					array_push($param, $_POST['cpfSupervidorUniversidade']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['nomeSupervidorUniversidade']!=""){
					array_push($param, $_POST['nomeSupervidorUniversidade']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['cartaAvaliacao']!=""){
					array_push($param, $_POST['cartaAvaliacao']);
				}else{
					array_push($param,NULL);
				}
				if($_POST['termoCompromisso']!=""){
					array_push($param, $_POST['termoCompromisso']);
				}else{
					array_push($param,NULL);
				}
				$result = pg_prepare($conectabd, "my_query", 'SELECT * FROM InsereEstagia($1,$2,$s3,$4,($5,$6),($7,$8),$9,$10)');
				$result = pg_execute($conectabd, "my_query", $param);
				break;

			default:
				header("Location: index.php");
		}
		if($result)
			header("Location: index.php");
		else
			echo pg_result_error($result);
	}
	
?>