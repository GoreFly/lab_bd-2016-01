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
	<h1>Fases</h1>
	<table>
		<tr>
			<td>ID</td>
			<td>Documentos</td>
			<td>Periodo</td>
			<td>ID Reconhecimento de curso</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getFase();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['id']; ?></td>
				<td><?php echo $row['documentos']; ?></td>
				<td><?php echo $row['periodo']; ?></td>
				<td><?php echo $row['reconhecimentodecurso_codigo']; ?></td>
				<td><a href="../delete.php?tabela=fase&pk="<?php echo $row['id'];?>","<?echo $row['reconhecimentodecurso_codigo'];?>"">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>