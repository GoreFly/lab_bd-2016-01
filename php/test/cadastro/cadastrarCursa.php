<?php include '../info.php'; ?>
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

		<label>Estudante</label></br>
		<select name="estudante" required>
			<?php
				$result = getEstudante();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['ra']. '|' .$row['pessoa_rg']; ?>"><?php echo $row['ra']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Turma</label></br>
		<select name="turma" required>
			<?php
				$result = getTurma();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['disciplina_codigo']. '|' .$row['ano'] . '|' .$row['semestre']. '|' .$row['id']; ?>"><?php echo $row['id']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Média</label></br>
		<input type="number" name="media"></br>

		<label>Frequência (em %)</label></br>
		<input type="number" name="media"></br>

		<label>Status ('c', 't', 'r' ou 'a')</label></br>
		<input type="text" maxlength=1 name="status"></br>

		<input name='submit' type="submit" value="Cadastrar Cursa">
	</form>
</body>
</html>