<?php
session_start();

/* ==============================
   Conexión a la Base de Datos
   ============================== */
$host = "localhost";
$usuarioBD = "root";
$claveBD = "";
$baseDatos = "nomina_db";

$conexion = new mysqli($host, $usuarioBD, $claveBD, $baseDatos);

if ($conexion->connect_error) {
    die("Error de conexión a la base de datos");
}

/* ==============================
   Validar método POST
   ============================== */
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: index.php");
    exit();
}

$usuario  = trim($_POST['usuario'] ?? '');
$password = trim($_POST['password'] ?? '');

/* ==============================
   Validaciones del lado servidor
   ============================== */
if ($usuario === "" || $password === "") {
    $_SESSION['error'] = "Todos los campos son obligatorios";
    header("Location: index.php");
    exit();
}

/* ==============================
   Consulta segura
   ============================== */
$sql = "SELECT id, nombre_usuario, password, nombre_completo
        FROM usuarios
        WHERE nombre_usuario = ?
        LIMIT 1";

$stmt = $conexion->prepare($sql);
$stmt->bind_param("s", $usuario);
$stmt->execute();
$resultado = $stmt->get_result();

/* ==============================
   Validar credenciales
   ============================== */
if ($resultado->num_rows === 1) {

    $fila = $resultado->fetch_assoc();

    // Comparación directa (entorno académico)
    if ($fila['password'] === $password) {

        // 🔐 Seguridad y estabilidad de sesión
        session_regenerate_id(true);

        $_SESSION['usuario_id'] = (int)$fila['id'];
        $_SESSION['usuario_nombre_usuario'] = $fila['nombre_usuario'];
        $_SESSION['usuario_nombre_completo'] = $fila['nombre_completo'];

        header("Location: panel_principal.php");
        exit();
    }
}

/* ==============================
   Error de autenticación
   ============================== */
$_SESSION['error'] = "Usuario o contraseña incorrectos";
header("Location: index.php");

$stmt->close();
$conexion->close();
exit();
