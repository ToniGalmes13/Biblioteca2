<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
        .formulario fieldset label {
            display: block;
            margin: .5em 0 0 0;
        }

        .formulario {
            width: 400px;
            margin-left: auto;
            margin-right: auto;
            color: white;
            font-size: 1.5em;
        }


       
    </style>
</head>

<body>

    <div class="cuerpo">
        <form name="formulario" class="formulario" action="<?php $_SERVER['PHP_SELF']; ?>" method="POST">
            <fieldset>
            <input type="text" name="idL" placeholder="Id del libro para editar">
                <legend>Edicion de Libro</legend>

                <label>Titulo:</label>
                <input name="titulo" type="text" size="50" required />

                <label>Autor:</label>
                <input name="autor" type="text"  size="50" required />

                <label>Editorial:</label>
                <input name="editorial" type="text"  required />

                <label>Género:</label>
                <input name="genero" type="text" size="50" required />

                <label>Fecha de publicación:</label>
                <input name="fecha" type="text" required />

                <label>ID:</label>
                <input name="id" type="text" size="50" required />

                <label>Sinópsis:</label>
                <input name="sinopsis" type="text" required />

                <div class="boton">
                    <input class="btn" type="submit" name="enviarEdL" value="Editar" />
                    <button class="btn" role="link" onclick="window.location='editar.php'">Borrar</button>
                </div>
            </fieldset>
        </form>
    </div>
   

</body>

</html>


<?php

if (isset($_POST['enviarEdL'])) {
    $id=$_POST['idL'];
    $conn = dbConnect();

    
    $titulo = $_POST['titulo'];
    $autor = $_POST['autor'];
    $editorial = $_POST['editorial'];
    $genero = $_POST['genero'];
    $fecha = $_POST['fecha'];
    $id = $_POST['id'];
    $sinopsis = $_POST['sinopsis'];

    $consulta = "UPDATE libro SET Título = '" . $titulo . "', Autor = '" . $autor . "', Editorial = '" . $editorial . "', Género = '" . $genero ."', Fecha_de_publicación = '" . $fecha . "', Id_Libro = '" . $id . "', Sinopsis = '" . $sinopsis . "' WHERE Id_Libro = '" . $id . "'";

    if (mysqli_query($conn, $consulta)) {

        echo "<h1>Datos modificados correctamente</h1>
    <form action='editar.php' method='POST'>
    <button type='submit' value='Volver'><-Volver atras</button>
    </form>";
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='editar.php' method='POST'>
        <button type='submit' value='Volver'><-Volver atras</button>
        </form>";
    }
}




?>