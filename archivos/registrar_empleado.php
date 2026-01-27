<?php
session_start();

// Validar sesión
if (!isset($_SESSION['usuario_id'])) {
    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Empleado - SIGERH</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/registrar_empleado.css">
</head>
<body>

<header class="header">
    <h1>SIGERH</h1>
    <p>Sistema de Gestión de Recursos Humanos</p>
</header>

<main class="container">
    <section class="formulario">

        <form id="formEmpleado">

            <div class="form-columns">

                <!-- Columna izquierda -->
                <div class="form-column">
                    <label for="nombre">Nombre</label>
                    <input type="text" id="nombre" required>

                    <label for="apellido">Apellido</label>
                    <input type="text" id="apellido" required>

                    <label for="correo">Correo electrónico</label>
                    <input type="email" id="correo" required>

                    <label for="telefono">Teléfono</label>
                    <input type="tel" id="telefono" required>

                    <label for="direccion">Dirección</label>
                    <textarea id="direccion" rows="3" required></textarea>
                </div>

                <!-- Columna derecha -->
                <div class="form-column">
                    <label for="fecha_nacimiento">Fecha de nacimiento</label>
                    <input type="date" id="fecha_nacimiento" required>

                    <label for="puesto">Puesto</label>
                    <select id="puesto" required>
                        <option value="">Seleccione</option>
                        <option>Auxiliar Administrativo</option>
                        <option>Analista RH</option>
                        <option>Supervisor</option>
                        <option>Gerente</option>
                    </select>

                    <label for="sucursal">Sucursal</label>
                    <select id="sucursal" required>
                        <option value="">Seleccione</option>
                        <option>Matriz</option>
                        <option>Sucursal Norte</option>
                        <option>Sucursal Sur</option>
                    </select>

                    <label for="fecha_ingreso">Fecha de ingreso</label>
                    <input type="date" id="fecha_ingreso" required>

                    <label for="estatus">Estatus</label>
                    <select id="estatus">
                        <option>Activo</option>
                        <option>Inactivo</option>
                    </select>
                </div>

            </div>

            <div class="botones">
                <button type="submit" class="guardar">Guardar</button>
                <button type="button" class="cancelar" onclick="mostrarModal()">Cancelar</button>
            </div>

        </form>

    </section>
</main>

<!-- Modal de confirmación -->
<div id="modalCancelar" class="modal">
    <div class="modal-content">
        <h3>⚠ Atención</h3>
        <p>Perderá la información capturada</p>
        <div class="modal-buttons">
            <button class="aceptar" onclick="volverInicio()">Aceptar</button>
            <button class="cancelar" onclick="cerrarModal()">Cancelar</button>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="js/registrar_empleado.js"></script>

</body>
</html>
