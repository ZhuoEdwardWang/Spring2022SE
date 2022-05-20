<?php
require_once "pdo.php";
session_start();
if (!isset($_SESSION["user_id"])) {
    die("ACCESS DENIED");
}

header('Content-Type: application/json;');
$stmt = $pdo->prepare('SELECT username FROM Institution WHERE username LIKE :prefix');
$stmt->execute(array( ':prefix' => $_REQUEST['term'] . "%"));
$retvalue = array();
while ( $row = $stmt->fetch(PDO::FETCH_ASSOC) ) {
    $retvalue[] = $row['username'];
}

echo json_encode($retvalue);
?>
