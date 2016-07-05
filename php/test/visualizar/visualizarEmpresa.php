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
	<h1>Atividades Complementares</h1>
	<table>
		<tr>
			<td>CNPJ</td>
			<td>Nome</td>
			<td>Endereco</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getEmpresa();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['cnpj']; ?></td>
				<td><?php echo $row['nome']; ?></td>
				<td><?php echo $row['endrua'].','.$row['endcomplemento'].'</br>'.$row['endbairro'].'-'.$row['endcidade'].','.$row['enduf'].'</br>'.$row['endpais']; ?></td>
				<td><a href-"../delete.php">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>