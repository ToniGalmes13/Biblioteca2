<html>

<head>
    <style>
        label {
            display: block;
            margin: .5em 0 0 0;
        }

        body{
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

        .cuerpo {
            display: flex;
            justify-content: center;
            border-radius: 20px;
        }

        .formulario {
            width: 400px;
            margin-left: auto;
            margin-right: auto;
            color: white;
            font-size: 1.5em;
            text-shadow: -2px -2px 1px #000, 2px 2px 1px #000, -2px 2px 1px #000, 2px -2px 1px #000;
        }

        .boton {
            display: flex;
            justify-content: center;

        }

        button {
            margin: 5px;
        }

        input {
            margin: 5px;
            box-shadow: 0px 0px 4px 2px black;
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
        <form name="formulario" class="formulario" action="registro.php" method="POST">
            <fieldset>
                <legend>Registro de usuario</legend>
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

                <label>Contraseña:</label>
                <input name="contrasenya" type="password" id="contrasena" required />

                <label>Repita la contraseña:</label>
                <input name="contrasenyaConfirm" type="password" id="contrasenaConfirm" required />
                <br>
                <br>
                <div class="boton">
                    <input class="btn" type="submit" name="enviar" value="Enviar" />
                    <button class="btn" role="link" onclick="window.location='index.php'">Atrás</button>
                </div>

            </fieldset>
        </form>
    </div>
    <div class="pie"></div>
</body>

</html>
