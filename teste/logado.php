<?php
	include_once("setting.php");
	@session_start();

	$nome = $_SESSION['nome'];
	$usuario = $_SESSION['usuario'];

	if(!isset($_SESSION['nome']) && !isset($_SESSION['usuario'])){
		header('Location: index.php');
		exit;
	}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Bem vindo <?php echo $nome;?></title>
</head>
<body>
	<p>Bem vindo <?php echo $nome;?> <b>@<?php echo $usuario;?></b> <a href="sair.php">Sair</a></p>

</body>
</html>