<?php
include 'conexionBD.php';

$conn = dbConnect();

// Comprobar la conexión
if (! $conn) {
    die("Fallo al conectarse a la base de datos: " . mysqli_connect_error()); // comprobamos si no hay conexión. Si no hay, identificamos el error y terminanos la ejecución del código.
} else {

    if (isset($_POST["enviar"])) {

        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $fechaNacimiento = $_POST['fecha'];
        $poblacion = $_POST['poblacion'];
        $direccion = $_POST['direccion'];
        $cp = $_POST['cp'];
        $email = $_POST['email'];
        $nombreUsuario = $_POST['nombreUsuario'];
        $contrasenya = $_POST['contrasenya'];
        $contrasenyaConfirm = $_POST['contrasenyaConfirm'];
        $hash = password_hash($contrasenya, PASSWORD_DEFAULT);

        $consulta = mysqli_query($conn, "SELECT * FROM usuario WHERE Nombre_Usuario = '$nombreUsuario'");
        $row = mysqli_fetch_array($consulta, MYSQLI_ASSOC);

        if ($row != 0) {   
           
            header("Location: formulario.php");
            echo '<script language="javascript">alert("Este usuario ya existe");</script>';
            die();
        } else if ($contrasenya == $contrasenyaConfirm) {

            $consulta = "INSERT INTO usuario (Nombre, Apellidos, Fecha_Nacimiento, Dirección, Población, Codigo_Postal, eMail, Nombre_Usuario, Contraseña) VALUES ('$nombre', '$apellidos', '$fechaNacimiento', ' $poblacion', '$direccion', '$cp', ' $email', '$nombreUsuario', '$hash')";

            if (mysqli_query($conn, $consulta)) {
                echo "<h1>Se ha conectado a la base de datos</h1>";
                echo "<h1>Datos introducidos correctamente</h1>
    <form action='index.php' method='POST'>
    <button type='submit' value='Volver'><-Volver atras</button>
    </form>";
            } else {
                echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
                echo "<form action='index.php' method='POST'>
        <button type='submit' value='Volver'><-Volver atras</button>
        </form>";
            }
        } else {
            echo "<h1>La contraseña no coincide</h1>";
            echo "<form action='formulario.php' method='POST'>
        <button type='submit' value='Volver'><-Volver atras</button>
        </form>";
        }
    } else if (isset($_POST["atras"])) {

        header("Location: index.php");
    }
}
?>