SIGERH - Frontend (Primera Iteración)
====================== -->
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="SIGERH - Sistema de Gestión de Recursos Humanos">
<title>SIGERH | Inicio</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>


<header class="header">
<h1>SIGERH</h1>
<p>Sistema de Gestión de Recursos Humanos</p>
</header>


<nav class="nav">
<ul>
<li><a href="#">Inicio</a></li>
<li><a href="#registro">Registro de Empleados</a></li>
<li><a href="#reportes">Reportes</a></li>
<li><a href="#">Cerrar sesión</a></li>
</ul>
</nav>


<main class="container">


<section class="card">
<h2>Bienvenido a SIGERH</h2>
<p>
Este sistema permite la gestión básica de los recursos humanos de la organización,
facilitando el registro, consulta y administración de la información del personal.
</p>
</section>


<section id="registro" class="card">
<h2>Registro de Empleados</h2>
<form class="form">
<label>Nombre completo</label>
<input type="text" placeholder="Ingrese el nombre">


<label>Correo electrónico</label>
<input type="email" placeholder="correo@ejemplo.com">


<label>Puesto</label>
<input type="text" placeholder="Puesto del empleado">


<label>Departamento</label>
<input type="text" placeholder="Departamento">


<button type="button">Guardar</button>
</form>
</section>


<section id="reportes" class="card">
<h2>Reportes</h2>
<p>En esta sección se visualizarán los reportes generales de empleados, asistencia y nómina.</p>
</section>


</main>


<footer class="footer">
<p>© 2025 SIGERH - Proyecto Académico</p>
</footer>


</body>
</html>