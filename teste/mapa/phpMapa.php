<?php
		if(isset($_POST['btnPesquisar']) && $_POST['btnPesquisar'] == "Pesquisar"){
			$latitude = $_POST['txtLatitude'];
			$longitude = $_POST['txtLongitude'];
			
				
					$cadastrar = "INSERT INTO coordenadas (latitude, longitude) VALUES ('$latitude', '$longitude')";
					if(mysql_query($cadastrar)){
						$_SESSION['latitude'] = $latitude;
						$_SESSION['longitude'] = $logintude;
						

						echo "Casdastro de coordenadas<br></br>";
						echo "Seus dados são: </br>";
						echo "<b>Latitude: ".$latitude."</br>";
						echo "Longitude: ".$longitude."</b></br>"
					}else{
						echo "Erro ao cadastrar, contate um administrador!";
					}
					header('Location: mapa.html');
					}
	?>