<?php
// conexion.php

$host = "localhost";
$usuarioBD = "root";
$claveBD = "";
$baseDatos = "nomina_db";

$conexion = new mysqli($host, $usuarioBD, $claveBD, $baseDatos);

if ($conexion->connect_error) {
    die("Error de conexión a la base de datos");
}
