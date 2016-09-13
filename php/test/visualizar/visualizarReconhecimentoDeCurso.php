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
	<h1>Reconhecimento de Curso</h1>
	<table>
		<tr>
			<td>Código</td>
			<td>Código Curso</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getReconhecimentoDeCurso();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['codigor']; ?></td>
				<td><?php echo $row['codigo']; ?></td>
				<td><a href="../delete.php?tabela=reconhecimentodecurso&pk=<?php echo $row['codigo'];?>">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>