  <?php
	require_once('dbconnect.php');
	function getAtividadeComplementar(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_atcomp');
		return $result;
	}

	function getReconhecimentoDeCurso(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_reconhecimentodecurso');
		return $result;
	}

	function getCampus(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_campus');
		return $result;
	}

	function getCentro(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_centro');
		return $result;
	}

	function getConselhoCurso(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_conselhocurso');
		return $result;
	}

	function getCurso(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT codigo, website, nome, coordenador, (coordenador).nome AS coordNome FROM vw_curso ORDER BY codigo');
		return $result;
	}

	function getEmpresa(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT *,(endereco).rua AS endrua, (endereco).complemento AS endcomplemento,
										(endereco).bairro AS endbairro, (endereco).cidade AS endcidade, (endereco).uf AS enduf,
										(endereco).pais AS endpais, (endereco).cep AS endcep FROM vw_empresa');
		return $result;
	}

	function getDisciplina(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_disciplina');
		return $result;
	}

	function getPessoa(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_pessoa ORDER BY pre_nome');
		return $result;
	}

	function getPessoaEndereco(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_pessoaendereco');
		return $result;
	}

	function getPessoaTelefone(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_pessoatelefone');
		return $result;
	}

	function getNucleoDocente(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_nucleodocente');
		return $result;
	}

	function getEstudante(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_estudante AS est INNER JOIN vw_pessoa AS pes ON (est.pessoa_rg = rg)');
		return $result;
	}

	function getReuniao(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_reuniao');
		return $result;
	}

	function getCalendario(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_calendario ORDER BY tipo');
		return $result;
	}

	function getEvento(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_evento');
		return $result;
	}

	function getAtividade(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_atividade');
		return $result;
	}

	function getAta(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_ata');
		return $result;
	}

	function getDocente(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_docente AS doc,vw_pessoa AS pes WHERE pes.rg = doc.pessoa_rg ORDER BY pes.pre_nome');
		return $result;
	}

	function getVisita(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_visita');
		return $result;
	}

	function getFase(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_fase');
		return $result;
	}

	function getTecAdm(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_tecadm AS tec,vw_pessoa AS pes WHERE pes.rg = tec.pessoa_rg ORDER BY pes.pre_nome');
		return $result;
	}

	function getProjetoPoliticoPedagogico(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT *, (grade).optativa, (grade).obrigatoria, (grade).eletiva FROM vw_projetopoliticopedagogico AS ppp, vw_curso AS cur, vw_conselhocurso AS con WHERE ppp.curso_codigo=cur.codigo AND ppp.conselhocurso_id=con.id');
		return $result;
	}

	function getPoloDistancia(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_polodistancia');
		return $result;
	}

	function getPoloDistanciaFoto(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_polodistanciafoto');
		return $result;
	}

	function getPoloDistanciaTelefone(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_polodistanciatelefone');
		return $result;
	}

	function getTurma(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_turma AS tur, vw_disciplina AS dis WHERE tur.disciplina_codigo = dis.codigo');
		return $result;
	}

	function getSala(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_sala');
		return $result;
	}

	function getDepartamento(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT *, dep.endereco AS endcam FROM vw_departamento AS dep, vw_campus AS cam WHERE dep.campus_sigla=cam.sigla');
		return $result;
	}

	// Possui (Conselho_Curso x Nucleo_Docente)
	function getPossuiCcNd(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_possuiccnd');
		return $result;
	}

	// Pertence (ConselhoCurso x Pessoa)
	function getPertenceCcP(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_pertenceccp');
		return $result;
	}

	// Pertence (Disciplina x Departamento)
	function getPertenceDD(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_pertencedd');
		return $result;
	}

	// Pertence (Docente x NucleoDocente)
	function getPertenceDNd(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_pertencednd');
		return $result;
	}

	// Pertence (Estudante x PoloDistancia)
	function getPertenceEPd(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_pertenceepd');
		return $result;
	}

	// Possui (Reconhecimento_Curso x Fase)
	function getPossuiRcF(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_possuircf');
		return $result;
	}

	// Realiza (AtComp x Estudante)
	function getRealizaAcE(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_realizaace');
		return $result;
	}

	// Realiza (ConselhoCurso x Reuniao)
	function getRealizaCcR(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_realizaccre');
		return $result;
	}

	function getCompoe(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_compoe');
		return $result;
	}

	function getCursa(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_cursa');
		return $result;
	}

	function getDisciplinaPreReq(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_disciplinaprereq');
		return $result;
	}

	function getEfetua(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_efetua');
		return $result;
	}

	function getEstagia(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_estagia');
		return $result;
	}

	function getInscreve(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_inscreve');
		return $result;
	}

	function getMatriculado(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_matriculado');
		return $result;
	}

	function getEhAnterior(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_ehanterior');
		return $result;
	}

	function getEnade(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_enade');
		return $result;
	}

	function getEmpresaAlunosEstagiam(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_empresasAlunosEstagiam');
		return $result;
	}

	function getTurmasSalasTodosSemestres(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_turmasSalasTodosSemestres');
		return $result;
	}

	function getTurmasSalasSemestreAtual(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_turmasSalasSemestreAtual');
		return $result;
	}

	function getNomesdisciplinasprerequisitos(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_nomesdisciplinasprerequisitos');
		return $result;
	}

	function getRegistroReunioes(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_registroreunioes');
		return $result;
	}

	function getRelatorioTurmaDisciplinaSemestre(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM view_relatorioturmasdisciplinasemestre');
		return $result;
	}

	function getInfoEstagio(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_infosEstagio');
		return $result;
	}

	function getEstudanteAtividadeComp(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_estudanteatividadecomp');
		return $result;
	}

	function getReuniaoMesAtual(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_reuniaomesatual');
		return $result;
	}

	function getEstudanteTurmaDisciplinas(){
		global $conectabd;
		$result = pg_query($conectabd, 'SELECT * FROM vw_estudanteturmasdisciplinas');
		return $result;
	}


?>
