<?php
	require_once('dbconnect.php');

	if(isset($_GET)){
		switch ($_GET['tabela']) {
			case 'fase':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_fase WHERE id = $1 AND reconhecimentodecurso_codigo = $2");
				$param = array($values[0], $values[1]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarFase.php");
				else
					echo pg_result_error($result);

				break;

			case 'projetopoliticopedagogico':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_projetopoliticopedagogico WHERE (grade).obrigatoria = $1 AND (grade).optativa = $2 AND (grade).eletiva = $3 AND conselhocurso_id = $4");
				$param = array($values[0], $values[1], $values[2],  $values[3]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarProjetoPoliticoPedagogico.php");
				else
					echo pg_result_error($result);

				break;

			case 'reconhecimentodecurso':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_reconhecimentodecurso WHERE codigo = $1");
				$param = array($values[0]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarReconhecimentoDeCurso.php");
				else
					echo pg_result_error($result);

				break;

			case 'polodistancia':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_polodistancia WHERE nome = $1");
				$param = array($values[0]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarPoloDistancia.php");
				else
					echo pg_result_error($result);

				break;

			case 'ata':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_ata WHERE conselhocurso_id = $1 AND reuniao_numero = $2");
				$param = array($values[0], $values[1]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarAta.php");
				else
					echo pg_result_error($result);

				break;

			case 'turma':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_turma WHERE disciplina_codigo = $1 AND id = $2 AND ano = $3 AND semestre = $4");
				$param = array($values[0],$values[1],$values[2],$values[3]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarTurma.php");
				else
					echo pg_result_error($result);

				break;

			case 'reuniao':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_reuniao WHERE numero = $1");
				$param = array($values[0]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarReuniao.php");
				else
					echo pg_result_error($result);

				break;

			case 'atividade':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_atividade WHERE datainicio = $1");
				$param = array($values[0]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarAtividade.php");
				else
					echo pg_result_error($result);

				break;

			case 'tecnicoadministrativo':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_tecadm WHERE rg = $1 AND codigo = $2");
				$param = array($values[0], $values[1]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarTecnicoAdministrativo.php");
				else
					echo pg_result_error($result);

				break;

			case 'visita':
				$values = explode(",", $_GET['pk']);
				$result = pg_prepare($conectabd, "my_query", "DELETE FROM vw_visita WHERE periodo = $1 AND reconhecimentodecurso_codigo = $2");
				$param = array($values[0], $values[1]);
				$result = pg_execute($conectabd, "my_query", $param);

				if($result)
					header("Location: visualizar/visualizarVisita.php");
				else
					echo pg_result_error($result);

				break;

		}
	}
	
?>