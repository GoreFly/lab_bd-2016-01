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
	<h1>Turmas</h1>
	<table>
		<tr>
			<td>Turma</td>
			<td>Docente</td>
			<td>Vagas</td>
			<td>Salas</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getTurma();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['disciplina_codigo'].'/'.$row['ano'].$row['semestre'].$row['id']; ?></td>
				<td><?php echo $row['docente_codigo']; ?></td>
				<td><?php echo $row['vagas']; ?></td>
				<td><?php $salas = getSalaTurma($row['id'],$row['semestre'],$row['ano'],$row['disciplina_codigo']);
						  while ($sala = pg_fetch_array($salas)){
						  	echo $sala['codigo'].' / '; 
						  }
				?></td>
				<td><a href="../delete.php?tabela=turma&pk="<?php echo $row['disciplina_codigo'];?>","<?echo $row['id'];?>
				","<?echo $row['ano'];?>","<?echo $row['semestre'];?>"">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>
