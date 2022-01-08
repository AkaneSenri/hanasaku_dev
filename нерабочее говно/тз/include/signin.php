<?php 

session_start();
require_once 'connection.php';

$connect = mysqli_connect($servername, $username, $db_password, $db);
if (!$connect) {
    die("Connect failed " . mysqli_connect_error());
}

$login = $_POST['login'];
$password = md5($_POST['password']);

$check_user = mysqli_query($connect, "SELECT * FROM `users` WHERE `login` = '$login' AND `password` = '$password'");
if (mysqli_num_rows($check_user) > 0) {

    $user = mysqli_fetch_assoc($check_user);

    $_SESSION['user'] = [
        "id" => $user ['id'],
        "full_name" => $user['full_name'],
        "avatar" => $user['avatar'],
        "email" => $user['email']
    ];

    header('Location: ../profile.php');

} else {
    $_SESSION['message'] = 'Неверный логин или пароль';
    header('Location: index.php');
}
?>

<pre>
<?php
print_r($check_user);
print_r($user);
?>
</pre>