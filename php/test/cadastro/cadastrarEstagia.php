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
	<h1>Cadastrar Estudante x Pólo Distância</h1>
	<form method="POST" action="../controlador.php">

		<label>Estudante</label></br>
		<select name="estudante" required>
			<?php
				$result = getEstudante();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['ra']; ?>"><?php echo $row['ra']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Empresa</label></br>
		<select name="empresa" required>
			<?php
				$result = getEmpresa();
				while ($row = pg_fetch_array($result)) {
     				?>
     				<option value="<?php echo $row['cnpj']; ?>"><?php echo $row['nome']; ?></option>
     				<?php
   				}
			 ?>
		</select></br>

		<label>Data Início</label></br>
		<input type="date" name="dataInicio"></br>

		<label>Data Término</label></br>
		<input type="date" name="dataTermino"></br>

		<label>Supervisor (Empresa) - CPF</label></br>
		<input type="number" name="cpfSupervisorEmpresa"></br>

		<label>Supervisor (Empresa) - Nome</label></br>
		<input type="text" name="nomeSupervisorEmpresa"></br>

		<label>Supervisor (Universidade) - CPF</label></br>
		<input type="number" name="cpfSupervisorUniversidade"></br>

		<label>Supervisor (Universidade) - Nome</label></br>
		<input type="text" name="nomeSupervisorUniversidade"></br>

		<label>Carta de Avaliação</label></br>
		<input type="text" cols=40 rows=5 name="cartaAvaliacao" style="width:400px; height:100px;"></br>

		<label>Termo de Compromisso</label></br>
		<input type="text" cols=40 rows=5 name="termoCompromisso" style="width:400px; height:100px;"></br>

		<input name='submit' type="submit" value="Cadastrar Estagia">
	</form>
</body>
</html>