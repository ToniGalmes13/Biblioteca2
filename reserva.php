<?php

$id = $_GET['idllibre'];
echo "$id";
echo "";
//$usuario = $_GET['nomUsuari'];
$usuario = $_GET['usuari'];
echo "$usuario";
echo "";
$disponibles = $_GET['disp'];

$indice = 1;

$total = $disponibles - $indice;

$hoy = date("Y-m-d");
echo "$hoy";
echo "";


if (isset($_POST['reserva'])) {
  $conn = dbConnect();
  
  $total = $disponibles - $indice;

  $consulta = "UPDATE libro SET Disponibles = '" . $total . "' WHERE Id_Libro ='" . $id . "'";

  $resultado = $conn->query($consulta);

  $consulta1 = "SELECT `Id_Usuario` FROM `usuario` WHERE `Nombre_Usuario` =  '$usuario'";

  $datos = mysqli_query($conn, $consulta1);
  $fila = mysqli_fetch_array($datos);

  $idUsu = $fila['Id_Usuario'];
  echo $idUsu;


  $fecha = "INSERT INTO reserva (Id_Libro, Id_Usuario, Fecha) VALUES ('$id', '$idUsu', '$hoy')";
  echo "$fecha";
  echo "";


  if (!mysqli_query($conn, $fecha)) {

    echo "Error: " . $fecha . "<br>" . mysqli_error($conn);
    echo "<form action='index.php' method='POST'>
     <button type='submit' value='Volver'><-Volver atras</button>
      </form>";
  } else if (!mysqli_query($conn, $idUsu)) {

    echo "Error: " . $idUsu . "<br>" . mysqli_error($conn);
    echo "<form action='index.php' method='POST'>
   <button type='submit' value='Volver'><-Volver atras</button>
    </form>";
  }
}
