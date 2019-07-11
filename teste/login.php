<?php
	include_once("setting.php");
	@session_start();
	if(isset($_SESSION['nome']) && isset($_SESSION['usuario'])){
		header('Location: logado.php');
		exit;
}
?>

<html>
	<head>
		<title>Sistema de login</title>
	</head>

	<body>
		<div id="login">
			<h3>Entrar</h3>

			<form action="" method="POST" enctype="multipart/form-data">
				<p><input type="text" name="usuario" id="usuario" placeholder="Usuário"></p>
				<p><input type="password" name="senha" id="senha" placeholder="*********"></p>
				<p><input type="submit" value="Entrar"/></p>
				<input type="hidden" name="entrar" value="login"><br>
				<a href="index.php">Cadastre-se aqui</a>
			</form>
		</div>

		<?php
			if(isset($_POST['entrar']) && $_POST['entrar'] == "login"){
				$usuario = $_POST['usuario'];
				$senha = $_POST['senha'];

				// se estiver vazio apresenta para preencher os campos
				if(empty($usuario) || empty($senha)){
					echo 'Preencha todos os campos!';

				//se estiverem todos preenchidos faz um select para armazenar no banco 	
				}else{
					$query = "SELECT nome, usuario, senha FROM usuarios WHERE usuario = '$usuario' AND senha = '$senha'";
					$result = mysql_query($query);
					$busca = mysql_num_rows($result);
					$linha = mysql_fetch_assoc($result);

					//loga no sistema se houver usuario e senha correta
					if($busca > 0){
						$_SESSION['nome'] = $linha['nome'];
						$_SESSION['usuario'] = $linha['usuario'];
						header('Location: logado.php');
						exit;

					}else{
						echo 'Usuário ou senha inválidos.';
					}
				}
			}

		?>

	</body>
</html>