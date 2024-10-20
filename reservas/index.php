<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Conecta a la base de datos  con usuario, contraseña y nombre de la BD
$servidor = "localhost"; $usuario = "root"; $contrasenia = ""; $nombreBaseDatos = "elcharrorockbd";
$conexionBD = new mysqli($servidor, $usuario, $contrasenia, $nombreBaseDatos);


// Consulta datos y recepciona una clave para consultar dichos datos con dicha clave
if (isset($_GET["consultar"])){
    $sqlReservas = mysqli_query($conexionBD,"SELECT * FROM reservas WHERE id=".$_GET["consultar"]);
    if(mysqli_num_rows($sqlReservas) > 0){
        $reservas = mysqli_fetch_all($sqlReservas,MYSQLI_ASSOC);
        echo json_encode($reservas);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//borrar pero se le debe de enviar una clave ( para borrado )
if (isset($_GET["borrar"])){
    $sqlReservas = mysqli_query($conexionBD,"DELETE FROM reservas WHERE id=".$_GET["borrar"]);
    if($sqlReservas){
        echo json_encode(["success"=>1]);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//Inserta un nuevo registro y recepciona en método post los datos de nombre-apellidos, correo, fecha, hora y personas
if(isset($_GET["insertar"])){
    $data = json_decode(file_get_contents("php://input"));
    $nombre=$data->nombre;
    $correo=$data->correo;
    $fecha=$data->fecha;
    $hora=$data->hora;
    $personas=$data->personas;

    if(($correo!="")&&($nombre!="")&&($fecha!="")&&($hora!="")&&($personas!=""))    {
        $sqlReservas = mysqli_query($conexionBD,"INSERT INTO reservas(nombre,correo,fecha,hora,personas) VALUES('$nombre','$correo','$fecha','$hora','$personas') ");
        echo json_encode(["success"=>1]);
    }
    exit();
}
// Actualiza datos pero recepciona datos de nombre, correo y una clave para realizar la actualización
if(isset($_GET["actualizar"])){
    
    $data = json_decode(file_get_contents("php://input"));

    $id=(isset($data->id))?$data->id:$_GET["actualizar"];
    $nombre=$data->nombre;
    $correo=$data->correo;
    $fecha=$data->fecha;
    $hora=$data->hora;
    $personas=$data->personas;
    
    $sqlReservas = mysqli_query($conexionBD,"UPDATE reservas SET nombre='$nombre',correo='$correo',fecha='$fecha',hora='$hora',personas='$personas' WHERE id='$id'");
    echo json_encode(["success"=>1]);
    exit();
}

// Consulta todos los registros de la tabla reservas
$sqlReservas = mysqli_query($conexionBD,"SELECT * FROM reservas ");
if(mysqli_num_rows($sqlReservas) > 0){
    $reservas = mysqli_fetch_all($sqlReservas,MYSQLI_ASSOC);
    echo json_encode($reservas);
}
else{ echo json_encode([["success"=>0]]); }

?>