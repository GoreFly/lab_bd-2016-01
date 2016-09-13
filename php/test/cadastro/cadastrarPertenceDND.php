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
	<h1>Cadastrar Docente x Núcleo Docente</h1>
	<form method="POST" action="../controlador.php">

		<label>Docente</label></br>
		<select name="docente" required>
			<?php
				$result = getDocente();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo'].'|'.$row['pessoa_rg']; ?>"><?php echo $row['codigo']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Núcleo Docente</label></br>
		<select name="nucleoDocente" required>
			<?php
				$result = getNucleoDocente();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['presidente']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Período</label></br>
		<input type="datetime" name="periodo"></br>


		<input name='submit' type="submit" value="Cadastrar PertenceDND">
	</form>
</body>
</html>