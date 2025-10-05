<?php
include 'conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $dni = $_POST['dni'];
    $fecha_na = $_POST['fecha_na'];
    $tfno = $_POST['tfno'];

    $sql = "INSERT INTO cliente (dni, nombre, fecha_na, tfno) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isss", $dni, $nombre, $fecha_na, $tfno);

    if ($stmt->execute()) {
       
        header("Location: carrito.php?dni=".$dni);
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
        
        <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/empresa/estilo.css">
    <title>Registro Cliente</title>
</head>
        
  
<body>
<div class="container">
    <h1>Bienvenido/a, Cliente </h1>
        <h3> Registre sus datos para continuar con su compra. </h3>
    <form method="post" action="">
        <label>Nombre Completo:</label>
        <input type="text" name="nombre" required>

        <label>DNI:</label>
        <input type="number" name="dni" required>

        <label>Fecha de Nacimiento:</label>
        <input type="date" name="fecha_na" required>

        <label>Teléfono:</label>
        <input type="text" name="tfno" maxlength="10" required>

        <input type="submit" value="Guardar">
    </form>
</div>
</body>
</html>
