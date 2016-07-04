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
	<h1>Cadastrar Estudante x Pólo Distância</h1>
	<form method="POST" action="../controlador.php">

		<label>Docente</label></br>
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

		<label>Pólo Distância</label></br>
		<select name="poloDistancia" required>
			<?php
				$result = getPoloDistancia();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['nome']; ?>"><?php echo $row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>


		<input name='submit' type="submit" value="Cadastrar PertenceEPD">
	</form>
</body>
</html>