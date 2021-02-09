<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "goCars";

// Crear la conexión
$conn = mysqli_connect($servername, $username, $password, $database);
// Comprobar la conexión
if (!$conn) {
    die("Fallo al conectarse a la base de datos: " . mysqli_connect_error()); // comprobamos si no hay conexión. Si no hay, identificamos el error y terminanos la ejecución del código.
} else {
    echo "Se ha conectado a la base de datos";
}
echo "<br>";

if (isset($_POST["agregar"])) {

    $matricula = $_POST['matricula'];
    $marca = $_POST['marca'];
    $modelo = $_POST['modelo'];
    $color = $_POST['color'];
    $antiguedad = $_POST['antiguedad'];
    $kms = $_POST['kms'];

    $consulta = "INSERT INTO coches (Matricula, Marca, Modelo, Color, Antigüedad, Kms) VALUES ('$matricula', '$marca', '$modelo', ' $color', '$antiguedad', '$kms')";

    if (mysqli_query($conn, $consulta)) {

        echo "<h1>Datos introducidos correctamente</h1>
    <form action='indexBD.php' method='POST'>
    <button type='submit' value='Volver'><-Volver atras</button>
    </form>";
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='indexBD.php' method='POST'>
        <button type='submit' value='Volver'><-Volver atras</button>
        </form>";
    }
} else if (isset($_POST['modificar'])) {

    $matricula = $_POST['matricula2'];
    $marca = $_POST['marca2'];
    $modelo = $_POST['modelo2'];
    $color = $_POST['color2'];
    $antiguedad = $_POST['antiguedad2'];
    $kms = $_POST['kms2'];
    
    
    
    
    $consulta = "UPDATE coches SET Marca = '".$marca."', Modelo = '".$modelo."', Color = '".$color."', Antigüedad = '".$antiguedad."', Kms = '".$kms."' WHERE Matricula = '".$matricula."'";
    
    if (mysqli_query($conn, $consulta)) {
        
        echo "<h1>Datos modificados correctamente</h1>
    <form action='indexBD.php' method='POST'>
    <button type='submit' value='Volver'><-Volver atras</button>
    </form>";
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='indexBD.php' method='POST'>
        <button type='submit' value='Volver'><-Volver atras</button>
        </form>";
    }
    
    
    
}
else if (isset($_POST["borrar"])) {
    
    $matricula = $_POST['matricula3'];
    
    $consulta = "DELETE FROM coches WHERE Matricula='".$matricula."'";
    
    if (mysqli_query($conn, $consulta)) {
        
        echo "<h1>Datos borrados correctamente</h1>
    <form action='indexBD.php' method='POST'>
    <button type='submit' value='Volver'><-Volver atras</button>
    </form>";
        
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='indexBD.php' method='POST'>
        <button type='submit' value='Volver'><-Volver atras</button>
        </form>";
    }
    
    
    
} 
else if (isset($_POST["mostrar"])) {
    
    $consulta = "SELECT * FROM coches";
   
    $resultado = $conn->query($consulta);
    
    if (mysqli_query($conn, $consulta)) {
        
        echo "<h1 align=center>Lista de coches 2021</h1>
    <form action='indexBD.php' method='POST'>
    <button type='submit' value='Volver'><-Volver atras</button>
    </form>";
    } else {
        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='indexBD.php' method='POST'>
        <button type='submit' value='Volver'><-Volver atras</button>
        </form>";
    }
    
    echo "
    <table align=center>
    <th>Matricula</th>
    <th>Marca</th>
    <th>Modelo</th>
    <th>Color</th>
    <th>Años</th>
    <th>Kms</th>
";
    while($fila = $resultado->fetch_array()) {
        
        echo "
    <tr>
    <td>$fila[0]</td>
    <td>$fila[1]</td>
    <td>$fila[2]</td>
    <td>$fila[3]</td>
    <td>$fila[4]</td>
    <td>$fila[5]</td>
</tr>
";
        
    }
    
    
    
    
    
    
}
mysqli_close($conn);

?>