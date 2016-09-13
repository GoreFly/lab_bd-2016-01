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
		<?php
			require_once('../info.php');
			$result = getAtividadeComplementarCod($_GET['pk']);
			$row = pg_fetch_array($result)
		?>
		<label>Codigo</label></br>
		<input type="hidden" maxlength=10 name="codigo" value="<?php echo $row['codigo']; ?>">
		<label><?php echo $row['codigo']; ?></label></br>
		<label>Creditos	</label></br>
		<input type="number" name="creditos" value="<?php echo $row['creditos']; ?>" required></br>
		<label>Nome</label></br>
		<input type="text" maxlength=100 name="nome" value="<?php echo $row['nome']; ?>"></br>
		<input name='submit' type="submit" value="Editar Atividade Complementar">
	</form>
</body>
</html>