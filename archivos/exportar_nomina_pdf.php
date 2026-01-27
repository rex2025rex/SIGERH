<?php
session_start();
require_once __DIR__ . '/conexion.php';
require_once __DIR__ . '/tcpdf/tcpdf.php';

if (!isset($_POST['consultar'])) {
    header("Location: reporte_nomina_sucursal.php");
    exit();
}

// Consulta de nómina por sucursal
$sql = "
SELECT 
    s.nombre AS sucursal,
    e.apellido,
    e.nombre,
    p.nombre_puesto AS puesto,
    p.salario_base,
    IFNULL(SUM(b.monto),0) AS bonificaciones,
    IFNULL(SUM(d.monto),0) AS deducciones,
    (p.salario_base + IFNULL(SUM(b.monto),0) - IFNULL(SUM(d.monto),0)) AS salario_neto
FROM empleados e
INNER JOIN puestos p ON p.puesto_id = e.puesto_id
INNER JOIN sucursales s ON s.id = e.sucursal_id
LEFT JOIN nominas n ON n.empleado_id = e.id
LEFT JOIN bonificaciones_nomina b ON b.nomina_id = n.id
LEFT JOIN deducciones_nomina d ON d.nomina_id = n.id
GROUP BY s.nombre, e.apellido, e.nombre, p.nombre_puesto, p.salario_base
ORDER BY s.nombre, e.apellido
";

$resultado = $conexion->query($sql);
if (!$resultado) {
    die("Error en la consulta: " . $conexion->error);
}

// Crear PDF
$pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator('SIGERH');
$pdf->SetAuthor('SIGERH');
$pdf->SetTitle('Resumen de Nómina');
$pdf->SetMargins(10, 10, 10);
$pdf->AddPage();

// Título
$pdf->SetFont('helvetica', 'B', 16);
$pdf->Cell(0, 10, 'Resumen de Nómina por Empleado', 0, 1, 'C');
$pdf->Ln(5);

// Tabla
$pdf->SetFont('helvetica', '', 10);
$tbl = '<table border="1" cellpadding="4">
<tr style="background-color:#4F81BD;color:white;">
    <th>Sucursal</th>
    <th>Apellido</th>
    <th>Nombre</th>
    <th>Puesto</th>
    <th>Salario Base</th>
    <th>Bonificaciones</th>
    <th>Deducciones</th>
    <th>Salario Neto</th>
</tr>';

$total_salario_base = 0;
$total_bonificaciones = 0;
$total_deducciones = 0;
$total_neto = 0;

while ($row = $resultado->fetch_assoc()) {
    $tbl .= '<tr>
        <td>'.htmlspecialchars($row['sucursal']).'</td>
        <td>'.htmlspecialchars($row['apellido']).'</td>
        <td>'.htmlspecialchars($row['nombre']).'</td>
        <td>'.htmlspecialchars($row['puesto']).'</td>
        <td>$'.number_format($row['salario_base'],2).'</td>
        <td>$'.number_format($row['bonificaciones'],2).'</td>
        <td>$'.number_format($row['deducciones'],2).'</td>
        <td>$'.number_format($row['salario_neto'],2).'</td>
    </tr>';

    $total_salario_base += $row['salario_base'];
    $total_bonificaciones += $row['bonificaciones'];
    $total_deducciones += $row['deducciones'];
    $total_neto += $row['salario_neto'];
}

// Fila de totales
$tbl .= '<tr style="font-weight:bold;background-color:#D9E1F2;">
    <td colspan="4" align="center">Totales</td>
    <td>$'.number_format($total_salario_base,2).'</td>
    <td>$'.number_format($total_bonificaciones,2).'</td>
    <td>$'.number_format($total_deducciones,2).'</td>
    <td>$'.number_format($total_neto,2).'</td>
</tr>';

$tbl .= '</table>';

$pdf->writeHTML($tbl, true, false, false, false, '');

// Salida
$pdf->Output('resumen_nomina.pdf', 'I');
