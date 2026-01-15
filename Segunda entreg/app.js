// INDEX
function irRegistro() {
    window.location.href = "registrar_empleado.html";
}

function moduloPendiente(modulo) {
    alert("El módulo " + modulo + " se encuentra en desarrollo.");
}

function cerrarSesion() {
    alert("Funcionalidad pendiente de implementar en backend.");
}

// FORMULARIO
document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("formEmpleado");

    if (form) {
        form.addEventListener("submit", function (e) {
            e.preventDefault(); // 🚫 evita Not Found
            alert("Empleado registrado correctamente (simulación FrontEnd).");
            window.location.href = "index.html";
        });
    }
});

function mostrarModal() {
    document.getElementById("modalCancelar").style.display = "flex";
}

function cerrarModal() {
    document.getElementById("modalCancelar").style.display = "none";
}

function volverInicio() {
    window.location.href = "index.html";
}
