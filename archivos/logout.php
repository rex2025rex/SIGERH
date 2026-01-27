<?php
// logout.php
session_start();

// Vaciar variables de sesión
$_SESSION = [];

// Destruir la sesión
session_destroy();

// Redirigir al login
header("Location: index.php");
exit();
