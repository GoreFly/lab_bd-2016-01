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
	<h1>Cadastrar Conselho de Curso x Pessoa</h1>
	<form method="POST" action="../controlador.php">

		<label>Pessoa</label></br>
		<select name="pessoa" required>
			<?php
				$result = getPessoa();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['rg']; ?>"><?php echo $row['pre_nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Conselho Curso</label></br>
		<select name="conselhoCurso" required>
			<?php
				$result = getConselhoCurso();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['id']; ?>"><?php echo $row['representante']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Categoria</label></br>
		<input type="text" maxlength=20 name="categoria"></br>

		<label>Período</label></br>
		<input type="date" name="periodo"></br>

		<input name='submit' type="submit" value="Cadastrar PertenceCCP">
	</form>
</body>
</html>