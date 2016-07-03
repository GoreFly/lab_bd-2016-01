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
	<h1>Cadastrar Sala</h1>
	<form method="POST" action="../controlador.php">
		<label>Código</label></br>
		<input type="text" maxlength=20 name="codigo" required></br>
		<label>Turma</label></br>
		<select name="turma" required>
			<?php
				$result = getTurma();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['id'].'|'.$row['ano'].'|'.$row['semestre'].'|'.$row['disciplina_codigo']; ?>"><?php echo $row['disciplina_codigo'].$row['ano'].$row['semestre'].$row['id'].' - '.$row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Sala">
	</form>
</body>
</html>