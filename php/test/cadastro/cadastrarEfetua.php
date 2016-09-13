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
	<h1>Cadastrar Núcleo Docente x Reunião </h1>
	<form method="POST" action="../controlador.php">

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

		<label>Reunião</label></br>
		<select name="reuniao" required>
			<?php
				$result = getReuniao();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['numero']; ?>"><?php echo $row['numero']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Efetua">
	</form>
</body>
</html>