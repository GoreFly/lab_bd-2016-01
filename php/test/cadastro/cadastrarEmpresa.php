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
		<label>CNPJ</label></br>
		<input type="number" name="cnpj" required></br>
		<label>Nome</label></br>
		<input type="text" name="nome" maxlength=20></br>
		<label>Rua</label></br>
		<input type="text" name="rua" maxlength=50></br>
		<label>Complemento</label></br>
		<input type="text" name="complemento" maxlength=20></br>
		<label>Bairro</label></br>
		<input type="text" name="bairro" maxlength=20></br>
		<label>Cidade</label></br>
		<input type="text" name="cidade" maxlength=20></br>
		<label>UF</label></br>
		<input type="text" name="uf" maxlength=2></br>
		<label>País</label></br>
		<input type="text" name="pais" maxlength=20></br>
		<label>CEP</label></br>
		<input type="number" name="cep"></br></br>


		<input type="submit" name='submit' value="Cadastrar Empresa">
	</form>
</body>
</html>