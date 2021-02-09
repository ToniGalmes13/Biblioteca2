<?php
function dbConnect()
{
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "Biblioteca";
    
    // Crear la conexión
    $conn = mysqli_connect($servername, $username, $password, $database);
    // Comprobar la conexión
    if (!$conn) {
        die("Fallo al conectarse a la base de datos: " . mysqli_connect_error()); // comprobamos si no hay conexión. Si no hay, identificamos el error y terminanos la ejecución del código.
    }
    
    return $conn;
}