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
	<h1>Cadastrar Turma</h1>
	<form method="POST" action="../controlador.php">
		<label>ID</label></br>
		<input type="text" maxlength=1 name="id" required></br>
		<label>Ano</label></br>
		<input type="text"  maxlength=4 name="ano" required></br>
		<label>Semestre</label></br>
		<input type="number" name="semestre" value=1 min=1 max=2 required></br>
		<label>Vagas</label></br>
		<input type="number" name="vagas" ></br>
		<label>Disciplina</label></br>
		<select name="disciplina_codigo" required>
			<?php
				$result = getDisciplina();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['codigo'].' - '.$row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<label>Docente</label></br>
		<select name="docente_codigo" required>
			<?php
				$result = getDocente();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['codigo']; ?>"><?php echo $row['pre_nome'].' '.$row['meio_nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br></br>
		<input name='submit' type="submit" value="Cadastrar Turma">
	</form>
</body>
</html>