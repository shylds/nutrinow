<?php
	include_once("setting.php");
	@session_start();
	if(isset($_SESSION['nome']) && isset($_SESSION['usuario'])){
		header('Location: logado.php');
		exit;
}
?>

		<?php
			if(isset($_POST['entrar']) && $_POST['entrar'] == "login"){
				$usuario = $_POST['usuario'];
				$senha = $_POST['senha'];

				// se estiver vazio apresenta para preencher os campos
				if(empty($usuario) || empty($senha)){
					echo 'Preencha todos os campos!';

				//se estiverem todos preenchidos faz um select para armazenar no banco 	
				}else{
					$query = "SELECT nut_nome, nut_usuario, nut_senha FROM nutricionista WHERE nut_usuario = '$usuario' AND nut_senha = '$senha'";
					$link = mysqli_connect("localhost","root","","teste");
					$result = mysqli_query($link, $query);
					$busca = mysqli_num_rows($result);
					$linha = mysqli_fetch_assoc($result);

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
