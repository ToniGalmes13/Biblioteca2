
<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="utf-8">
<title>Login</title>

<style>
body {
    background-image: url("imagenes/libroRosa.jpg");
}

div {
    margin: 5px;
}

.encabezado {
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 20px;
    
}

h1 {
    display: inline;
    margin: 50px;
    font-family: monospace;
    font-size: 4em;
    
}

label {
    color: white;
    font-size: 1.5em;
    
    text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;
}

.cuerpo {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border-radius: 20px;
}

.formulari {
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-top: 15%;
    margin-top: 5px;
}
textarea{
    min-width: 400px;
    max-width: 400px;
    min-height: 200px;
    max-height: 400px;
}
input {
    margin: 5px;
    box-shadow: 0px 0px 4px 2px black;
}

.boton {
    display: flex;
    justify-content: center;
}
button{
    margin: 5px;
}

.btn {
    border-style: none;
    width: 100px;
    height: 35px;
    border-radius: 10px;
    color: black;
    font-weight: bold;
    background-image: linear-gradient( tan, darkgrey);
    box-shadow: 0px 0px 4px 2px black;
}

.btn:hover {
    border-style: none;
    width: 100px;
    height: 35px;
    border-radius: 10px;
    background-image: linear-gradient(darkgrey, darkkhaki);
}
a{
    text-decoration: none;
    color: black;
}

.pie {
    width: 100%;
    height: 100px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 20px;
}
</style>

</head>

<body>

<div class="encabezado">
<img src="imagenes/libro.png">
<h1>Biblioteca Online</h1>
</div>
<div class="cuerpo">
<h2>Nos encantaria saber tu opinión!</h2>
<form method="POST" action="correu.php" name='contacto'>
    <div class="formulari">
    <label>Nombre de usuario: </label>
    <input type="text" placeholder="Nombre de Usuario" name="usuario">
      <label>Tu correo electrónico: </label>
    <input type="email" placeholder="Si quieres recibir respuesta y/o confirmación" name="correo">
    <label>Motivo por el que escribes: </label>
    <input type="text" placeholder="Asunto" name="asunto">
    <label>Tu opinión CUENTA!!: </label>
    <br>
    <textarea placeholder="Mensaje..." name="msg"></textarea>
    
    <div class="boton">
    <input class="btn" type="submit" name="enviar">
    <button class="btn"><a href="index2.php">Atras</a></button>
    </div>
    </div>
    
    
    </form>
    </div>
    <div class="pie"></div>
</body>

</html>
