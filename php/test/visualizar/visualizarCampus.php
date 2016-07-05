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
	<h1>Campus</h1>
	<table>
		<tr>
			<td>Nome</td>
			<td>Website</td>
			<td>Sigla</td>
			<td>Telefone 1</td>
			<td>Telefone 2</td>
			<td>Endereço</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getCampus();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['nome']; ?></td>
				<td><?php echo $row['website']; ?></td>
				<td><?php echo $row['sigla']; ?></td>
				<td><?php echo $row['telefone1']; ?></td>
				<td><?php echo $row['telefone2']; ?></td>
				<td><?php echo $row['endereco']; ?></td>
				<td><a href-"../delete.php">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>