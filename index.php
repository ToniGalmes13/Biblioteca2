<html>

<head>

    <style>
        body {
            background-image: url("imagenes/libroRosa.jpg");
            background-position: center;
            background-size: 1850px;
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

        h2 {
            color: orange;
        }

        label {
            color: white;
            font-size: 1.5em;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;
            margin-left: 20px;
        }

        input {
            margin-left: 20px;
        }

        .login {
            display: block;
            text-align: right;
            padding: 10px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            border-radius: 20px;


        }

        a {
            text-decoration: none;
            color: white;
            /*  color: olivedrab;
            font-size: 1.5em;
            font-weight: bold;
            margin-right: 10px;
            margin-left: 10px;
            */
        }

        .login a:hover {
            background-color: royalblue;
            color: yellow;
            border-radius: 5px;
            font-weight: normal;
        }

        .cuerpo {
            display: flex;
            justify-content: center;
            border-radius: 20px;
        }

        .side {
            width: 300px;
            height: 600px;
            margin: 10px;
            display: flex;
            display: flex;
            flex-direction: column;

        }

        .libros {
            width: 800px;
            height: 600px;
            margin: 10px;
        }

        table {
            color: white;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;
        }

        .btn {
            border-style: none;
            width: 90px;
            height: 30px;
            border-radius: 10px;
            color: black;
            font-weight: bold;
            background-image: linear-gradient(tan, darkgrey);
            box-shadow: 0px 0px 4px 2px black;
            margin-left: 20px;

        }

        .btn:hover {
            border-style: none;
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

        img {
            width: 50px;
            height: 75px;
        }

        .img1 {
            width: auto;
            height: auto;
        }

        tr {
            font-weight: bold;
        }

        tr:hover {
            background-color: blue;
        }
    </style>

</head>

<body>

    <div class="encabezado">
        <img class="img1" src="imagenes/libro.png">
        <h1>Biblioteca Online</h1>
    </div>

    <div class="login"><label><a href="login.php">Log In</a></label><label> ---- </label><label><a href="formulario.php">Registrarse</a></label></div> <div class="cuerpo">
        <div class="side">
            <div id="buscador1">
                <form action="<?php $_SERVER['PHP_SELF']; ?>" method="post">
                    <br>
                    <label>Buscar libro:</label>
                    <input type="text" name="nomTitulo" placeholder="Título del libro">
                    <br>
                    <br>
                    <button name="mostrar" class="btn">Buscar</button>
                </form>



            </div>
            <div id="buscador2">
                <form action="<?php $_SERVER['PHP_SELF']; ?>" method="post">
                    <br>
                    <label>Buscar Autor:</label>
                    <input type="text" name="nomAutor" placeholder="Nombre del autor">
                    <br>
                    <br>
                    <button name="mostrarAut" class="btn">Buscar</button>
                </form>

                <form action="<?php $_SERVER['PHP_SELF']; ?>" method='POST'>
                    <button type='submit' value='Volver' class='btn' name="limpiar">Limpiar búsqueda</button>
                </form>
            </div>


        </div>

        <div class="libros">
            <?php
            include 'opcionesBD2.php';
            ?>
        </div>

    </div>

    <div class="pie"></div>

    <script>
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
    </script>



</body>

</html>