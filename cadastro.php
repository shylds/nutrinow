<?php 
include_once("setting.php");
$login = $_POST['login'];
$senha = $_POST['senha'];
$cpf = $_POST['cpf'];
//$senha = MD5($_POST['senha']);

//echo"$login";
//echo"$senha";


$query_select = "SELECT nut_usuario  FROM nutricionista WHERE nut_usuario = '$login'";
//$query_select = "SELECT * FROM nutricionista ";
//echo"$query_select";
$link = mysqli_connect("localhost","root","","teste");
$select = mysqli_query($link, $query_select);//mysqli_query($link, $query)
$array = mysqli_fetch_array($select);
$num = mysqli_num_rows($select);

$logarray =$array['nut_usuario'];


  if($login == "" || $login == null){
    echo"<script language='javascript' type='text/javascript'>alert('O campo login deve ser preenchido');window.location.href='cadastro.html';</script>";

  }else{
      if($logarray == $login  ){

        echo"<script language='javascript' type='text/javascript'>alert('Esse login já existe');window.location.href='cadastro.html';</script>";
        
      }else{
        $cadastrar = "INSERT INTO nutricionista(nut_cpf, nut_usuario, nut_senha ) VALUES ('$cpf', '$login', '$senha')";
        $funciona = mysqli_query($link, $cadastrar);
        if($funciona){

        //echo "<script language='javascript' type='text/javascript'>alert('$funciona');</script>";
        
          echo"<script language='javascript' type='text/javascript'>alert('Usuário cadastrado com sucesso!');window.location.href='login.html'</script>";
        }else{
          echo"<script language='javascript' type='text/javascript'>alert('Não foi possível cadastrar esse usuário');</script>";
        }
      }
  }
?>