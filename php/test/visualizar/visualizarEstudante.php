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
	<h1>Estudantes</h1>
	<table>
		<tr>
			<td>RG</td>
			<td>Nome</td>
			<td>RA</td>
			<td>IRA</td>
			<td>Ano de Conclusao do EM</td>
			<td>Presencial</td>
			<td>Graduando</td>
			<td>Pós-Graduando</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getEstudante();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['rg']; ?></td>
				<td><?php echo $row['pre_nome'].' '.$row['meio_nome'].' '.$row['ultimo_nome']; ?></td>
				<td><?php echo $row['ra']; ?></td>
				<td><?php echo $row['ira']; ?></td>
				<td><?php echo $row['anoconcem']; ?></td>
				<td><?php echo $row['presencial']=='s'?'X':''; ?></td>
				<td><?php echo $row['graduando']=='t'?'X':''; ?></td>
				<td><?php echo $row['posgraduando']=='t'?'X':''; ?></td>
				<td><a href-"../delete.php">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>