
<?php
	include_once("setting.php");
	@session_start();

	//$nome = 'elison';
	//$usuario = 'elison';

	//if(!isset($_SESSION['nome']) && !isset($_SESSION['usuario'])){
		//header('Location: index.php');
		//exit;
	//}
	$link = mysqli_connect("localhost","root","","teste");
	$sql = mysqli_query($link,"select nut_usuario , nut_nome from nutricionista");
	$result = mysqli_fetch_assoc($sql);
	$usuario = $result["nut_usuario"];
	$nome =$result["nut_nome"];
?>
<!DOCTYPE html>
<html>
<head>
	<title>Bem vindo <?php echo $nome;?></title>
</head>
<body>
	<p>Bem vindo <?php echo $nome;?> <b>@<?php echo $usuario;?></b>
	 <a href="sair.php">Sair</a></p>

</body>
</html>
