<?php
// index.php
session_start();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>SIGERH - Sistema Integral de Gestión de Recursos Humanos</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

    <div class="login-box">
        <h1>SIGERH</h1>
        <p class="subtitulo">Sistema Integral de Gestión de Recursos Humanos</p>

        <!-- Mensaje de error desde PHP -->
        <?php
        if (isset($_SESSION['error'])) {
            echo '<p class="mensaje-error">'.$_SESSION['error'].'</p>';
            unset($_SESSION['error']);
        }
        ?>

        <!-- Formulario de inicio de sesión -->
        <form action="validar_login.php" method="POST" novalidate>
            <input type="text" name="usuario" placeholder="Usuario">
            <input type="password" name="password" placeholder="Contraseña">
            <button type="submit">Entrar</button>
        </form>
    </div>

    <!-- JavaScript -->
    <script src="js/login.js"></script>

</body>
</html>

