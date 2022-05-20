<script>
    function doValidate() { console.log('Validating...');
        try {
            acc = document.getElementById('id_1700').value;
            console.log("Validating account=" + acc);
            if (acc == null || acc == "" || !acc.includes("@")) {
                alert("Invalid Email");
                return false;
            }
            pw = document.getElementById('id_1723').value;
            console.log("Validating pw=" + pw);
            if (pw == null || pw == "") {
                alert("Both fields must be filled out");
                return false;
            }
            return true;
        } catch (e) {
            return false;
        }
        return false;
    }
</script>

<?php
require_once "pdo.php";
$salt = "XyZzy12*_";
    session_start();
    if (isset($_POST["account"]) && (isset($_POST["password"]))){
        unset($_SESSION["account"]);
        if ($_POST['password'] == ''){
            echo("Please enter the password");
        }
        $check = hash('md5', $salt.$_POST['password']);
        echo ($check);
        $stmt = $pdo->prepare('SELECT user_id, username FROM users
WHERE email = :em AND password = :pw');
        $stmt->execute(array( ':em' => $_POST['account'], ':pw' => $check));
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ( $row !== false ) {
            $_SESSION['username'] = $row['username']; $_SESSION['user_id'] = $row['user_id']; // Redirect the browser to index.php header("Location: index.php");
            header('Location: index.php');
            return;
        }
        else{
            $_SESSION["error"] = "Incorrect password.";
            header( 'Location: login.php' ) ;
            return;
        }
    }
?>
<html>
<head>
</head>
<body style="font-family: sans-serif;">
<h1>Please Log In</h1>
<?php
if ( isset($_SESSION["error"]) ) {
    echo('<p style="color:red">'.$_SESSION["error"]."</p>\n");
    unset($_SESSION["error"]);
}
?>

<form method="post">
    <p>Account: <input type="text" username="account" id="id_1700"value=""></p>
    <p>Password: <input type="text" username="password" id="id_1723" value=""></p>
    <!-- password is umsi -->
    <p><input type="submit"  onclick="return doValidate();" value="Log In">
        <input type="button" onclick="location.href=('index.php')" value="Cancel" ></p>
</form>
</body>
</html>