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
	<h1>Cadastrar Reuniao</h1>
	<form method="POST" action="../controlador.php">
		<label>Numero</label></br>
		<input type="number" name="numero" required></br>
		<label>Pauta</label></br>
		<input type="text" cols=30 rows=4 name="pauta" style="width:200px; height:50px;"></br>
		<label>Data</label></br>
		<input type="date" name="data"></br></br>
		<input type="submit" name='submit' value="Cadastrar Reuniao">
	</form>
</body>
</html>