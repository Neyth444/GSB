<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");


$response = [
    "success" => true,
    "message" => "L'API fonctionne correctement avec GSB !"
];

echo json_encode($response);
?>
