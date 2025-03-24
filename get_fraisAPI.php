<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bisounours";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $stmt = $conn->prepare("SELECT id_fiche, id_user, date, commentaire, status, etat FROM fiche ORDER BY date DESC");
    $stmt->execute();
    $result = $stmt->get_result();

    $fiches = [];
    while ($row = $result->fetch_assoc()) {
        $fiches[] = $row;
    }

    echo json_encode(["success" => true, "fiches" => $fiches]);
}
$conn->close();
?>
