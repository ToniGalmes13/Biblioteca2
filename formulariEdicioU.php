<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
</head>

<body>

    <div class="cuerpo">

        <form name="formulario" class="formulario" action="<?php $_SERVER['PHP_SELF']; ?>" method="POST">
        
           
            <fieldset>
            <input type="text" name="idU" placeholder="Id de usuario para editar">

                <legend>Edicion de usuario</legend>

                <label>Nombre:</label>
                <input name="nombre" type="text" id="nombre" required />

                <label>Apellidos:</label>
                <input name="apellidos" type="text" id="apellidos" size="50" required />

                <label>Fecha de nacimiento:</label>
                <input name="fecha" type="date" id="fechaNacimiento" size="50" required />

                <label>Población:</label>
                <input name="poblacion" type="text" id="poblacion" required />

                <label>Dirección:</label>
                <input name="direccion" type="text" id="direccion" size="50" required />

                <label>Código postal:</label>
                <input name="cp" type="number" id="cp" required />

                <label>e-Mail:</label>
                <input name="email" type="text" size="50" required />

                <label>Nombre de Usuario:</label>
                <input name="nombreUsuario" type="text" id="nombreUsuario" required />

                <div class="boton">
                    <input class="btn" type="submit" name="enviarEdU" value="Editar" />
                    <button class="btn" role="link" onclick="window.location='editar.php'">Borrar</button>
                </div>

            </fieldset>
        </form>
    </div>
    

</body>

</html>


<?php

if (isset($_POST['enviarEdU'])) {
    $id=$_POST['idU'];

    $conn = dbConnect();

    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $fechaNacimiento = $_POST['fecha'];
    $poblacion = $_POST['poblacion'];
    $direccion = $_POST['direccion'];
    $cp = $_POST['cp'];
    $email = $_POST['email'];
    $nombreUsuario = $_POST['nombreUsuario'];

    $consulta = "UPDATE usuario SET Nombre = '" . $nombre  . "', Apellidos = '" . $apellidos . "', Fecha_Nacimiento = '" . $fechaNacimiento . "', eMail = '" . $email . "', Dirección = '" . $direccion . "', Población = '" . $poblacion . "', Codigo_Postal = '" . $cp . "', Nombre_Usuario = '" . $nombreUsuario . "' WHERE Id_Usuario = '" . $id . "'";

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