<?php 
	include '../info.php';
	session_start("estudante");
?>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <title>BD</title>

  <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
	<a href="../index.php"> <- Voltar</a>
	<h1>Cadastrar Estudante x Turma</h1>
	<form method="POST" action="../controlador.php">
		<?php if(!isset($_SESSION['ra'])){?>
			<label>Estudante</label></br>
			<select name="estudante" required>
				<?php
					$result = getEstudante();
					while ($row = pg_fetch_array($result)) {
	     				?>
	     				<option value="<?php echo $row['ra']; ?>"><?php echo $row['ra']; ?></option>
	     				<?php
	   				}
				 ?>
			</select></br>
		<?php }else{ ?>
			<input type="hidden" name="estudante" value="<?php echo $_SESSION['ra']; ?>"
		<?php } ?>
		<label>Turma</label></br>
		<select name="turma" required>
			<?php
				$result = getTurma();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['disciplina_codigo']. '|' .$row['ano'] . '|' .$row['semestre']. '|' .$row['id']; ?>"><?php echo $row['disciplina_codigo']. '|' .$row['ano'] . '|' .$row['semestre']. '|' .$row['id']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Período</label></br>
		<input type="date" name="periodo"></br>

		<label>Deferimento</label></br>
		<input type="radio" name="deferimento" value="false"> Não<br>
		<input type="radio" name="deferimento" value="true"> Sim<br>

		<label>Prioridade de Inscrição</label></br>
		<input type="number	" name="prioridade"></br>


		<input name='submit' type="submit" value="Cadastrar Inscreve">
	</form>
</body>
</html>