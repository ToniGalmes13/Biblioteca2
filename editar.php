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

        .login {
            display: block;
            text-align: center;
            padding: 10px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            border-radius: 20px;


        }

        a {
            text-decoration: none;
            color: white;
            font-size: 1.5em;
            font-weight: bold;
            margin-right: 10px;
            margin-left: 10px;
        }

        .login a:hover {
            background-color: royalblue;
            color: yellow;
            border-radius: 5px;
            font-weight: normal;
        }

        .cuerpo {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 20px;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;
            color: lawngreen;
        }


        .opciones {

            width: 800px;
            height: 300px;
            margin: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .formularis {
            display: flex;
            justify-content: center;
            align-items: center;


        }


        button {
            margin: 20px;
        }

        input {
            margin: 5px;
            box-shadow: 0px 0px 4px 2px black;
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

        table {
            
            font-size: larger;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;
        }
        td{
            border: solid black;
            color: white;
        }

        th {
            border: solid black;
            color: aqua;
        }
    </style>

</head>

<body>

    <div class="encabezado">
        <img src="imagenes/libro.png">
        <h1>Biblioteca Online</h1>
    </div>

    <div class="login"><a href="logout.php">Log Out</a><label> ---- </label><a href="index3.php">Atrás</a></label></div>
    <div class="cuerpo">
        <div>
            <form action="<?php $_SERVER['PHP_SELF']; ?>" method="post">
                <button name="mostrarU" class="btn">Mostrar Usuarios</button>
                <button name="mostrarL" class="btn">Mostrar Libros</button>


                <div class="usu">
                    <!--<button name="editarU" class="btn">Editar Usuario</button>-->
                    <button name="borrarU" class="btn">Borrar Usuario</button>
                    <input type="text" name="idU" placeholder="Id de usuario para borrar">
                </div>

                <div class="lib">
                    <!--<button name="editarL" class="btn">Editar Libro</button>-->
                    <button name="borrarL" class="btn">Borrar Libro</button>
                    <input type="text" name="idL" placeholder="Id del libro para borrar">
                    <br>
                    <button name="devuelto" class="btn">Libro Devuelto</button>
                    <input type="text" name="idLD" placeholder="Id del libro devuelto">
                </div>
            </form>
        </div>

        <?php
        include 'opcionesBD.php';
        ?>
        <?php
        include 'listar.php';
        ?>
        <?php
        include 'administrar.php';
        ?>

    </div>
    <div class="formularis">
        <div>
            <?php
            include 'formulariEdicioL.php';
            ?>
        </div>
        <div></div>
        <div></div>
        <div>
            <?php
            include 'formulariEdicioU.php';
            ?>
        </div>
    </div>
    <div class="pie">

    </div>


</body>

</html>