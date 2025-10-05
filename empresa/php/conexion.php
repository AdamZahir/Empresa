<?php
$servername = "fdb1034.awardspace.net";
$username = "4667282_votacionespagina";
$password = "tn9mDRYxtEeSKG!";
$dbname = "4667282_votacionespagina";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
