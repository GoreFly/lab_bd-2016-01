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
	<h1>Pessoas</h1>
	<table>
		<tr>
			<td>Nome</td>
			<td>RG</td>
			<td>Email</td>
			<td>Email Institucional</td>
			<td>Etnia</td>
			<td>Sexo</td>
			<td>Data de Nascimento</td>
			<td>Mãe</td>
			<td>Pai</td>
			<td>Local de Nascimento</td>
			<td>Nacionalidade</td>
			<td>Deletar</td>
		</tr>
		<?php
			require_once('../info.php');
			$result = getPessoa();
			while ($row = pg_fetch_array($result)){
				?> 
			<tr>
				<td><?php echo $row['pre_nome'].' '.$row['meio_nome'].' '.$row['ultimo_nome']; ?></td>
				<td><?php echo $row['rg']; ?></td>
				<td><?php echo $row['email']; ?></td>
				<td><?php echo $row['email_institucional']; ?></td>
				<td><?php echo $row['etnia']; ?></td>
				<td><?php echo $row['sexo']=='m'?'Masculino':'Feminino'; ?></td>
				<td><?php echo $row['data_nascimento']; ?></td>
				<td><?php echo $row['nome_mae']; ?></td>
				<td><?php echo $row['nome_pai']; ?></td>
				<td><?php echo $row['origem_cidade'].' '.$row['origem_estado'].' '.$row['origem_pais']; ?></td>
				<td><?php echo $row['nacionalidade']; ?></td>
				<td><a href-"../delete.php">X</a></td>
			</tr>
			<?php
			}
		?>
	</table>
</body>
</html>