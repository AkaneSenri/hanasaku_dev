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
    <title>Регистрация</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

    <!-- Форма регистрации -->
    <form action="include/signup.php" method="post" enctype="multipart/form-data">
        <label>Ваше ФИО</label>
        <input type="text" name="full_name" placeholder="Введите Ваше полное имя">
        <label>Логин</label>
        <input type="text" name="login" placeholder="Введите Ваш логин">
        <label>Почта</label>
        <input type="email" name="email" placeholder="Введите Вашу электронную почту">
        <label>Ваше изображение профиля</label>
        <input type="file" name="avatar">
        <label>Пароль</label>
        <input type="password" name="password" placeholder="Введите пароль">
        <label>Подтверждение пароля</label>
        <input type="password" name="confirm_password" placeholder="Подтвердите Ваш пароль">
        <input type="submit" class="btn btn-dark" value="Зарегистрироваться">
        <p class="lead">
            У Вас уже есть аккаунт? - <a class="text-my-own-color" href="index.php">Авторизуйтесь!</a>
        </p>
        <?php
            if ($_SESSION['message']) {
                echo '
                <p class="msg"> ' .$_SESSION['message'] . '</p>';
            }
            unset($_SESSION['message']);
        ?>
    </form>
</body>
</html>