<?php
include 'conexion.php';

$dni_cliente = isset($_GET['dni']) ? intval($_GET['dni']) : 0;

// Obtener proveedores con productos
$proveedores = $conn->query("SELECT * FROM proveedor");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="estilocarrito.css">
</head>
<body>

    <header>
        <form action="guardaclientes.php" method="get" class="contenedor-regresar">
            <button type="submit" class="boton-regresar">⬅️ Regresar</button>
        </form>
        <h1>Carrito de Compras</h1>
    </header>

    <main>
        <form method="post" action="ticket.php" class="contenedor-carrito">
            <?php while($prov = $proveedores->fetch_assoc()): ?>
                <div class="tarjeta-proveedor">
                    <h3><?= htmlspecialchars($prov['nombre']) ?></h3>

                    <?php
                    $productos = $conn->query("SELECT * FROM producto WHERE nif_proveedor = ".$prov['nif']);
                    while($prod = $productos->fetch_assoc()):
                    ?>
                        <label>
                            <input type="checkbox" name="productos[]" value="<?= $prod['codigo'] ?>">
                            <?= htmlspecialchars($prod['nombre']) ?> - $<?= number_format($prod['precio'],2) ?>
                        </label>
                    <?php endwhile; ?>
                </div>
            <?php endwhile; ?>

            <input type="hidden" name="dni_cliente" value="<?= $dni_cliente ?>">

            <div class="contenedor-boton-procesar">
                <input type="submit" value="Procesar Compra" class="boton-procesar">
            </div>
        </form>
    </main>

</body>
</html>

<?php $conn->close(); ?>
