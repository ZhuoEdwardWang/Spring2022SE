<?php
session_start();
require_once('pdo.php');
if (!isset($_SESSION['username'])) {
    die('Not logged in');
}
?>
<html>
<head>
</head>
<body>
<?php
if (isset($_SESSION['username'])) {
    echo "<h1>Deleting Profile for ";
    echo htmlentities($_SESSION['username']);
    echo "</h1>\n";
}

?>

<?php
if ( isset($_POST['delete']) && $_POST['profile_id']) {
    $sql = "DELETE FROM Profile WHERE profile_id = :zip";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(':zip' => $_POST['profile_id']));
    $_SESSION['success'] = 'Record deleted';
    header( 'Location: index.php' ) ;
    return;
}
$stmt = $pdo->prepare("SELECT profile_id, user_id FROM Profile where user_id = :xyz and profile_id = :abc");
$stmt->execute(array(":xyz" => $_SESSION['user_id'], ":abc" => $_GET['profile_id']));
$row = $stmt->fetch(PDO::FETCH_ASSOC);
if ( $row === false ) {
    $_SESSION['error'] = 'Bad value for profile_id';
    header( 'Location: index.php' ) ;
    return;
}
?>
<p>Confirm: Deleting Profile<?= htmlentities($row['profile_id']) ?></p>
<form method="post"><input type="hidden"
                           username="profile_id" value="<?= $row['profile_id'] ?>">
    <input type="submit" value="Delete" username="delete">
    <a href="index.php">Cancel</a>
</form>
<?php
if (isset($_SESSION['error'])) {
echo("<p style='color:red'>" . $_SESSION['error'] . "</p>\n");
unset($_SESSION['error']);
}
if (isset($_SESSION['success'])) {
    echo("<p style='color:green'>" . $_SESSION['success'] . "</p>\n");
    unset($_SESSION['success']);
}
?>

</body>
</html>