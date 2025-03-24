<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("localhost", "root", "", "bisounours");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_user = $_POST['id_user'];
    $date = $_POST['date'];
    $commentaire = $_POST['commentaire'];

    $stmt = $conn->prepare("INSERT INTO fiche_frais (id_user, date, commentaire, status, etat) VALUES (?, ?, ?, 'En attente', 'Non traité')");
    $stmt->bind_param("iss", $id_user, $date, $commentaire);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Fiche ajoutée"]);
    } else {
        echo json_encode(["success" => false, "message" => "Erreur serveur"]);
    }
    $stmt->close();
}
$conn->close();
?>
