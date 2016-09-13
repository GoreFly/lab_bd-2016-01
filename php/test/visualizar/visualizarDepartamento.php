<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <title>BD</title>
    <link href="basic.css" rel="stylesheet" type="text/css" />
  <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
	<a href="../index.php"> <- Voltar</a>
	<h1>Departamento</h1>
	<table>
		<tr>
			<td>Nome (Sigla)</td>
			<td>Website</td>
			<td>Telefone</td>
			<td>Endereço</td>
			<td>Campus</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getDepartamento();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['nome'].' ('.$row['sigla'].')'; ?></td>
				<td><?php echo $row['website']; ?></td>
				<td><?php echo $row['telefone1']; echo $row['telefone2']?' / '.$row['telefone2']:''; ?></td>
				<td><?php echo $row['endereco']; ?></td>
				<td><?php echo $row['campus_sigla']; ?></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>
