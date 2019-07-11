<?php ;
    include_once("setting.php");
    
    $cidade = $_POST['city'];
    //$latitude = $_POST['txtLatitude'];
    //$longitude = $_POST['txtLongitude'];
    //$cidade = "joao pessoa";
    //$query = "SELECT * FROM nutricionista WHERE nut_cidade = '$cidade'";
    $query ="SELECT nut_latitude, nut_longitude, nut_nome, nut_cidade FROM nutricionista WHERE nut_cidade = '$cidade'";
    $link = mysqli_connect("localhost","root","","teste");
    $result =  mysqli_query( $link, $query);
    
    $busca = mysqli_num_rows($result);  //conta quantos resultados trago do bd

    $dados = array(); 

    //$linha = mysqli_fetch_assoc($result);

    
    
    
	while($linha = mysqli_fetch_assoc($result)){
        
		$dados[] =$linha;
	}
    $dadosTratados = json_encode($dados);
    echo($dadosTratados);
    
	
?>
