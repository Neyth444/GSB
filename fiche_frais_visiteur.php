<?php
session_start();
if (!isset($_SESSION['id_role'], $_SESSION['id_user']) || $_SESSION['id_role'] != 1) {
    header("Location: login.php");
    exit();
}

// Connexion à la base de données
$serveur = "localhost";
$utilisateur = "root";
$mdpBDD = "";
$nomBDD = "bisounours";

try {
    $connexion = new PDO("mysql:host=$serveur;dbname=$nomBDD;charset=utf8", $utilisateur, $mdpBDD);
    $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Récupérer les fiches de frais avec leur état
    $stmt = $connexion->prepare("
        SELECT f.id_fiche, f.date, f.commentaire, f.etat AS etat_fiche, 
               SUM(l.quantite * l.prix_unitaire) AS total_frais
        FROM fiche f
        LEFT JOIN ligne_frais l ON f.id_fiche = l.id_fiche
        WHERE f.id_user = :id_user
        GROUP BY f.id_fiche
        ORDER BY f.date DESC
    ");
    $stmt->bindParam(':id_user', $_SESSION['id_user']);
    $stmt->execute();
    $fiches = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die("Erreur : " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiches de frais</title>
    <style>
        body {
            background-color: #f0f8ff; 
            font-family: Arial, sans-serif;
            margin: 0;
        }

        .navbar {
            background-color: #007bff; 
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar-logo img {
            height: 50px;
        }

        .navbar-buttons a {
            text-decoration: none;
            color: white;
            margin: 0 10px;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: transparent;
            border: 2px solid white;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        .navbar-buttons a:hover {
            background-color: white;
            color: #007bff;
        }

        .content {
            padding: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        .button-view {
            padding: 5px 10px;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }
        .button-view:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-logo">
            <img src="img/gsb.png" alt="Logo GSB">
        </div>
        <div class="navbar-buttons">
            <a href="accueil_visiteur.php">Accueil</a>
            <a href="deconnexion.php">Déconnexion</a>
        </div>
        <div class="navbar-user">
            Connecté en tant que : <?php echo $_SESSION['role']; ?>
        </div>
    </div>

    <div class="content">
        <h1>Mes fiches de frais</h1>

        <?php if (count($fiches) > 0): ?>
            <table>
                <thead>
                    <tr>
                        <th>Numéro Fiche</th>
                        <th>Date</th>
                        <th>Commentaire</th>
                        <th>Total Frais</th>
                        <th>État Fiche</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($fiches as $fiche): ?>
                        <tr>
                            <td><?php echo $fiche['id_fiche']; ?></td>
                            <td><?php echo htmlspecialchars($fiche['date']); ?></td>
                            <td><?php echo htmlspecialchars($fiche['commentaire']); ?></td>
                            <td><?php echo number_format($fiche['total_frais'], 2, ',', ' '); ?> €</td>
                            <td>
                                <?php 
                                    if ($fiche['etat_fiche'] === 'Validée') {
                                        echo '<span style="color: green;">Validée</span>';
                                    } elseif ($fiche['etat_fiche'] === 'Refusée') {
                                        echo '<span style="color: red;">Refusée</span>';
                                    } else {
                                        echo '<span style="color: orange;">En attente</span>';
                                    }
                                ?>
                            </td>
                            <td>
                                <a href="voir_fiche.php?id_fiche=<?php echo $fiche['id_fiche']; ?>" class="button-view">Voir la fiche</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>Aucune fiche de frais enregistrée.</p>
        <?php endif; ?>
    </div>
</body>
</html>
