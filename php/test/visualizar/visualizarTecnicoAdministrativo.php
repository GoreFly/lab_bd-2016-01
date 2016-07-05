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
	<h1>Tecnicos Administrativo</h1>
	<table>
		<tr>
			<td>Nome</td>
			<td>Código</td>
			<td>RG</td>
			<td>X</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getTecAdm();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['pre_nome'].' '.$row['meio_nome'].' '.$row['ultimo_nome']; ?></td>
				<td><?php echo $row['codigo']; ?></td>
				<td><?php echo $row['rg']; ?></td>
				<td><a href-"../delete.php">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>