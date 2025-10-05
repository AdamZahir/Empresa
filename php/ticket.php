<?php
include 'conexion.php';

$total = 0;
$productosSeleccionados = [];
$dni_cliente = $_POST['dni_cliente'];

if (!empty($_POST['productos'])) {
    $ids = $_POST['productos'];
    $placeholders = implode(',', array_fill(0, count($ids), '?'));

    $tipos = str_repeat('i', count($ids));
    $stmt = $conn->prepare("SELECT codigo, nombre, precio FROM producto WHERE codigo IN ($placeholders)");
    $stmt->bind_param($tipos, ...$ids);
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $productosSeleccionados[] = $row;
        $total += $row['precio'];

        // Guardar en tabla compras
        $stmt2 = $conn->prepare("INSERT INTO compras (dni_cliente, codigo_producto) VALUES (?, ?)");
        $stmt2->bind_param("ii", $dni_cliente, $row['codigo']);
        $stmt2->execute();
        $stmt2->close();
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ticket de Compra</title>
    <link rel="stylesheet" href="estiloticket.css">
</head>
<body>
    <div class="contenedor">
        <h1>🧾 Ticket de Compra</h1>

        <?php if (!empty($productosSeleccionados)): ?>
            <table>
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
                <?php foreach ($productosSeleccionados as $p): ?>
                    <tr>
                        <td><?= htmlspecialchars($p['nombre']) ?></td>
                        <td>$<?= number_format($p['precio'],2) ?></td>
                    </tr>
                <?php endforeach; ?>
                <tr class="fila-total">
                    <td><strong>Total</strong></td>
                    <td><strong>$<?= number_format($total,2) ?></strong></td>
                </tr>
            </table>
        <?php else: ?>
            <p class="mensaje-error">❌ No seleccionaste ningún producto</p>
        <?php endif; ?>

        <form action="guardaclientes.php" method="get">
            <button type="submit" class="boton-nueva-compra">Realizar otra compra</button>
        </form>
    </div>
</body>
</html>

<?php $conn->close(); ?>
