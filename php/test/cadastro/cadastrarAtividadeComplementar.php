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
	<h1>Cadastrar Atividade Complementar</h1>
	<form method="POST" action="../controlador.php">
		<label>Codigo</label></br>
		<input type="text" maxlength=10 name="codigo" required></br>
		<label>Creditos	</label></br>
		<input type="number" name="creditos" required></br>
		<label>Nome</label></br>
		<input type="text" maxlength=100 name="nome"></br>
		<input name='submit' type="submit" value="Cadastrar Atividade Complementar">
	</form>
</body>
</html>