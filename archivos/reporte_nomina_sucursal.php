<?php
session_start();

/* =========================
   Validar sesión activa
   ========================= */
if (!isset($_SESSION['usuario_id'])) {
    header("Location: index.php");
    exit();
}

$nombre_usuario = $_SESSION['usuario_nombre_completo'];

/* =========================
   Conexión a la DB
   ========================= */
require_once __DIR__ . '/conexion.php';
if (!isset($conexion)) {
    die("Error: no se pudo establecer conexión con la base de datos.");
}









/* =========================
   EXPORTAR EXCEL (LO NUEVO)
========================= */
if (isset($_GET['export']) && $_GET['export'] === 'excel' && isset($_GET['sucursal_id'])) {

    $sucursal_id = intval($_GET['sucursal_id']);

    $sql = "
    SELECT 
        s.nombre AS sucursal,
        e.apellido,
        e.nombre,
        p.nombre_puesto AS puesto,
        p.salario_base,
        IFNULL(b.total_bonificaciones,0) AS bonificaciones,
        IFNULL(d.total_deducciones,0) AS deducciones,
        (p.salario_base + IFNULL(b.total_bonificaciones,0) - IFNULL(d.total_deducciones,0)) AS salario_neto
    FROM empleados e
    INNER JOIN puestos p ON p.puesto_id = e.puesto_id
    INNER JOIN sucursales s ON s.id = e.sucursal_id
    LEFT JOIN (
        SELECT n.empleado_id, SUM(b.monto) AS total_bonificaciones
        FROM nominas n
        LEFT JOIN bonificaciones_nomina b ON b.nomina_id = n.id
        GROUP BY n.empleado_id
    ) b ON b.empleado_id = e.id
    LEFT JOIN (
        SELECT n.empleado_id, SUM(d.monto) AS total_deducciones
        FROM nominas n
        LEFT JOIN deducciones_nomina d ON d.nomina_id = n.id
        GROUP BY n.empleado_id
    ) d ON d.empleado_id = e.id
    WHERE e.sucursal_id = ?
    ORDER BY e.apellido, e.nombre
    ";

    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("i", $sucursal_id);
    $stmt->execute();
    $resultado = $stmt->get_result();

    header("Content-Type: application/vnd.ms-excel; charset=UTF-8");
    header("Content-Disposition: attachment; filename=nomina_sucursal_" . date("Ymd_His") . ".csv");
    header("Pragma: no-cache");
    header("Expires: 0");

    // BOM UTF-8
    echo "\xEF\xBB\xBF";

    echo "Sucursal,Apellido,Nombre,Puesto,Salario Base,Bonificaciones,Deducciones,Salario Neto\n";

    while ($row = $resultado->fetch_assoc()) {
        echo "{$row['sucursal']},{$row['apellido']},{$row['nombre']},{$row['puesto']},{$row['salario_base']},{$row['bonificaciones']},{$row['deducciones']},{$row['salario_neto']}\n";
    }

    exit();
}

/* =========================
   EXPORTAR PDF (TCPDF SEGURO)
========================= */
if (isset($_GET['export']) && $_GET['export'] === 'pdf' && isset($_GET['sucursal_id'])) {

    require_once __DIR__ . '/vendor/autoload.php';

    $sucursal_id = intval($_GET['sucursal_id']);

    $sql = "
    SELECT 
        s.nombre AS sucursal,
        e.apellido,
        e.nombre,
        p.nombre_puesto AS puesto,
        p.salario_base,
        IFNULL(b.total_bonificaciones,0) AS bonificaciones,
        IFNULL(d.total_deducciones,0) AS deducciones,
        (p.salario_base + IFNULL(b.total_bonificaciones,0) - IFNULL(d.total_deducciones,0)) AS salario_neto
    FROM empleados e
    INNER JOIN puestos p ON p.puesto_id = e.puesto_id
    INNER JOIN sucursales s ON s.id = e.sucursal_id
    LEFT JOIN (
        SELECT n.empleado_id, SUM(b.monto) AS total_bonificaciones
        FROM nominas n
        LEFT JOIN bonificaciones_nomina b ON b.nomina_id = n.id
        GROUP BY n.empleado_id
    ) b ON b.empleado_id = e.id
    LEFT JOIN (
        SELECT n.empleado_id, SUM(d.monto) AS total_deducciones
        FROM nominas n
        LEFT JOIN deducciones_nomina d ON d.nomina_id = n.id
        GROUP BY n.empleado_id
    ) d ON d.empleado_id = e.id
    WHERE e.sucursal_id = ?
    ORDER BY e.apellido, e.nombre
    ";

    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("i", $sucursal_id);
    $stmt->execute();
    $resultado = $stmt->get_result();

    $pdf = new TCPDF('L', 'mm', 'A4', true, 'UTF-8', false);
    $pdf->setPrintHeader(false);
    $pdf->setPrintFooter(false);
    $pdf->SetMargins(10, 15, 10);
    $pdf->AddPage();

    /* ===== TÍTULO ===== */
    $pdf->SetFont('helvetica', 'B', 14);
    $pdf->Cell(0, 10, 'SIGERH - Resumen de Nómina por Sucursal', 0, 1, 'C');
    $pdf->Ln(4);

    /* ===== ENCABEZADOS ===== */
    $pdf->SetFont('helvetica', 'B', 9);
    $pdf->SetFillColor(79,129,189);
    $pdf->SetTextColor(255);

    $pdf->Cell(40, 8, 'Sucursal', 1, 0, 'C', true);
    $pdf->Cell(35, 8, 'Apellido', 1, 0, 'C', true);
    $pdf->Cell(35, 8, 'Nombre', 1, 0, 'C', true);
    $pdf->Cell(45, 8, 'Puesto', 1, 0, 'C', true);
    $pdf->Cell(30, 8, 'Sal. Base', 1, 0, 'C', true);
    $pdf->Cell(30, 8, 'Bonif.', 1, 0, 'C', true);
    $pdf->Cell(30, 8, 'Deduc.', 1, 0, 'C', true);
    $pdf->Cell(30, 8, 'Sal. Neto', 1, 1, 'C', true);

    /* ===== DATOS ===== */
    $pdf->SetFont('helvetica', '', 9);
    $pdf->SetTextColor(0);

    while ($row = $resultado->fetch_assoc()) {
        $pdf->Cell(40, 8, $row['sucursal'], 1);
        $pdf->Cell(35, 8, $row['apellido'], 1);
        $pdf->Cell(35, 8, $row['nombre'], 1);
        $pdf->Cell(45, 8, $row['puesto'], 1);
        $pdf->Cell(30, 8, '$'.number_format($row['salario_base'],2), 1, 0, 'R');
        $pdf->Cell(30, 8, '$'.number_format($row['bonificaciones'],2), 1, 0, 'R');
        $pdf->Cell(30, 8, '$'.number_format($row['deducciones'],2), 1, 0, 'R');
        $pdf->Cell(30, 8, '$'.number_format($row['salario_neto'],2), 1, 1, 'R');
    }

    $pdf->Output('nomina_sucursal.pdf', 'I');
    exit();
}



























































// Forzar UTF-8 para evitar caracteres raros
$conexion->set_charset("utf8");

/* =========================
   Obtener sucursales
   ========================= */
$sucursales = [];
$sucursal_query = $conexion->query("SELECT id, nombre FROM sucursales ORDER BY nombre");
while ($row = $sucursal_query->fetch_assoc()) {
    $sucursales[] = $row;
}

/* =========================
   Filtrar por sucursal si se envía
   ========================= */
$sucursal_id = isset($_GET['sucursal_id']) ? intval($_GET['sucursal_id']) : 0;
$resultado = null;

if ($sucursal_id) {
    /* =========================
       Consulta de nómina
       ========================= */
    $sql = "
    SELECT 
        s.nombre AS sucursal,
        e.apellido,
        e.nombre,
        p.nombre_puesto AS puesto,
        p.salario_base,
        IFNULL(SUM(b.monto), 0) AS bonificaciones,
        IFNULL(SUM(d.monto), 0) AS deducciones,
        (p.salario_base + IFNULL(SUM(b.monto),0) - IFNULL(SUM(d.monto),0)) AS salario_neto
    FROM empleados e
    INNER JOIN puestos p ON p.puesto_id = e.puesto_id
    INNER JOIN sucursales s ON s.id = e.sucursal_id
    LEFT JOIN nominas n ON n.empleado_id = e.id
    LEFT JOIN bonificaciones_nomina b ON b.nomina_id = n.id
    LEFT JOIN deducciones_nomina d ON d.nomina_id = n.id
    WHERE e.sucursal_id = $sucursal_id
    GROUP BY 
        s.nombre, e.apellido, e.nombre, p.nombre_puesto, p.salario_base
    ORDER BY 
        s.nombre, e.apellido
    ";

    $resultado = $conexion->query($sql);
    if (!$resultado) {
        die("Error en la consulta: " . $conexion->error);
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resumen de Nómina - SIGERH</title>
    <link rel="stylesheet" href="css/reportes.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #4F81BD;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .form-reporte {
            margin: 20px 0;
            text-align: center;
        }
        .form-reporte select, .form-reporte button {
            padding: 8px 12px;
            font-size: 16px;
            margin: 0 5px;
        }
        .export-buttons {
            text-align: center;
            margin-top: 10px;
        }
        .export-buttons a {
            display: inline-block;
            margin: 5px;
            padding: 8px 15px;
            background-color: #4F81BD;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .export-buttons a:hover {
            background-color: #3A65A3;
        }
    </style>
</head>
<body>

<header class="header">
    <div>
        <h1>SIGERH</h1>
        <p>Sistema de Gestión de Recursos Humanos</p>
    </div>
    <div class="usuario">
        Bienvenido, <?= htmlspecialchars($nombre_usuario, ENT_QUOTES, 'UTF-8') ?>
    </div>
</header>

<div class="container">
    <h2>Resumen de Nómina por Sucursal</h2>

    <div class="form-reporte">
        <label for="sucursal_select">Sucursal:</label>
        <select id="sucursal_select">
            <option value="0">Seleccione...</option>
            <?php foreach($sucursales as $sucursal): ?>
                <option value="<?= $sucursal['id'] ?>" <?= ($sucursal_id == $sucursal['id']) ? 'selected' : '' ?>>
                    <?= htmlspecialchars($sucursal['nombre'], ENT_QUOTES, 'UTF-8') ?>
                </option>
            <?php endforeach; ?>
        </select>
        <button onclick="consultarNomina()">Consultar</button>
    </div>

    <?php if ($resultado): ?>
        <div class="export-buttons">
            <a href="javascript:void(0)" onclick="exportar('pdf')">📄 Descargar PDF</a>
            <a href="javascript:void(0)" onclick="exportar('excel')">📊 Descargar Excel</a>
        </div>

        <table>
            <tr>
                <th>Sucursal</th>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>Puesto</th>
                <th>Salario Base</th>
                <th>Bonificaciones</th>
                <th>Deducciones</th>
                <th>Salario Neto</th>
            </tr>
            <?php while ($row = $resultado->fetch_assoc()): ?>
                <tr>
                    <td><?= htmlspecialchars($row['sucursal'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['apellido'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['nombre'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td><?= htmlspecialchars($row['puesto'], ENT_QUOTES, 'UTF-8') ?></td>
                    <td>$<?= number_format($row['salario_base'],2) ?></td>
                    <td>$<?= number_format($row['bonificaciones'],2) ?></td>
                    <td>$<?= number_format($row['deducciones'],2) ?></td>
                    <td><b>$<?= number_format($row['salario_neto'],2) ?></b></td>
                </tr>
            <?php endwhile; ?>
        </table>
    <?php endif; ?>

    <button class="reporte-btn regresar" onclick="window.location.href='panel_principal.php'">⬅ Regresar</button>
</div>

<script src="js/reportes.js"></script>
<script>
function consultarNomina() {
    const sucursal = document.getElementById('sucursal_select').value;
    if (sucursal == 0) return; // no hace nada si no se selecciona
    window.location.href = `reporte_nomina_sucursal.php?sucursal_id=${sucursal}`;
}

function exportar(tipo) {
    const sucursal = document.getElementById('sucursal_select').value;
    if (sucursal == 0) return;
    window.location.href = `reporte_nomina_sucursal.php?export=${tipo}&sucursal_id=${sucursal}`;
}
</script>

</body>
</html>
