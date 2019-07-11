<?php

	//Dados do servidor
	$host = "localhost";
	$login = "root";
	$senha = "";
	$banco = "banco";


	//Efetuando a conexão

	$conecta = @mysql_connect($host, $login, $senha) or print (mysql_error());
	mysql_select_db($banco, $conecta) or print(mysql_query());


	//Verificação
	

?>