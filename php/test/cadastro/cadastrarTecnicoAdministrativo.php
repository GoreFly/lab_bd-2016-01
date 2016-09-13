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
	<h1>Cadastrar Tecnico Adiministrativo</h1>
	<form method="POST" action="../controlador.php">
		<label>Código</label></br>
		<input type="number" name="codigo" required></br>
		<label>Nome</label></br>
		<select name="pessoa_rg" required>
			<?php
				$result = getPessoa();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['rg']; ?>"><?php echo $row['pre_nome'].' ('.$row['rg'].')'; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Tecnico Administrativo">
	</form>
</body>
</html>