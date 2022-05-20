<?php
require_once "pdo.php";
session_start()
?>

<!DOCTYPE html>
<html>
<head>
    <title>Profile Database</title>
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
if(isset($_SESSION['error'])){
    echo("<p style='color:red'>".$_SESSION['error']."</p>\n");
    unset($_SESSION['error']);
}
if(isset($_SESSION['success'])){
    echo("<p style='color:green'>".$_SESSION['success']."</p>\n");
    unset($_SESSION['success']);
}
?>
<div class="container">
    <h1>Welcome to Profile Database</h1>
    <?php
    if(isset($_SESSION['username'])){
        echo ("    <p>
        <a href='logout.php'>Logout</a>
    </p>
    <p>
        <a href='add.php'>Add new entry</a>
    </p>");
    }
    else{
        echo("<p><a href='login.php'>Login</a></p>");
    }
    $stmt = $pdo->query("SELECT * FROM Profile");
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if (count($rows) > 0) {
        echo '<table border="1">'."\n";
        echo "<tr><td>";
        echo "Name";
        echo "</td><td>";
        echo "Headline";
        echo "</td>";
        if (isset($_SESSION["user_id"])) {
            echo "<td>Action</td>";
        }
        echo "</tr>\n";
        foreach ($rows as $row) {
            echo "<tr><td>";
            echo
                "<a href='view.php?profile_id=" .
                $row["profile_id"] . "'>" .
                htmlentities($row['first_name'] . " " . $row['last_name']) . "</a>";
            echo("</td><td>");
            echo(htmlentities($row['headline']));
            echo("</td>");
            if (isset($_SESSION["user_id"])) {
                echo
                    '<td><a href="edit.php?profile_id=' .
                    $row['profile_id'] . '">Edit</a> ';
                echo
                    '<a href="delete.php?profile_id=' .
                    $row['profile_id'] . '">Delete </a>';
                echo
                    '<a href="/Chat-using-websocket?username=' .
                    $row['first_name'] .'" >Chat</a></td>';
            }
            echo("</tr>\n");
        }
        echo "</table>";
    }
    if (isset($_SESSION["user_id"])) {
        echo '<p><a href="add.php">Add New Entry</a></p>';
    }
    ?>

</div>
</body>

