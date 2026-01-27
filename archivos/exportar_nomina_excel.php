<?php
session_start();

if (!isset($_SESSION['usuario_id'])) {
    header("Location: index.php");
    exit();
}

// Conexión
require_once __DIR__ . '/conexion.php';
if (!isset($conexion)) {
    die("Error: no se pudo establecer conexión con la base de datos.");
}

// Consulta
$sql = "
SELECT 
    s.nombre AS sucursal,
    e.apellido,
    e.nombre,
    p.nombre_puesto AS puesto,
    p.salario_base,
    IFNULL(SUM(b.monto), 0) AS bonificaciones,
    IFNULL(SUM(d.monto), 0) AS deducciones,
    (p.salario_base + IFNULL(SUM(b.monto), 0) - IFNULL(SUM(d.monto), 0)) AS salario_neto
FROM empleados e
INNER JOIN puestos p ON p.puesto_id = e.puesto_id
INNER JOIN sucursales s ON s.id = e.sucursal_id
LEFT JOIN nominas n ON n.empleado_id = e.id
LEFT JOIN bonificaciones_nomina b ON b.nomina_id = n.id
LEFT JOIN deducciones_nomina d ON d.nomina_id = n.id
GROUP BY 
    s.nombre,
    e.apellido,
    e.nombre,
    p.nombre_puesto,
    p.salario_base
ORDER BY 
    s.nombre,
    e.apellido
";

$resultado = $conexion->query($sql);
if (!$resultado) {
    die("Error en la consulta: " . $conexion->error);
}

// Configurar headers para descargar como Excel
header("Content-Type: application/vnd.ms-excel; charset=UTF-8");
header("Content-Disposition: attachment; filename=reporte_nomina.xls");
header("Pragma: no-cache");
header("Expires: 0");

// Encabezados de la tabla
echo "<table border='1'>";
echo "<tr style='background-color:#4F81BD; color:white;'>
        <th>Sucursal</th>
        <th>Apellido</th>
        <th>Nombre</th>
        <th>Puesto</th>
        <th>Salario Base</th>
        <th>Bonificaciones</th>
        <th>Deducciones</th>
        <th>Salario Neto</th>
      </tr>";

// Totales
$total_salario_base = 0;
$total_bonificaciones = 0;
$total_deducciones = 0;
$total_salario_neto = 0;

// Datos
while ($row = $resultado->fetch_assoc()) {
    $total_salario_base += $row['salario_base'];
    $total_bonificaciones += $row['bonificaciones'];
    $total_deducciones += $row['deducciones'];
    $total_salario_neto += $row['salario_neto'];

    echo "<tr>
            <td>{$row['sucursal']}</td>
            <td>{$row['apellido']}</td>
            <td>{$row['nombre']}</td>
            <td>{$row['puesto']}</td>
            <td>{$row['salario_base']}</td>
            <td>{$row['bonificaciones']}</td>
            <td>{$row['deducciones']}</td>
            <td>{$row['salario_neto']}</td>
          </tr>";
}

// Fila de totales
echo "<tr style='font-weight:bold; background-color:#e0e0e0;'>
        <td colspan='4'>TOTAL</td>
        <td>$total_salario_base</td>
        <td>$total_bonificaciones</td>
        <td>$total_deducciones</td>
        <td>$total_salario_neto</td>
      </tr>";

echo "</table>";
exit();
