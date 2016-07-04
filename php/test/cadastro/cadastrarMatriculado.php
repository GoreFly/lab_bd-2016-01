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
	<h1>Cadastrar Estudante x Curso</h1>
	<form method="POST" action="../controlador.php">

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

		<label>Curso</label></br>
		<select name="curso" required>
			<?php
				$result = getCurso();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Grade</label></br>
		<input type="text" maxlength=15 name="grade"></br>

		<label>Período</label></br>
		<input type="text" maxlength=1 name="periodo"></br>

		<label>Status</label></br>
		<input type="checkbox" name="status" value="false" checked> Não<br>
		<input type="checkbox" name="status" value="true"> Sim<br>

		<label>Perfil</label></br>
		<input type="text" maxlength=1 name="perfil"></br>

		<label>Ano Ingresso</label></br>
		<input type="date" name="anoIngresso" required></br>

		<label>Ano Término</label></br>
		<input type="date" name="anoTermino" required></br>



		<input name='submit' type="submit" value="Cadastrar Matriculado">
	</form>
</body>
</html>