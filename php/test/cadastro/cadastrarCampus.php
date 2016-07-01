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
	<h1>Cadastrar Campus</h1>
	<form method="POST" action="../controlador.php">
		<label>Nome</label></br>
		<input type="text" maxlength=50 name="nome"></br>
		<label>Website</label></br>
		<input type="text" maxlength=100 name="website"></br>
		<label>Sigla</label></br>
		<input type="text" maxlength=10 name="sigla"required></br>
		<label>Telefone1</label></br>
		<input type="text" maxlength=20 name="telefone1"required></br>
		<label>Telefone2</label></br>
		<input type="text" maxlength=20 name="telefone2"></br>
		<label>Endereço</label></br>
		<input type="text" maxlength=100 name="endereco"required></br>
		<input name='submit' type="submit" value="Cadastrar Campus">
	</form>
</body>
</html>