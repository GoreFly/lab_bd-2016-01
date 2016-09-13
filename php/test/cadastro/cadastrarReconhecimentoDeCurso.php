<?php include "../info.php"; ?>
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
	<h1>Cadastrar Reconhecimento de Curso</h1>
	<form method="POST" action="../controlador.php">
		<label>Codigo</label></br>
		<input type="text" maxlength=10 name="codigo" required></br>
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
		<input name='submit' type="submit" value="Cadastrar Reconhecimento de Curso">
	</form>
</body>
</html>