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
	<h1>Visitas</h1>
	<table>
		<tr>
			<td>Periodo</td>
			<td>Comite Avaliador</td>
			<td>Itens</td>
			<td>Codigo Reconhecimento de Curso</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getVisita();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['periodo']; ?></td>
				<td><?php echo $row['comite_avaliador']; ?></td>
				<td><?php echo $row['itens']; ?></td>
				<td><?php echo $row['reconhecimentodecurso_codigo']; ?></td>
				<td><a href="../delete.php?tabela=visita&pk=<?php echo $row['periodo'];?>,<?php echo $row['reconhecimentodecurso_codigo'];?>">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>