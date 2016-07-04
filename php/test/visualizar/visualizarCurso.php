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
	<h1>Atividades Complementares</h1>
	<table>
		<tr>
			<td>Codigo</td>
			<td>Website</td>
			<td>Nome</td>
			<td>Coordenador</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getCurso();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['codigo']; ?></td>
				<td><?php echo $row['website']; ?></td>
				<td><?php echo $row['nome']; ?></td>
				<td><?php echo $row['coordnome']; ?></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>