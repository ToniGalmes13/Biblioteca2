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
            border-style: solid;
            width: 300px;
            height: 600px;
            margin: 10px;
            display: flex;


        }

        .libros {
            border-style: solid;
            width: 800px;
            height: 600px;
            margin: 10px;
        }

        form {
            display: inline;
        }
        ul{
            color: lime;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;
        }

        .apanyo {
            margin-top: 85px;
            margin-right: 20px;
            margin-left: -40px;

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
    <?php
    session_start();
    $nomUsuario = $_SESSION['nombreUsuario'];
    ?>
    <div class="encabezado">
        <img class="img1" src="imagenes/libro.png">
        <h1>Biblioteca Online</h1>
    </div>

    <div class="login"><?php echo "<h2>Bienvenido " . $nomUsuario . "  </h2>"; ?> <label><a href="logout.php">Log Out</a></label> ---- <label><a href="editar.php">Editar Biblioteca</a></label></div>
    <div class="cuerpo">

        <div class="side">
            <form action="<?php $_SERVER['PHP_SELF']; ?>" method="post">
                <br>
                <label>Buscar libro:</label>
                <input type="text" name="nomTitulo" placeholder="Título del libro" onkeyup="mostrarLibro(this.value)">
                <br>
                <br>
                
                <button name="mostrar" class="btn">Buscar</button>
                <ul id="info"></ul>
            </form>

            <form action='index2.php' method='POST' class="apanyo">
                <button type='submit' value='Volver' class='btn'>Limpiar búsqueda</button>
            </form>

            


            <!--*prova de cerca per autor:
            <form action="<?php $_SERVER['PHP_SELF']; ?>" method="post">
                <br>
                <label>Buscar Autor:</label>
                <input type="text" name="nomAutor" placeholder="Nombre del autor">
                <br>
                <br>
                <button name="mostrarAut" class="btn">Buscar</button>
            </form>

            <form action='index2.php' method='POST' class="apanyo">
                <button type='submit' value='Volver' class='btn'>Limpiar búsqueda</button>
            </form>
-->
        </div>

        <div class="libros">
            <?php
            include 'opcionesBD.php';
            ?>
        </div>

    </div>

    <div class="pie"></div>

    <script>
        let resultado = document.getElementById('info');

        function mostrarLibro(nombre) {

            var xhttp = new XMLHttpRequest();

            if (nombre.length === "") {
                resultado.innerHTML = "";
            } else {
                xhttp.onreadystatechange = function() {

                    if (this.readyState === 4 && this.status === 200) {
                        resultado.innerHTML = xhttp.responseText;
                    }
                }
            };
            xhttp.open("GET", "ajax.php?nombre=" + nombre, true);
            xhttp.send();
        }
    </script>

</body>

</html>