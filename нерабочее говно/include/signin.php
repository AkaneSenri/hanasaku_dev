<?php 

session_start();
require_once 'connection.php';

$connect = mysqli_connect($servername, $username, $db_password, $db);
if (!$connect) {
    die("Connect failed " . mysqli_connect_error());
}

$login = $_POST['login'];
$password = $_POST['password'];

$error_field = [];

if ($login === '') {
    $error_field[] = 'login';
}

if ($password === '') {
    $error_field[] = 'password';
}

if (!empty($error_field)) {
    $response = [
        "status" => false,
        "type" => 1,
        "message" => 'Проверьте правильность полей',
        "fields" => $error_field
    ];

    echo json_encode($response);

    die();

}

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

    $response = [
        "status" => true
    ];

    echo json_encode($response);

} else {

    $response = [
        "status" => false,
        "message" => 'Неверный логин или пароль'
    ];

    echo json_encode($response);
}
?>