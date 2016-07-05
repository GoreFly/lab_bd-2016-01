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
	<h1>Atas</h1>
	<table>
		<tr>
			<td>Documentos</td>
			<td>Codigo Conselho de Curso</td>
			<td>Numero de Reuniao</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getAta();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['documentos']; ?></td>
				<td><?php echo $row['conselhorcurso_id']; ?></td>
				<td><?php echo $row['reuniao_numero']; ?></td>
				<td><a href="../delete.php?tabela=ata&pk=<?php echo $row['conselhorcurso_id'];?>,<?php echo $row['reuniao_numero'];?>">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>
