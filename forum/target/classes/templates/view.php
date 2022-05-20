<?php
require_once "pdo.php";
session_start();

if (!isset($_GET['profile_id'])) {
    $_SESSION['error'] = "Missing profile_id";
    header("Location: index.php");
    die();
}

$sql = "SELECT * FROM profile WHERE profile_id = :profile_id";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(":profile_id" => $_GET['profile_id']));
$row = $stmt->fetch(PDO::FETCH_ASSOC);

if ($row === false) {
    $_SESSION['error'] = 'Bad value for profile_id';
    header('Location: index.php');
    die();
}

$fn = htmlentities($row["first_name"]);
$ln = htmlentities($row["last_name"]);
$em = htmlentities($row["email"]);
$he = htmlentities($row["headline"]);
$su = htmlentities($row["summary"]);

$sql = "SELECT * FROM position WHERE profile_id = :profile_id";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(":profile_id" => $_GET['profile_id']));
$position_rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT * FROM education WHERE profile_id = :profile_id";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(":profile_id" => $_GET['profile_id']));
$education_rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Profile View</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css">
    <script
            src="https://code.jquery.com/jquery-3.2.1.js"
            integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
    <script
            src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
            integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
</head>
<body>
<h1>Profile information</h1>
<p>First Name: <?php echo $fn ?></p>
<p>Last Name: <?php echo $ln ?></p>
<p>Email: <?php echo $em ?></p>
<p>
    Headline:
    <br>
    <?php echo $he ?>
</p>
<p>
    Summary:
    <br>
    <?php echo $su ?>
</p>
<?php
if ($education_rows !== false) {
    echo '<p>Education' . "\n" . '<ul>' . "\n";
}
foreach ($education_rows as $row) {
    $stmt = $pdo->prepare("SELECT username FROM institution WHERE institution_id = :instid");
    $stmt->execute(array(":instid" => $row['institution_id']));
    echo
        '<li>' . $row["year"] . ': ' .
        $stmt->fetch(PDO::FETCH_ASSOC)["username"] . '</li>' . "\n";
}
echo '</ul>' . "\n" . '</p>';

if ($position_rows !== false) {
    echo '<p>Position' . "\n" . '<ul>' . "\n";
}
foreach ($position_rows as $row) {
    echo '<li>' . $row["year"] . ': ' . $row["description"] . '</li>' . "\n";
}
echo '</ul>' . "\n" . '</p>';
?>
<a href="index.php">Done</a>
</body>
<!--reference https://github.com/alipadron/res-education/blob/c5de6cb0ae2dbf25d35164d185a86cc951951b9d/view.php-->
</html>