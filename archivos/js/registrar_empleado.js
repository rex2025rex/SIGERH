// ===============================
// REGISTRAR EMPLEADO - SIGERH
// ===============================

document.addEventListener("DOMContentLoaded", () => {

    const form = document.getElementById("formEmpleado");

    if (form) {
        form.addEventListener("submit", function (e) {
            e.preventDefault();

            // Validar campos antes de enviar
            if (validarFormulario()) {
                alert("Empleado registrado correctamente (simulación FrontEnd).");
                window.location.href = "panel_principal.php";
            }
        });
    }

});

/* ===============================
   VALIDACIONES
================================ */
function validarFormulario() {

    const campos = [
        "nombre",
        "apellido",
        "correo",
        "telefono",
        "direccion",
        "fecha_nacimiento",
        "puesto",
        "sucursal",
        "fecha_ingreso"
    ];

    for (let id of campos) {
        const campo = document.getElementById(id);
        if (!campo || campo.value.trim() === "") {
            alert("⚠ Por favor complete todos los campos obligatorios.");
            campo.focus();
            return false;
        }
    }

    // Validar correo electrónico
    const correo = document.getElementById("correo").value;
    const regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!regexCorreo.test(correo)) {
        alert("⚠ El correo electrónico no tiene un formato válido.");
        document.getElementById("correo").focus();
        return false;
    }

    return true;
}

/* ===============================
   MODAL CANCELAR
================================ */
function mostrarModal() {
    document.getElementById("modalCancelar").style.display = "flex";
}

function cerrarModal() {
    document.getElementById("modalCancelar").style.display = "none";
}

function volverInicio() {
    window.location.href = "panel_principal.php";
}
