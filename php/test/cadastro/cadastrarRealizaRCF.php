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
	<h1>Cadastrar Reconhecimento de Curso x Fase</h1>
	<form method="POST" action="../controlador.php">

		<label>Reconhecimento de Curso</label></br>
		<select name="reconhecimentoCurso" required>
			<?php
				$result = getReconhecimentoDeCurso();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['codigo']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Fase</label></br>
		<select name="fase" required>
			<?php
				$result = getFase();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['id']; ?>"><?php echo $row['id']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Período</label></br>
		<input type="date" name="periodo" required></br>


		<input name='submit' type="submit" value="Cadastrar PertenceRCF">
	</form>
</body>
</html>