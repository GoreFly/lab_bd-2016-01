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
	<h1>Cadastrar Projeto Político Pedagogico</h1>
	<form method="POST" action="../controlador.php">
		<input type="hidden" name="grade_obrigatoria" value="false">
		<input type="checkbox" name="grade_obrigatoria" value="true"> Obrigatoria<br>
		<input type="hidden" name="grade_optativa" value="false">
		<input type="checkbox" name="grade_optativa" value="true"> Optativa<br>
		<input type="hidden" name="grade_eletiva" value="false">
		<input type="checkbox" name="grade_eletiva" value="true"> Eletiva<br>
		<label>Curso</label></br>
		<select name="codigo" required>
			<?php
				$result = getCurso();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['codigo'].' - '.$row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<label>Conselho de Curso</label></br>
		<select name="id" required>
			<?php
				$result = getConselhoCurso();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['id']; ?>"><?php echo $row['id']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Projeto Político Pedagogico">
	</form>
</body>
</html>