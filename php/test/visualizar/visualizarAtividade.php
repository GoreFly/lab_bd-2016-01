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
	<h1>Atividades</h1>
	<table>
		<tr>
			<td>Data Inicio</td>
			<td>Data Fim</td>
			<td>Atributo</td>
			<td>Data Inicio Calendário</td>
			<td>Tipo</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getAtividade();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['datainicio']; ?></td>
				<td><?php echo $row['datafim']; ?></td>
				<td><?php echo $row['atributo']; ?></td>
				<td><?php echo $row['calendario_datainicio']; ?></td>
				<td><?php switch ($row['calendario_tipo']) {
					case 'p':
						echo 'Graduação Presencial';
						break;

					case 'e':
						echo 'Estudo à Distancia';
						break;
					
					case 'a':
						echo 'Administrativo';
						break;

				} ?></td>
				<td><a href="../delete.php?tabela=atividade&pk=<?php echo $row['datainicio'];?>">X</a></td>

			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>
