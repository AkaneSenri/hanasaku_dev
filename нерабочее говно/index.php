<?php
session_start();

if ($_SESSION['user']) {
    header('Location: profile.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторизация</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

    <!-- Форма авторизации -->
    <form>
        <label>Логин</label>
        <input type="text" name="login" placeholder="Введите свой логин">
        <label>Пароль</label>
        <input type="password" name="password" placeholder="Введите пароль">
        <small id="passHelp" class="form-text text-muted">Пароль должен состоять не менее чем из 6 символов</small>
        <input type="submit" class="login-btn btn-dark" value="Войти">
        <p class="lead">
            У Вас нет существующего аккаунта? - <a class="text-my-own-color" href="register.php">Зарегистрируйтесь!</a>
        </p>
        <p class="msg none">Lorem ipsum dolor sit amet.</p>
    </form>

        <script src="/js/jquery-3.4.1.min.js"></script>
        <script src="/js/main.js"></script>

</body>
</html>