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
	<h1>Cadastrar Calendario</h1>
	<form method="POST" action="../controlador.php">
		<label>Data Inicio</label></br>
		<input type="date" name="dataInicio" required></br>
		<label>Dias Letivos</label></br>
		<input type="number" name="dataInicio" required></br>
		<label>Tipo</label></br>
		<select name="tipo" required>
     		<option value="p">Presencial</option>
     		<option value="e">EaD</option>
     		<option value="a">Administrativo</option>
		</select></br>
		<input type="hidden" name="aprovado" value="false">
		<input type="checkbox" name="aprovado" value="true"> Aprovado<br>
		<label>Reunião</label></br>
		<select name="reuniao_numero" required>
			<?php
				$result = getReuniao();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['numero']; ?>"><?php echo $row['numero']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Calendario">
	</form>
</body>
</html>