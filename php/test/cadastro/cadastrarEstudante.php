<?php include '../info.php'; ?>
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
	<h1>Cadastrar Estudante</h1>
	<form method="POST" action="../controlador.php">
		<label>RA</label></br>
		<input type="number" name="ra" required></br>
		<label>Ano de Conclusao Ensino Medio</label></br>
		<input type="text"  maxlength=4 name="anoConcEM"></br>
		<label>IRA</label></br>
		<input type="number" name="ira" required></br>
		<label>Categoria</label></br>
	  	<input type="radio" name="presencial" value="s"> Presencial<br>
	  	<input type="radio" name="presencial" value="n"> À Distancia<br>
		<input type="checkbox" name="graduando" value="graduando"> Graduação<br>
		<input type="checkbox" name="posGraduando" value="posGraduando"> Pós-Graduação<br>
		<label>RG</label></br>
		<select name="pessoa_rg" required>
			<?php
				$result = getPessoa();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['rg']; ?>"><?php echo $row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>
		<input name='submit' type="submit" value="Cadastrar Estudante">
	</form>
</body>
</html>