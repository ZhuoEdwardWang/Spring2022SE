<?php
require_once "pdo.php";
require_once "validate_util.php";
session_start();


if (!isset($_SESSION["user_id"])) {
    die("ACCESS DENIED");
}

if (isset($_POST["cancel"])) {
    header("Location: index.php");
    die();
}

if (isset($_POST["save"])) {
    $position_validate = validatePos();
    $education_validate = validateEdu();

    if ($position_validate !== true) {
        $_SESSION["error"] = $position_validate;
        header("Location: edit.php?profile_id=" . $_POST["profile_id"]);
        die();
    }

    if ($education_validate !== true) {
        $_SESSION["error"] = $education_validate;
        header("Location: add.php");
        die();
    }

    if (strlen($_POST["first_name"]) < 1
        || strlen($_POST["last_name"]) < 1
        || strlen($_POST["email"]) < 1
        || strlen($_POST["headline"]) < 1
        || strlen($_POST["summary"]) < 1
    ) {
        $_SESSION["error"] = "All fields are required";
        header("Location: edit.php?profile_id=" . $_POST["profile_id"]);
        die();
    }

    if (strpos($_POST["email"], "@") === false) {
        $_SESSION["error"] = "Email address must contain @";
        header("Location: edit.php?profile_id=" . $_POST["profile_id"]);
        die();
    }
    $sql
        = "UPDATE profile
        SET
        first_name = :fn,
        last_name = :ln,
        email = :em,
        headline = :he,
        summary = :su
        WHERE
        profile_id = :profile_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(
        array(
            ':profile_id' => $_POST['profile_id'],
            ':fn' => $_POST['first_name'],
            ':ln' => $_POST['last_name'],
            ':em' => $_POST['email'],
            ':he' => $_POST['headline'],
            ':su' => $_POST['summary'])
    );

    $stmt = $pdo->prepare('DELETE FROM position WHERE profile_id=:pid');
    $stmt->execute(array(':pid' => $_REQUEST['profile_id']));

    $rank = 1;
    for ($i = 1; $i <= 9; $i++) {
        if (!isset($_POST['year' . $i])) {
            continue;
        }
        if (!isset($_POST['desc' . $i])) {
            continue;
        }

        $year = $_POST["year" . $i];
        $desc = $_POST["desc" . $i];
        $stmt = $pdo->prepare(
            'INSERT INTO position (profile_id, rank, year, description)
            VALUES ( :pid, :rank, :year, :desc)'
        );
        $stmt->execute(
            array(
                ':pid' => $_REQUEST["profile_id"],
                ':rank' => $rank,
                ':year' => $year,
                ':desc' => $desc)
        );
        $rank++;
    }

    $stmt = $pdo->prepare('DELETE FROM education WHERE profile_id=:pid');
    $stmt->execute(array(':pid' => $_REQUEST['profile_id']));

    $rank = 1;
    for ($i = 1; $i <= 9; $i++) {
        if (!isset($_POST['edu_year' . $i])) {
            continue;
        }
        if (!isset($_POST['edu_school' . $i])) {
            continue;
        }
        $year = $_POST["edu_year" . $i];
        $stmt = $pdo->prepare(
            "SELECT institution_id
            FROM institution
            WHERE username = :edu_school"
        );
        $stmt->execute(array(':edu_school' => $_POST["edu_school" . $i]));
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row !== false) {
            $instid = $row["institution_id"];
        } else {
            $stmt = $pdo->prepare(
                "INSERT INTO institution (username)
                VALUES (:school_name)"
            );
            $stmt->execute(array(':school_name' => $_POST["edu_school" . $i]));
            $instid = $pdo->lastInsertId();
        }

        $stmt = $pdo->prepare(
            'INSERT INTO education (profile_id, institution_id, rank, year)
            VALUES (:pid, :instid, :rank, :year)'
        );
        $stmt->execute(
            array(
                ':pid' => $_REQUEST["profile_id"],
                ':rank' => $rank,
                ':year' => $year,
                ':instid' => $instid)
        );
        $rank++;
    }

    $_SESSION["success"] = "Profile updated";
    header("Location: index.php");
    die();
}

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
$profile_id = $_GET["profile_id"];

$sql = "SELECT * FROM position WHERE profile_id = :profile_id";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(":profile_id" => $_GET['profile_id']));
$position_rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT * FROM education WHERE profile_id = :profile_id";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(":profile_id" => $_GET['profile_id']));
$education_rows = $stmt->fetchAll(PDO::FETCH_ASSOC);


?>


<?php
$stmt = $pdo->prepare("SELECT profile_id, user_id FROM Profile where user_id = :xyz and profile_id = :abc");
$stmt->execute(array(":xyz" => $_SESSION['user_id'], ":abc" => $_GET['profile_id']));
$row = $stmt->fetch(PDO::FETCH_ASSOC);
if ($row === false) {
    $_SESSION['error'] = 'Bad value for user_id';
    header('Location: index.php');
    return;
}
?>


<html>
<head>
    <title>Edit profile</title>
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
<body">
<h1>Editing Profile for <?php echo htmlentities($_SESSION["username"]) ?></h1>
<?php
if (isset($_SESSION["error"])) {
    echo('<p style="color: red;">' . $_SESSION["error"]);
    unset($_SESSION["error"]);
}
?>
<form method="post">
    <label>First Name:</label>
    <input type="text" username="first_name" value="<?php echo $fn ?>">
    <br>
    <label>Last Name:</label>
    <input type="text" username="last_name" value="<?php echo $ln ?>">
    <br>
    <label>Email:</label>
    <input type="text" username="email" value="<?php echo $em ?>">
    <br>
    <label>Headline:</label>
    <br>
    <input type="text" username="headline" value="<?php echo $he ?>">
    <br>
    <label>Summary:</label>
    <br>
    <textarea
            username="summary"
            cols="90"
            rows="20"
            style="resize: none;"
    >
            <?php echo $su ?>
        </textarea>
    <br>
    <label>Education:</label>
    <input type="button" value="+" id="plus_education" class="plus_button">
    <br>
    <?php
    if ($education_rows !== false) {
        echo '<div id="edu_fields">' . "\n";
    }
    foreach ($education_rows as $row) {
        $stmt = $pdo->prepare(
            "SELECT username
                FROM institution
                WHERE institution_id = :instid"
        );
        $stmt->execute(array(":instid" => $row['institution_id']));
        $institution = $stmt->fetch(PDO::FETCH_ASSOC);
        $rank = $row["rank"];

        echo '<div id="edu' . $rank . '">' . "\n";
        echo
            '<p>Year: <input type="text" username="edu_year' .
            $rank .'" value="' . $row["year"] . '">' . "\n";
        echo
            '<input type="button" value="-" onclick="$(\'#edu' .
            $rank . '\').remove(); fix_education(); return false;">' .
            "\n" . '</p>';
        echo
            '<p>School: <input type="text" size="80" value="' .
            $institution["username"] . '" username="edu_school' .
            $rank . '" class="school" autocomplete="off"/></p>' . "\n";
        echo '</div>' . "\n";
    }
    echo '</div>';
    ?>
    <label>Position:</label>
    <input type="button" value="+" id="plus_button">
    <br>
    <?php
    if ($position_rows !== false) {
        echo '<div id="position_fields">' . "\n";
    }
    foreach ($position_rows as $row) {
        $rank = $row["rank"];
        echo '<div id="position' . $rank . '">' . "\n";
        echo
            '<p>Year: <input type="text" username="year' .
            $rank .'" value="' . $row["year"] . '">' . "\n";
        echo
            '<input type="button" value="-" onclick="$(\'#position' .
            $rank . '\').remove(); fix_position(); return false;">' .
            "\n" . '</p>';
        echo
            '<textarea username="desc' . $rank . '" rows="8" cols="80">' .
            $row["description"] . '</textarea>' . "\n";
        echo '</div>' . "\n";
    }
    echo '</div>';
    ?>
    <input type="hidden" username="profile_id" value="<?php echo $profile_id ?>">
    <input type="submit" username="save" value="Save">
    <input type="submit" username="cancel" value="Cancel">
</form>
<script type="text/javascript" src="position.js"></script>
</body>
<!--reference:https://github.com/alipadron/res-education/blob/c5de6cb0ae2dbf25d35164d185a86cc951951b9d/edit.php-->
</html>