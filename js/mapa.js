//var geocoder;
var map;
var marker;

function initMap() {
	var latlng = new google.maps.LatLng(-15.793723, -47.882739);
	var options = {
		zoom: 5,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	
	map = new google.maps.Map(document.getElementById("mapa"), options);
}

function buscar()
            {
				initMap();
				
				var endereco, teste;
				endereco = document.getElementById("txtEndereco").value; // pega o endereço digitado no form
				console.log(endereco);
				
                $.ajax({
					url: 'marcarnomapa.php',
                    type: 'POST',
                    dataType: 'text',
					//url: 'js/nutri.json',
                    data: {city : endereco},
					//dataType: 'json',
					success:function(resposta){
						//console.log(resposta);
						var latlngbounds = new google.maps.LatLngBounds();//cria um limete baseado no latlng
						var locaisNutris = JSON.parse(resposta);//converte a String Json em objeto
						//console.log(resposta);
						//console.log(locaisNutris.latitude,locaisNutris.longitude);
						$.each(locaisNutris, function (index, localNutri) {
							console.log(localNutri.nut_latitude);
							var marker = new google.maps.Marker({
								position: new google.maps.LatLng(localNutri.nut_latitude, localNutri.nut_longitude),
								title: "Nome: " + localNutri.nut_nome + " - " + localNutri.nut_cidade, //adiciona o nome do nutricionista a marca do mapa
								//title: "cidade : " + localNutri.cidade,
								map: map
							});
							
							latlngbounds.extend(marker.position); // pega os limites das posições adicionadas ao mapa 
							
						});
						map.fitBounds(latlngbounds); // ajusta o zoom do mapa para o minimo necessário para exibir todas posições do mapa
					}
					
                    /*success: function(html){
						$.getJSON('marcarnomapa.php', function(data){
							var obj = JSON.parse("$dadosTratados");
							//obj.forEach(function(){
							$.each(function(index,obj){	
  								// $.getJSON(caminho, function (objderetorno) { .....                        
								//$.each(objderetorno, function (index, obj) {

							var marker = new google.maps.Marker({
							position: new google.maps.LatLng(obj.latitude, obj.longitude),
							//title: "Titulo: " + obj.titulo,
							map: map,
							
						//info window ou info box
						})
						//marker.setPosition(latlng);
								//var location = new google.maps.LatLng(latitude, longitude);
								//marker.setPosition(location);
								//map.setCenter(location);
								//map.setZoom(16);
                            	//$("#mapa").html(html);
							});	
						})  		
					} */
                });
				//console.log(" xxxxxxxxxxxxxx " + latlngbounds);
				
            }
            
            
            
