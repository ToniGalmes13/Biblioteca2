<?php
include 'conexionBD.php';

$conn = dbConnect();

if (isset($_POST["mostrar"])) {

    $titulo = $_POST['nomTitulo'];

    $consulta = "SELECT * FROM libro where Título like '%$titulo%'";

    $resultado = $conn->query($consulta);

    if (!mysqli_query($conn, $consulta)) {

        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='index.php' method='POST'>
     <button type='submit' value='Volver'><-Volver atras</button>
      </form>";
    }

    echo "
    <table align=center>
<th>Portada</th>
    <th>Titulo</th>
    <th>Autor</th>
    <th>Editorial</th>
    <th>Género</th>
    <th>Fecha de publicación</th>
    <th>Disponibles</th>
";


    while ($fila = $resultado->fetch_array()) {

        echo "
    <tr>
<td><img src = 'librosIMG/$fila[0]'></td> 
    <td>$fila[1]</td>
    <td>$fila[2]</td>
    <td>$fila[3]</td>
    <td>$fila[4]</td>
    <td>$fila[5]</td>
    <td>$fila[8]</td>
</tr>
";
    }

    echo "</table>";
} else if (isset($_POST["mostrarAut"])) {

    $nomAut = $_POST['nomAutor'];

    $consulta = "SELECT * FROM libro where Autor like '%$nomAut%'";

    $resultado = $conn->query($consulta);

    if (!mysqli_query($conn, $consulta)) {

        echo "Error: " . $consulta . "<br>" . mysqli_error($conn);
        echo "<form action='index.php' method='POST'>
     <button type='submit' value='Volver'><-Volver atras</button>
      </form>";
    }

    echo "
    <table align=center>

    <th>Autor</th>
    <th>Titulo</th>
    <th>Portada</th>
    <th>Editorial</th>
    <th>Género</th>
    <th>Fecha de publicación</th>
    <th>ID</th>
";
    while ($fila = $resultado->fetch_array()) {

        echo "
    <tr onclick='indexTabla(this)'>

    <td>$fila[2]</td>
    <td>$fila[1]</td>
    <td><img src = 'librosIMG/$fila[0]'></td> 
    <td>$fila[3]</td>
    <td>$fila[4]</td>
    <td>$fila[5]</td>
    <td>$fila[6]</td>
</tr>";
    }
    echo "</table>";
} else if (isset($_POST['limpiar'])) {
    echo "";
}











?>

<script>



</script>