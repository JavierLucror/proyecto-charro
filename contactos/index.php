<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Conecta a la base de datos  con usuario, contraseña y nombre de la BD
$servidor = "localhost"; $usuario = "root"; $contrasenia = ""; $nombreBaseDatos = "elcharrorockbd";
$conexionBD = new mysqli($servidor, $usuario, $contrasenia, $nombreBaseDatos);

//Inserta un nuevo registro y recepciona en método post los datos de nombre-apellidos, correo, fecha, hora y personas
if(isset($_GET["insertar"])){
    $data = json_decode(file_get_contents("php://input"));
    $nombre=$data->nombre;
    $apellidos=$data->apellidos;
    $correo=$data->correo;
    $telefono=$data->telefono;
    $mensaje=$data->mensaje;
    $politica=$data->politica;

    if(($correo!="")&&($nombre!="")&&($apellidos!="")&&($telefono!="")&&($mensaje!="")&&($politica!=""))    {
        $sqlReservas = mysqli_query($conexionBD,"INSERT INTO contactos(nombre,apellidos,correo,telefono,mensaje,politica) VALUES('$nombre','$apellidos','$correo','$telefono','$mensaje',$politica) ");
        echo json_encode(["success"=>1]);
    }
    exit();
}

?>