<?php

include 'conexionBD.php';

$conn=dbConnect();
if (isset($_GET['nombre'])) {

    $nombre = $_GET['nombre'];
}

if (!empty($nombre)) {

    $nom = mysqli_real_escape_string($conn, $nombre);
    $consulta = "SELECT * FROM libro WHERE Título LIKE '%$nom%'";
    $resultadoBD = $conn->query($consulta);

    while ($fila = mysqli_fetch_assoc($resultadoBD)) {
        echo "<li>".$fila['Título'] . "</li>";
    }
}
