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
	<h1>Cadastrar Fase</h1>
	<form method="POST" action="../controlador.php">
		<label>Codigo</label></br>
		<input type="text" maxlength=10 name="codigo" required></br>
		<label>Documentos</label></br>
		<input type="text" maxlength=400 name="documentos"></br>
		<label>Periodo</label></br>
		<input type="date" name="periodo"></br>
		<label>Reconhecimento de Curso</label></br>
		<select name="codigoRC" required>
			<?php
				$result = getReconhecimentoDeCurso();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['codigo']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Fase">
	</form>
</body>
</html>