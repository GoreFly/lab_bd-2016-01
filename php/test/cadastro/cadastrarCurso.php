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
	<h1>Cadastrar Curso</h1>
	<form method="POST" action="../controlador.php">
		<label>Código</label>
		<input type="number" name="codigo" required>
		<label>Website</label>
		<input type="text" name="website" maxlength=40>
		<label>Nome</label>
		<input type="text" name="nome" maxlength=40>
		<label>Coordenador - Nome</label>
		<input type="text" name="coordenadorNome" maxlength=40>
		<label>Coordenador - Telefone - Origem</label>
		<input type="text" name="coordenadorTelefoneOrigem" maxlength=20>
		<label>Coordenador - Telefone - Tipo</label>
		<input type="text" name="coordenadorTelefoneTipo" maxlength=20>
		<label>Coordenador - Telefone - Ramal</label>
		<input type="number" name="coordenadorTelefoneRamal">	
		<label>Coordenador - Telefone - DDD</label>
		<input type="number" name="coordenadorTelefoneDDD">
		<label>Coordenador - Telefone - Fone</label>
		<input type="number" name="coordenadorTelefoneFone">	

		<input type="submit" value="Submit">
	</form>
</body>
</html>