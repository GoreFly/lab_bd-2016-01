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
	<h1>Polo a Distância</h1>
	<table>
		<tr>
			<td>Nome</td>
			<td>Endereço</td>
			<td>Coordenador</td>
			<td>Email Coordenador</td>
			<td>Telefone Coordenador</td>
			<td>Tutor</td>
			<td>Email Tutor</td>
			<td>Telefone Tutor</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getPoloDistancia();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['nome']; ?></td>
				<td><?php echo $row['rua'].','.$row['complemento'].'</br>'.$row['bairro'].'-'.$row['cidade'].','.$row['uf'].'</br>'.$row['pais']; ?></td>
				<td><?php echo $row['coordenador_prenome'].' '.$row['coordenador_sobrenome']; ?></td>
				<td><?php echo $row['coordenador_email1']; echo $row['coordenador_email2']!=''?' / '.$row['coordenador_email2']:' '; ?></td>
				<td><?php echo $row['coordenador_telefone1']; echo $row['coordenador_telefone2']!=''?' / '.$row['coordenador_telefone2']:' '; ?></td>
				<td><?php echo $row['tutor_prenome'].' '.$row['tutor_sobrenome']; ?></td>
				<td><?php echo $row['tutor_email1']; echo $row['tutor_email2']!=''?' / '.$row['tutor_email2']:' '; ?></td>
				<td><?php echo $row['tutor_telefone1']; echo $row['tutor_telefone2']!=''?' / '.$row['tutor_telefone2']:' '; ?></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>