<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$email = isset($_GET['email']) ? $_GET['email'] : '';
$valid = filter_var($email, FILTER_VALIDATE_EMAIL) !== false;

echo json_encode(["valid" => $valid]);
?>