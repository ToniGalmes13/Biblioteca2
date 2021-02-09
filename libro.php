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
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;

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
            align-items: center;
            width: 100%;
            height: 60%;
            margin-left: auto;
            margin-right: auto;
            border-radius: 20px;
        }

        .caja1 {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .boton {
            display: flex;
            justify-content: center;

        }

        input {
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

        .caja2 {
            width: 40%;
            margin-top: -5%;
        }

        .caja3 {
            text-align: center;
            color: white;
            height: 100%;

        }

        .portada {
            display: inline-block;
            width: 300px;
            height: 400px;
            margin: 10px;

        }

        .imagen {
            width: 300px;
            height: 400px;
        }

        .descripcion {
            display: flex;
            flex-direction: column;
            padding-top: 0;
        }

        label {
            font-size: 1.5em;
            color: white;
            font-weight: bold;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;

        }

        .sinopsis {
            border-color: blue;
            text-align: justify;
            font-size: 1.25em;
            padding: 5px;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;

        }



        .pie {

            width: 100%;
            height: 100px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 20px;
        }
    </style>


</head>

<body>


    <div class="encabezado">
        <img src="imagenes/libro.png">
        <h1>Biblioteca Online</h1>
    </div>

    <form action="<?php $_SERVER['PHP_SELF']; ?>" method="post">
        <div class="cuerpo">
            <div class="caja1">
                <div class="portada"><img class="imagen" src="librosIMG/<?php

                include 'conexionBD.php';
                $idLLibre = $_GET['idllibre'];



                $conn = dbConnect();
                $consulta = "SELECT * FROM libro where Id_Libro = '$idLLibre'";

                $resultado = $conn->query($consulta);

                if (!mysqli_query($conn, $consulta)) {

                    echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
                    echo "<form action='index.php' method='POST'>
<button type='submit' value='Volver'><-Volver atras</button>
</form>";
                }

                $fila = $resultado->fetch_array();

                echo $fila[0];

                $cant = $fila[8];

                $num = intval(strval($cant * 100));
                ?>">
                </div>

                <div class="boton">

                    <input class="btn" type="button" value="Atrás" onclick="window.location='index2.php'" />
                    <form action="reserva.php" method="POST">
                        <button class="btn" type="submit" name="reserva">Reservar</button>
                    </form>
                </div>
            </div>

            <div class="caja3">
                <h2>Sinópsis:</h2>
                <div class="sinopsis">

                    <?php

                    //  include 'conexionBD.php';
                    $idLLibre = $_GET['idllibre'];

                    // $conn = dbConnect();
                    $consulta = "SELECT * FROM libro where Id_Libro = '$idLLibre'";

                    $resultado = $conn->query($consulta);

                    if (!mysqli_query($conn, $consulta)) {

                        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
                        echo "<form action='index.php' method='POST'>
 <button type='submit' value='Volver'><-Volver atras</button>
  </form>";
                    }

                    $fila = $resultado->fetch_array();


                    echo $fila[7];
                    ?>

                </div>
            </div>

        </div>
    </form>
    </div>

    <div class="pie"><?php include 'reserva.php'; ?></div>


</body>

</html>