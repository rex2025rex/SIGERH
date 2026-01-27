<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['usuario_id'])) {
    header("Location: index.php");
    exit();
}

// Datos del usuario
$nombre_completo = $_SESSION['usuario_nombre_completo'];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Principal - SIGERH</title>
    <link rel="stylesheet" href="css/panel.css">
</head>
<body>

<header class="header">
    <h1>SIGERH</h1>
    <p>Sistema de Gestión de Recursos Humanos</p>
    <h2>Bienvenido, <?php echo htmlspecialchars($nombre_completo); ?></h2>
</header>

<div class="container">

    <!-- Registro de empleados -->
    <button onclick="window.location.href='registrar_empleado.php'">
        Registrar Empleado
    </button>

    <!-- Acceso a reportes -->
    <button onclick="window.location.href='reporte_nomina_sucursal.php'">
        Reportes
    </button>

    <!-- Módulos futuros -->
    <!--
    <button onclick="alert('Gestión de puestos en desarrollo');">Gestionar Puestos</button>
    <button onclick="alert('Configuración en desarrollo');">Configuración</button>
    -->

    <!-- Cerrar sesión -->
    <button class="logout-btn" onclick="window.location.href='logout.php'">
        Cerrar Sesión
    </button>

</div>

<script src="js/panel.js"></script>
</body>
</html>
