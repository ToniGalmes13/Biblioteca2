<?php
session_start();
?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<title>Login</title>
	<!-- 
	<style>
		body {
			background-image: url("imagenes/libroRosa.jpg");
		}

		div {
			margin: 5px;
		}

		.encabezado {
			display: flex;
			justify-content: center;
			align-items: center;
			border-radius: 20px;
		}

		h1 {
			display: inline;
			margin: 50px;
			font-family: monospace;
			font-size: 4em;
		}

		label {
			color: white;
			font-size: 1.5em;
		}

		.cuerpo {
			display: flex;
			justify-content: center;
			height: 600px;
			border-radius: 20px;
		}

		.login {
			display: flex;
			flex-direction: column;
			justify-content: center;
			margin-top: 15%;
		}

		input {
			margin: 5px;
			box-shadow: 0px 0px 4px 2px black;
		}

		.boton {
			display: flex;
			justify-content: center;
		}

		button {
			margin: 5px;
		}

		.btn {
			border-style: none;
			width: 100px;
			height: 35px;
			border-radius: 10px;
			color: black;
			font-weight: bold;
			background-image: linear-gradient(tan, darkgrey);
			box-shadow: 0px 0px 4px 2px black;
		}

		.btn:hover {
			border-style: none;
			width: 100px;
			height: 35px;
			border-radius: 10px;
			background-image: linear-gradient(darkgrey, darkkhaki);
		}

		.pie {
			width: 100%;
			height: 100px;
			margin-left: auto;
			margin-right: auto;
			border-radius: 20px;
		}
	</style>
-->
</head>

<body>
	<!--   -->

	<!--   
	<div class="encabezado">
		<img src="imagenes/libro.png">
		<h1>Biblioteca Online</h1>
	</div>
	<div class="cuerpo">
-->
	<form method="POST" action="<?php $_SERVER['PHP_SELF']; ?>" name='login'>
		<div class="login">
			<label>Usuario: </label> <input type="text" name="nombreUsuario" placeholder="Usuario" /> <br> <label>Contraseña: </label> <input type="password" name="contrasenya" placeholder="Contraseña" /> <br />
			<div class="boton">
				<button class="btn" type="submit" name="entrar">Entrar</button>
				<button class="btn" role="link" name="atras">Atrás</button>

			</div>
		</div>


	</form>
	<!--   
	</div>
	<div class="pie"></div>
	-->
</body>

</html>


<?php


if (isset($_POST["entrar"])) {
	

	include 'conexionBD.php';

	$_SERVER['nombreUsuario'] = $_POST['nombreUsuario'];

	$_SESSION['nombreUsuario'] = $_POST['nombreUsuario'];

	$nombreUsuario = $_POST['nombreUsuario'];
	$contrasenya = $_POST['contrasenya'];

	$conn = dbConnect();

	$consulta = mysqli_query($conn, "SELECT * FROM usuario WHERE Nombre_Usuario = '$nombreUsuario'");

	$row = mysqli_fetch_array($consulta, MYSQLI_ASSOC);
	$hash = $row['Contraseña'];
	$persona = $row['Bibliotecari'];

	if (password_verify($contrasenya, $hash) && $persona == null) {

		header("Location: index2.php?usuari=" . $nombreUsuario);

	//	echo "<script> window.location='index2.php?usuari='" . $nombreUsuario . "; </script>";
/*
	function ajax(){
	
		let nombreUsuario= document.getElementById("num1").value;
		let numB= document.getElementById("num2").value;
	
		
		var xhttp = new XMLHttpRequest(); //creamos el objeto central de ajax, que representa una petici�n al servidor
		xhttp.onreadystatechange = function() { //con el objeto XMLHttpRequest se puede definir una funci�n para ser ejecutada cuando la petici�n reciba respuesta.
			//la funci�n es definida en onreadystatechange propiedad del objeto XMLHttpRequest
			if (this.readyState == 4 && this.status == 200) { //en esta condici�n indicamos que si la petici�n ha finalizado y la respuesta es "OK", puede continuar. Info en : https://www.w3schools.com/js/js_ajax_http_response.asp
	
				document.getElementById("cuenta").innerHTML = this.responseText;
			 
			}
		};
		xhttp.open("get", "ajaxFormu.php?num1="+numA+"&num2="+numB, true); //m�todo b�sico para realizar petici�n.
		xhttp.send(); //realiza el env�o de la petici�n.
	
	}
*/









	} else if (password_verify($contrasenya, $hash) && $persona == "Si") {

	//	header("Location: index3.php");
		echo "<script> window.location='index3.php'; </script>";
	} else {

		echo "Usuario no existe: " . $nombreUsuario . ", la contraseña es incorrecta: " . $contrasenya . " o hubo un error: " . mysqli_error($conn);
	}
} else if (isset($_POST["atras"])) {
	//header("Location: index.php");
	echo "<script> window.location='index.php'; </script>";
}


  /*
function ajax(){
	
	let numA= document.getElementById("num1").value;
	let numB= document.getElementById("num2").value;

	
    var xhttp = new XMLHttpRequest(); //creamos el objeto central de ajax, que representa una petici�n al servidor
    xhttp.onreadystatechange = function() { //con el objeto XMLHttpRequest se puede definir una funci�n para ser ejecutada cuando la petici�n reciba respuesta.
        //la funci�n es definida en onreadystatechange propiedad del objeto XMLHttpRequest
        if (this.readyState == 4 && this.status == 200) { //en esta condici�n indicamos que si la petici�n ha finalizado y la respuesta es "OK", puede continuar. Info en : https://www.w3schools.com/js/js_ajax_http_response.asp

            document.getElementById("cuenta").innerHTML = this.responseText;
         
        }
    };
    xhttp.open("get", "ajaxFormu.php?num1="+numA+"&num2="+numB, true); //m�todo b�sico para realizar petici�n.
    xhttp.send(); //realiza el env�o de la petici�n.

}


*/


?>