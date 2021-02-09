<?php


 if (isset($_POST["mostrarU"])) {
   
    $conn=dbConnect();
    $consulta = "SELECT * FROM usuario";

    $resultado = $conn->query($consulta);

    if (!mysqli_query($conn, $consulta)) {

        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='index.php' method='POST'>
     <button type='submit' value='Volver'><-Volver atras</button>
      </form>";
    }

    echo "
    <table align=center>
    <th>Nombre</th>
    <th>Apellidos</th>
    <th>Fecha de Nacimiento</th>
    <th>eMail</th>
    <th>Dirección</th>
    <th>Población</th>
    <th>CP</th>
    <th>Nombre de Usuario</th>
    <th>ID Usuario</th>
";
    while ($fila = $resultado->fetch_array()) {

        echo "
    <tr>
    <td>$fila[0]</td> 
    <td>$fila[1]</td>
    <td>$fila[2]</td>
    <td>$fila[3]</td>
    <td>$fila[4]</td>
    <td>$fila[5]</td>
    <td>$fila[6]</td>
    <td>$fila[7]</td>
    <td>$fila[10]</td>
</tr>";
    }
    echo "</table>";
}else if (isset($_POST["mostrarL"])) {
    
    $conn=dbConnect();
    $consulta = "SELECT * FROM libro";

    $resultado = $conn->query($consulta);

    if (!mysqli_query($conn, $consulta)) {

        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='index.php' method='POST'>
     <button type='submit' value='Volver'><-Volver atras</button>
      </form>";
    }

    echo "
    <table align=center>
    <th>Titulo</th>
    <th>Autor</th>
    <th>Editorial</th>
    <th>Género</th>
    <th>Fecha de publicación</th>
    <th>Disponibles</th>
    <th>ID</th>
";
    while ($fila = $resultado->fetch_array()) {

        echo "
    <tr>
    <td>$fila[1]</td>
    <td>$fila[2]</td>
    <td>$fila[3]</td>
    <td>$fila[4]</td>
    <td>$fila[5]</td>
    <td>$fila[8]</td>
    <td>$fila[6]</td>
</tr>";
    }
    echo "</table>";
}