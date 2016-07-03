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
		<label>Código</label></br>
		<input type="number" name="codigo" required></br>
		<label>Website</label></br>
		<input type="text" name="website" maxlength=40></br>
		<label>Nome</label></br>
		<input type="text" name="nome" maxlength=40></br>
		<label>Coordenador - Nome</label></br>
		<input type="text" name="coord_nome" maxlength=40></br>
		<label>Coordenador - Telefone - Origem</label></br>
		<input type="text" name="tel_origem" maxlength=20></br>
		<label>Coordenador - Telefone - Tipo</label></br>
		<input type="text" name="tel_tipo" maxlength=20></br>
		<label>Coordenador - Telefone - Ramal</label></br>
		<input type="number" name="tel_ramal"></br>
		<label>Coordenador - Telefone - DDD</label></br>
		<input type="number" name="tel_ddd"></br>
		<label>Coordenador - Telefone - Fone</label></br>
		<input type="number" name="tel_numero"></br></br>

		<input name='submit' type="submit" value="Cadastrar Curso">
	</form>
</body>
</html>