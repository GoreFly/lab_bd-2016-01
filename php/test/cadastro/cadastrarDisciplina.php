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
		<label>Código</label>
		<input type="text" name="codigo" maxlength=10 required>
		<label>Nome</label>
		<input type="text" name="nome" maxlength=50>
		<label>Número de Créditos</label>
		<input type="number" name="nroCreditos" >
		<label>Categoria</label>
		<input type="text" name="categoria" maxlength=20>
		<input type="submit" value="Submit">
	</form>
</body>
</html>