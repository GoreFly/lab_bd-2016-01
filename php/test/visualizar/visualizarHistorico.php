<?php
	session_start("estudante");
	if(session_id() == '' or !isset($_SESSION['ra'])){
		header("Location: estudanteRa.php");
		die();
	}
?>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <title>BD</title>
    <link href="basic.css" rel="stylesheet" type="text/css" />
  <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
	<a href="../index.php"> <- Voltar</a>
	<h1>Historico</h1>
	<table>
		<tr>
			<td>Disciplina</td>
			<td>Turma</td>
			<td>Creditos</td>
			<td>Nota</td>
			<td>Frequencia</td>
			<td>Status</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getHistorico($_SESSION['ra']);
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['disciplina']; ?></td>
				<td><?php echo $row['turma']; ?></td>
				<td><?php echo $row['creditos']; ?></td>
				<td><?php echo $row['nota']; ?></td>
				<td><?php echo $row['frequencia']; ?></td>
				<td><?php echo $row['status']; ?></td>
			</tr>
			<?php
			}
		?>
	</table>
	<h1>Atividade Complementar</h1>
	<table>
		<tr>
			<td>Codigo</td>
			<td>Nome</td>
			<td>Creditos</td>
			<td>Semestres</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getAtComp($_SESSION['ra']);
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['atcomp_codigo']; ?></td>
				<td><?php echo $row['atcomp_nome']; ?></td>
				<td><?php echo $row['atcomp_creditos']; ?></td>
				<td><?php echo $row['nrosemestres']; ?></td>
			</tr>
			<?php
			}
		?>
	</table>
	<p>Créditos Obrigatorios : <?php echo getTotalCreditosObrigatorio($_SESSION['ra'])['totalcreditosobrig'] ?></p>
	<p>Créditos Não Obrigatorios : <?php echo getTotalCreditosNaoObrigatorio($_SESSION['ra'])['totalcreditosnaoobrig'] ?></p>
	<p>Créditos Complementares : <?php echo getTotalCreditosComplementar($_SESSION['ra'])['totalcreditoscompl'] ?></p>
</body>
</html>