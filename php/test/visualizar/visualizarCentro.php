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
	<h1>Centro</h1>
	<table>
		<tr>
			<td>Nome</td>
			<td>WebSite</td>
			<td>Geolocalização</td>
			<td>Sigla</td>
			<td>Telefone 1</td>
			<td>Telefone 2</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getCentro();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['nome']; ?></td>
				<td><?php echo $row['website']; ?></td>
				<td><?php echo $row['geo']; ?></td>
				<td><?php echo $row['sigla']; ?></td>
				<td><?php echo $row['telefone1']; ?></td>
				<td><?php echo $row['telefone2']; ?></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>