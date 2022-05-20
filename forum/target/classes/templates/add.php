<?php
session_start();
require_once('pdo.php');
require_once ('validate_util.php');
if (!isset($_SESSION["user_id"])) {
    die("ACCESS DENIED");
}

if (isset($_POST["cancel"])) {
    header("Location: index.php");
    die();
}

if (isset($_POST["add"])) {
    $position_validate = validatePos();
    $education_validate = validateEdu();
    if ($position_validate !== true) {
        $_SESSION["error"] = $position_validate;
        header("Location: add.php");
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
        header("Location: add.php");
        die();
    }

    if (strpos($_POST["email"], "@") === false) {
        $_SESSION["error"] = "Email address must contain @";
        header("Location: add.php");
        die();
    }
    $stmt = $pdo->prepare(
        'INSERT INTO profile
        (user_id, first_name, last_name, email, headline, summary)
        VALUES ( :uid, :fn, :ln, :em, :he, :su)'
    );

    $stmt->execute(
        array(
            ':uid' => $_SESSION['user_id'],
            ':fn' => $_POST['first_name'],
            ':ln' => $_POST['last_name'],
            ':em' => $_POST['email'],
            ':he' => $_POST['headline'],
            ':su' => $_POST['summary'])
    );

    $profile_id = $pdo->lastInsertId();
    $rank = 1;
    for ($i = 1; $i <= 9; $i++) {
        if (! isset($_POST['year'.$i]) ) {
            continue;
        }
        if (! isset($_POST['desc'.$i]) ) {
            continue;
        }
        $year = $_POST["year" . $i];
        $desc = $_POST["desc" . $i];
        $stmt = $pdo->prepare(
            'INSERT INTO position
            (profile_id, rank, year, description)
            VALUES ( :pid, :rank, :year, :desc)'
        );
        $stmt->execute(
            array(
                ':pid' => $profile_id,
                ':rank' => $rank,
                ':year' => $year,
                ':desc' => $desc)
        );
        $rank++;
    }

    $rank = 1;
    for ($i = 1; $i < 10; $i++) {
        if (! isset($_POST['edu_year'.$i]) ) {
            continue;
        }
        if (! isset($_POST['edu_school'.$i]) ) {
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
                "INSERT INTO institution
                (username)
                VALUES (:school_name)"
            );
            $stmt->execute(array(':school_name' => $_POST["edu_school" . $i]));
            $instid = $pdo->lastInsertId();
        }

        $stmt = $pdo->prepare(
            'INSERT INTO education
            (profile_id, institution_id, rank, year)
            VALUES (:pid, :instid, :rank, :year)'
        );
        $stmt->execute(
            array(
                ':pid' => $profile_id,
                ':rank' => $rank,
                ':year' => $year,
                ':instid' => $instid)
        );
        $rank++;
    }

    $_SESSION["success"] = "Profile added";
    header("Location: index.php");
    die();
}
?>

<html>
<head>
    <title>Add a profile</title>
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

<?php
if (isset($_SESSION['username'])) {
    echo "<h1>Adding Profile for ";
    echo htmlentities($_SESSION['username']);
    echo "</h1>\n";
}

?>
<script>
    function doValidate() { console.log('Validating...');
        try {
            Fname = document.getElementById('id_1000').value;
            console.log("Validating FirstName=" + Fname);
            if (Fname == null || Fname == "") {
                alert("Field Firstname is left empty!");
                return false;
            }

            Lname = document.getElementById('id_1001').value;
            console.log("Validating LastName=" + Lname);
            if (Lname == null || Lname == "") {
                alert("Field Lastname is left empty!");
                return false;
            }

            email = document.getElementById('id_1002').value;
            console.log("Validating account=" + email);
            if (email == null || email == "" || !email.includes("@")) {
                alert("Invalid Email");
                return false;
            }

            headline = document.getElementById('id_1003').value;
            console.log("Validating headline=" + headline);
            if (headline == null || headline == "") {
                alert("Field Headline is left empty!");
                return false;
            }
            summary = document.getElementById('id_1004').value;
            console.log("Validating Summary=" + summary);
            if (summary == null || summary == "") {
                alert("Field summary is left empty!");
                return false;
            }
            return true;
        } catch (e) {
            return false;
        }
        return false;
    }
</script>
<form method="post">
    <label>First Name:</label>
    <input type="text" username="first_name">
    <br>
    <label>Last Name:</label>
    <input type="text" username="last_name">
    <br>
    <label>Email:</label>
    <input type="text" username="email">
    <br>
    <label>Headline:</label>
    <br>
    <input type="text" username="headline">
    <br>
    <label>Summary:</label>
    <br>
    <textarea
            username="summary"
            cols="100"
            rows="20"
            style="resize: none;">
        </textarea>
    <br>
    <label>Education:</label>
    <input type="button" value="+" id="plus_education" class="plus_button">
    <br>
    <div id="edu_fields"></div>
    <label>Position:</label>
    <input type="button" value="+" id="plus_position" class="plus_button">
    <br>
    <div id="position_fields"></div>
    <input type="submit" username="add" value="Add">
    <input type="submit" username="cancel" value="Cancel">
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
<script type="text/javascript" src="position.js"></script>
</body>
</html>