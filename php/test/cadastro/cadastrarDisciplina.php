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
	<h1>Cadastrar Disciplina</h1>
	<form method="POST" action="../controlador.php">
		<label>Código</label></br>
		<input type="text" name="codigo" maxlength=10 required></br>
		<label>Nome</label></br>
		<input type="text" name="nome" maxlength=50></br>
		<label>Número de Créditos</label></br>
		<input type="number" name="nro_creditos" ></br>
		<label>Categoria</label></br>
		<input type="text" name="categoria" maxlength=20></br></br>
		<input type="submit" name='submit' value="Cadastrar Disciplina">
	</form>
</body>
</html>