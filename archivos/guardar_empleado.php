<?php
// guardar_empleado.php
session_start();

// Verificar sesión activa
if (!isset($_SESSION['usuario_id'])) {
    header("Location: index.php");
    exit();
}

// Conexión a la base de datos
$host = "localhost";
$usuarioBD = "root";
$claveBD = "";
$baseDatos = "nomina_db";

$conexion = new mysqli($host, $usuarioBD, $claveBD, $baseDatos);

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Capturar datos del formulario
$nombre             = $_POST['nombre'] ?? '';
$apellido           = $_POST['apellido'] ?? '';
$correo             = $_POST['correo'] ?? '';
$telefono           = $_POST['telefono'] ?? '';
$direccion          = $_POST['direccion'] ?? '';
$fecha_nacimiento   = $_POST['fecha_nacimiento'] ?? '';
$puesto             = $_POST['puesto'] ?? '';
$sucursal           = $_POST['sucursal'] ?? '';
$fecha_ingreso      = $_POST['fecha_ingreso'] ?? '';
$estatus            = $_POST['estatus'] ?? 'Activo';

// Validación básica del lado del servidor
if (
    empty($nombre) || empty($apellido) || empty($correo) ||
    empty($telefono) || empty($direccion) || empty($fecha_nacimiento) ||
    empty($puesto) || empty($sucursal) || empty($fecha_ingreso)
) {
    die("Todos los campos obligatorios deben ser llenados.");
}

// Insertar empleado
$stmt = $conexion->prepare("
    INSERT INTO empleados 
    (nombre, apellido, correo, telefono, direccion, fecha_nacimiento, puesto, sucursal, fecha_ingreso, estatus)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
");

$stmt->bind_param(
    "ssssssssss",
    $nombre,
    $apellido,
    $correo,
    $telefono,
    $direccion,
    $fecha_nacimiento,
    $puesto,
    $sucursal,
    $fecha_ingreso,
    $estatus
);

if ($stmt->execute()) {
    header("Location: panel_principal.php?mensaje=empleado_registrado");
    exit();
} else {
    echo "Error al registrar empleado.";
}

$stmt->close();
$conexion->close();
