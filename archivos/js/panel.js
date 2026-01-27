/* ==============================
   Panel principal - SIGERH
   ============================== */

/**
 * Redirige al módulo de registro de empleados
 */
function irRegistro() {
    window.location.href = "registrar_empleado.php";
}

/**
 * Muestra mensaje de módulo pendiente
 * @param {string} modulo
 */
function moduloPendiente(modulo) {
    alert("El módulo '" + modulo + "' se encuentra en desarrollo para la siguiente iteración.");
}

/**
 * Cierra la sesión del usuario
 */
function cerrarSesion() {
    if (confirm("¿Desea cerrar la sesión?")) {
        window.location.href = "logout.php";
    }
}
