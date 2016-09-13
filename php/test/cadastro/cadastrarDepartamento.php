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
	<h1>Cadastrar Departamento</h1>
	<form method="POST" action="../controlador.php">
		<label>Nome</label></br>
		<input type="text"  maxlength=50 name="nome"></br>
		<label>Website</label></br>
		<input type="text"  maxlength=100 name="website"></br>
		<label>Sigla</label></br>
		<input type="text"  maxlength=10 name="sigla"></br>
		<label>Telefone 1</label></br>
		<input type="text"  maxlength=20 name="telefone1" required></br>
		<label>Telefone 2</label></br>
		<input type="text"  maxlength=20 name="telefone2"></br>
		<label>Endereço</label></br>
		<input type="text"  maxlength=100 name="endereco" required></br>
		<label>Campus</label></br>
		<select name="campusSigla" required>
			<?php
				$result = getCampus();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['sigla']; ?>"><?php echo $row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Departamento">
	</form>
</body>
</html>