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
	<h1>Visita</h1>
	<form method="POST" action="../controlador.php">
		<label>Periodo</label></br>
		<input type="date" name="periodo"required></br>
		<label>Comite Avaliador</label></br>
		<input type="text" maxlength=400 name="comite"></br>
		<label>Itens</label></br>
		<input type="text" maxlength=400 name="itens"></br>
		<label>Reconhecimento de Curso</label></br>
		<select name="codigo" required>
			<?php
				$result = getReconhecimentoDeCurso();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['codigo']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Visita">
	</form>
</body>
</html>