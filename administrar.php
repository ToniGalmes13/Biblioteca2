<?php

if (isset($_POST["borrarU"])) {

    $id = $_POST['idU'];

    $consulta = "DELETE FROM usuario WHERE Id_Usuario ='$id'";

    mysqli_query($conn, $consulta);
} else if (isset($_POST["borrarL"])) {

    $id = $_POST['idL'];

    $consulta = "DELETE FROM libro WHERE Id_Libro ='$id'";

    mysqli_query($conn, $consulta);
} else if (isset($_POST['devuelto'])) {

    $id = $_POST['idLD'];


    $consulta = mysqli_query($conn, "SELECT * FROM libro WHERE Id_Libro = '$id'");


    $row = mysqli_fetch_array($consulta, MYSQLI_ASSOC);

    $disponible = $row['Disponibles'];


    $total = $disponible + 1;

    $consulta = "UPDATE libro SET Disponibles = '" . $total . "' WHERE Id_Libro ='" . $id . "'";

    $resultado = $conn->query($consulta);

    if (!mysqli_query($conn, $consulta)) {

        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='index.php' method='POST'>
     <button type='submit' value='Volver'><-Volver atras</button>
      </form>";
    }
}
