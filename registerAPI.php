<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");


$servername = "localhost";
$username = "root"; 
$password = "";
$dbname = "bisounours"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $role = "visiteur"; // Par défaut

    $checkUser = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $checkUser->bind_param("s", $email);
    $checkUser->execute();
    $checkUser->store_result();

    if ($checkUser->num_rows > 0) {
        echo json_encode(["success" => false, "message" => "Cet email est déjà utilisé."]);
    } else {
        $stmt = $conn->prepare("INSERT INTO users (email, password, role) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $email, $password, $role);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Inscription réussie !"]);
        } else {
            echo json_encode(["success" => false, "message" => "Erreur lors de l'inscription."]);
        }
    }
}
$conn->close();
?>
