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
	<h1>Cadastrar Calendário x Calendário</h1>
	<form method="POST" action="../controlador.php">

		<label>Calendário Anterior</label></br>
		<select name="calendario1" required>
			<?php
				$result = getCalendario();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['datainicio']. '|' .$row['tipo']; ?>"><?php echo $row['tipo'].'.'.$row['datainicio']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Calendário Posterior</label></br>
		<select name="calendario2" required>
			<?php
				$result = getCalendario();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['datainicio']. '|' .$row['tipo']; ?>"><?php echo $row['tipo'].'.'.$row['datainicio']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		

		<input name='submit' type="submit" value="Cadastrar EhAnterior">
	</form>
</body>
</html>