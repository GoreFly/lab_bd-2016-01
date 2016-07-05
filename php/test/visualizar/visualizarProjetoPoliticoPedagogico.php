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
	<h1>Projeto Politico Pedagogico</h1>
	<table>
		<tr>
			<td>Obrigatoria</td>
			<td>Optativa</td>
			<td>Eletiva</td>
			<td>ID Conselho de Curso</td>
			<td>Curso</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getProjetoPoliticoPedagogico();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['obrigatoria']=='t'?'X':''; ?></td>
				<td><?php echo $row['optativa']=='t'?'X':''; ?></td>
				<td><?php echo $row['eletiva']=='t'?'X':''; ?></td>
				<td><?php echo $row['conselhocurso_id']; ?></td>
				<td><?php echo $row['nome']; ?></td>
				<td><a href="../delete.php?tabela=projetopoliticopedagogico&pk="<?echo $row['obrigatoria'];?>","<?echo $row['optativa'];?>","<?echo $row['eletiva'];?>","<?echo $row['conselhocurso_id'];?>"">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>
