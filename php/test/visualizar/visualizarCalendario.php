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
	<h1>Calendários</h1>
	<table>
		<tr>
			<td>Data Inicio</td>
			<td>Data Fim</td>
			<td>Dias Letivos</td>
			<td>Tipo</td>
			<td>Aprovado</td>
			<td>Reunião</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getCalendario();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['datainicio']; ?></td>
				<td><?php echo $row['datafim']; ?></td>
				<td><?php echo $row['diasletivos']; ?></td>
				<td><?php switch ($row['tipo']) {
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
				<td><?php echo $row['aprovado']?'X':''; ?></td>
				<td><?php echo $row['reuniao_numero']; ?></td>
				<td><a href="../delete.php">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>
