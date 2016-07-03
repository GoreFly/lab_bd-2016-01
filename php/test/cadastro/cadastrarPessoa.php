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
	<h1>Cadastrar Pessoa</h1>
	<form method="POST" action="../controlador.php">
		<label>RG</label></br>
		<input type="text" maxlength=9 name="rg" required></br>
		<label>Primeiro Nome</label></br>
		<input type="text" maxlength=20 name="pre_nome"></br>
		<label>Sobrenome</label></br>
		<input type="text" maxlength=20 name="meio_nome"></br>
		<label>Ultimo nome</label></br>
		<input type="text" maxlength=20 name="ultimo_nome"></br>
		<label>Email</label></br>
		<input type="email" maxlength=20 name="email"></br>
		<label>Email institucional</label></br>
		<input type="email " maxlength=400 name="email_institucional"></br>
		<label>Etnia</label></br>
		<input type="text" maxlength=400 name="etnia"></br>
		<label>Sexo</label></br>
        <input type="radio" name="sexo" value="m"> Masculino<br>
        <input type="radio" name="sexo" value="f"> Femenino<br>
		<label> Data de nascimento</label></br>
		<input type="date" name="data_nascimento"></br>
		<label>Nome da mãe</label></br>
		<input type="text" maxlength=20 name="nome_mae"></br>
		<label>Nome do Pai</label></br>
		<input type="text" maxlength=20 name="nome_pai"></br>
		<label>Cidade Natal</label></br>
		<input type="text" maxlength=20 name="origem_cidade"></br>
		<label>Estado de Origem</label></br>
		<input type="text" maxlength=20 name="origem_estado"></br>
		<label>Pais de Origem</label></br>
		<input type="text" maxlength=20 name="origem_pais"></br>
			
		
		<input name='submit' type="submit" value="Cadastrar Pessoa">
	</form>
</body>
</html>