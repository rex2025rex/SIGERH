/* ==============================
   SIGERH - Login
   Archivo: js/login.js
   ============================== */

document.addEventListener("DOMContentLoaded", function () {

    const formulario = document.querySelector("form");
    const usuario = document.querySelector("input[name='usuario']");
    const password = document.querySelector("input[name='password']");

    formulario.addEventListener("submit", function (event) {

        // Eliminar mensajes previos
        let mensajeError = document.querySelector(".mensaje-error-js");
        if (mensajeError) {
            mensajeError.remove();
        }

        // Validaciones básicas
        if (usuario.value.trim() === "" || password.value.trim() === "") {
            event.preventDefault();

            mostrarError("Todos los campos son obligatorios");
            return;
        }

        if (password.value.length < 4) {
            event.preventDefault();

            mostrarError("La contraseña debe tener al menos 4 caracteres");
            return;
        }

    });

    function mostrarError(texto) {
        const error = document.createElement("p");
        error.classList.add("mensaje-error", "mensaje-error-js");
        error.textContent = texto;

        const loginBox = document.querySelector(".login-box");
        loginBox.insertBefore(error, loginBox.children[2]);
    }

});
