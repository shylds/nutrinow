<?php
	include_once("setting.php");
?>
<!doctype html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8"/>
	<meta name="description" content="Curso Bootstrap - PontoCanal"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	
	<title>Nenhum</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.css">
    <!-- Não retire está ligação com a CSS personalizada! -->
	<link rel="stylesheet" href="estilo.css">
	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body data-spy="scroll" data-target=".sidebar">

	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<!-- .btn-navbar esta classe é usada como alternador pra o conteudo colapsável -->
				<button class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="brand">NutriNow</a>
				<!-- Tudo que for escondido a menos de 940px -->
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li><a href="">Home</a></li>
						<li><a href="mapa.html">Encontre Aqui</a></li>
						<li><a href="">Dicas</a></li>
						<li ><a href="">Sobre</a></li>
					</ul>
					
				</div>
				<div class="nav-collapse collapse" id="linkLogin">
					<ul class="nav">
						
						<li ><a href="#cadastro" data-toggle="modal">Cadastrar</a></li>
						<li><a href="login.php"> Entrar</a></li>


					</ul>
				</div>	
			</div>
		</div>
	</nav>
	<section id="cadastro" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="meuModalLabel" aria-hidden="true">
			<header class="modal-header">
				<button class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="meuModalLabel" align="center">Cadastro</h3>
			</header>
			<br>
			<form method="post" action="" class="form-horizontal">
				<div class="control-group">
					<label for="" class="control-label">Nome Completo: </label>
					<div class="controls">
						<input type="text" name="nome" id="inputNome" required>
					</div>
				</div>
				<div class="control-group">
					<label for="" class="control-label">Usuário: </label>
					<div class="controls">
						<input type="text" name="usuario" id="inputUsuario" required>
					</div>
				</div>
				<div class="control-group">
					<label for="" class="control-label">Senha: </label>
					<div class="controls">
						<input type="password" name="senha" id="inputSenha" required>
					</div>
				</div>
				<div class="control-group">
					<label for="" class="control-label">Celular: </label>
					<div class="controls">
						<input type="text" name="celular" id="inputCelular" required>
					</div>
				</div>
				<div class="control-group">
					<label for="" class="control-label">CPF: </label>
					<div class="controls">
						<input type="text" name="cpf" id="inputCpf" required>
					</div>
				</div>
				<div class="control-group">
					<label for="" class="control-label">E-mail: </label>
					<div class="controls">
						<input type="text" name="email" id="inputEmail" required>
					</div>
				</div>
				<div class="control-group">
					<label for="" class="control-label">Cep: </label>
					<div class="controls">
						<input type="text" name="cep" id="inputCep" required>
					</div>
				</div>
				<footer class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Fechar</button>
					<input type="submit" class="btn btn-primary" name="cadastrar" value="register"/>
				</footer>
			</form>					
		</section>
		<?php
		if(isset($_POST['cadastrar']) && $_POST['cadastrar'] == "register"){
			$nome = $_POST['nome'];
			$usuario = $_POST['usuario'];
			$senha = $_POST['senha'];
			$celular = $_POST['celular'];
			$cpf = $_POST['cpf'];
			//$dataNasc = $_POST['dataNasc'];
			$email = $_POST['email'];
			$cep = $_POST['cep'];

			if(empty($nome) || empty($usuario) || empty($senha)){
				echo "Preencha todos os campos!";
			}else{
				$query = "SELECT * FROM usuarios WHERE usuario = '$usuario'";
				$result = mysql_query($query);
				$conta = mysql_num_rows($result);
				$busca = mysql_fetch_assoc($result);

				if($conta > 0){
					echo "Usuário já cadastrado.";
				}else{
					$cadastrar = "INSERT INTO usuarios (nome, usuario, senha, celular, cpf, email,cep) VALUES ('$nome', '$usuario', '$senha' , 'celular' , 'cpf' , 'email' , 'cep')";
					if(mysql_query($cadastrar)){
						$_SESSION['nome'] = $nome;
						$_SESSION['usuario'] = $usuario;
						$_SESSION['celular'] = $celular;
						$_SESSION['cpf'] = $cpf;
						//$_SESSION['dataNasc'] = $dataNasc;
						$_SESSION['email'] = $email;
						$_SESSION['cep'] = $cep;
						

						echo "Cadastro efetuado com sucesso!<br></br>";
						echo "Seus dados são: </br>";
						echo "<b>Usuário: ".$usuario."</br>";
						echo "Senha: ".$senha."</b></br>";
						echo "<a href='index.php'>Clique aqui para entrar</a>";
					}else{
						echo "Erro ao cadastrar, contate um administrador!";
					}
				}
			}
			header('Location: login.php');
			exit;
		}
	?>
	<header class="jumbotron subhead">
		<div class="container">
			<h1> </h1>
		</div>
	</header>

	<div  class="container">
		<div class="row ">
			<div class="span8" align="center">
				<section  id="slide">
					<header class="page-header">
					</header>
					<section class="carousel slide" id="carrossel">
						<div class="carousel-inner">
							<section class="item active "> 
								<img src="img/dicas_alimentacao.jpg" alt="img1" class="carrosel">
								<div class="carousel-caption">
									<h4>Super Frutas</h4>
									<p>Dicas e informações sobre como melhorar ainda mais a sua alimentação comendo frutas.</p>
								</div>
							</section>
							<section class="item">
								<img src="img/batata.jpg" alt="img2" class="carrosel">
								<div class="carousel-caption">
									<h4>Batata Doce</h4>
									<p>Tudo e muito mais sobre a Batata Doce.</p>
								</div>
							</section>
							<section class="item">
								<img src="img/jornal.jpg" alt="img3" class="carrosel">
								<div class="carousel-caption">
									<h4>Kids</h4>
									<p>Atividades fisicas ajudam no rendimento Escolar das Crianças.</p>
								</div>
							</section>
							<section class="item">
								<img src="img/10passos.jpg" alt="img4" class="carrosel">
								<div class="carousel-caption">
									<h4>#Super dicas</h4>
									<p>Mas uma super dica com 10 passos para uma alimentação Saudável.</p>
								</div>
							</section>
							
						</div>
						<a href="#carrossel" class="carousel-control left" data-slide="prev">&lsaquo;</a>
						<a href="#carrossel" class="carousel-control right" data-slide="next">&rsaquo;</a>
					</section>

				</section>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$('.carousel').carousel({
		interval: 5000
		})

	</script>


	</body>
</html>