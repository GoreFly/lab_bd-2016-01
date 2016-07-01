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
	<h1>Cadastrar Empresa</h1>
	<form method="POST" action="../controlador.php">
		<label>CNPJ</label>
		<input type="number" name="cnpj" required>
		<label>Nome</label>
		<input type="text" name="nome" maxlength=20>
		<label>Rua</label>
		<input type="text" name="rua" maxlength=50>
		<label>Complemento</label>
		<input type="text" name="complemento" maxlength=20>
		<label>Bairro</label>
		<input type="text" name="bairro" maxlength=20>
		<label>Cidade</label>
		<input type="text" name="cidade" maxlength=20>
		<label>UF</label>
		<input type="text" name="uf" maxlength=2>
		<label>País</label>
		<input type="text" name="pais" maxlength=20>
		<label>CEP</label>
		<input type="number" name="cep">


		<input type="submit" value="Submit">
	</form>
</body>
</html>