<?php
$host    = 'db_stage'; 
$db_name = 'service_desk_db'; // Ta nouvelle base
$user    = 'root';
$pass    = 'secure_stage_2026';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db_name;charset=utf8", $user, $pass);
    
    echo "<h1>🛠️ Service-Desk Cloud : Dashboard</h1>";

    // On appelle la VUE au lieu de faire un SELECT complexe
   $query = $pdo->query("SELECT * FROM vue_details_tickets");
    $tickets = $query->fetchAll(PDO::FETCH_ASSOC);

    if ($tickets) {
        echo "<table border='1' style='width:100%; border-collapse: collapse;'>
                <tr style='background: #eee;'>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>Statut</th>
                    <th>Demandeur</th>
                    <th>Catégorie</th>
                </tr>";
        foreach ($tickets as $t) {
            echo "<tr>
                    <td>{$t['ticket_id']}</td>
                    <td>{$t['titre']}</td>
                    <td><strong>{$t['statut']}</strong></td>
                    <td>{$t['demandeur']}</td>
                    <td>{$t['categorie']}</td>
                  </tr>";
        }
        echo "</table>";
    }

} catch (Exception $e) {
    echo "Erreur de connexion : " . $e->getMessage();
}
?>