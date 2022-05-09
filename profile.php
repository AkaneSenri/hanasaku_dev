<?php
require_once('connect.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {    
    $user_id = $_REQUEST['user_data']['user_id']; 
    $userlogin = $_REQUEST['user_data']['userlogin'];
    $firstname = $_REQUEST['user_data']['firstname'];
    $lastname = $_REQUEST['user_data']['lastname'];
    $post = $_REQUEST['user_data']['post'];
    $email = $_REQUEST['user_data']['email'];

    if (empty($user_id)) {
        $sql = "INSERT INTO `staff` 
            (`userlogin`, `firstname`, `lastname`, `post`, `email`)
            VALUES ('$userlogin','$firstname', '$lastname', '$email')";

        if (mysqli_query($connect, $sql)) {
            echo "Данные добавлены";
        } else {
            echo "Error: " . $sql . ":-" . mysqli_error($connect);
        }
    } else {
        $sql = "UPDATE staff SET 
            userlogin='$userlogin', 
            firstname='$firstname', 
            lastname='$lastname',
            post='$post',
            email = '$email'
            WHERE user_id=$user_id";

        if (mysqli_query($connect, $sql)) {
            echo "Данные обновлены!";
        } else {
            echo "Error: " . $sql . ":-" . mysqli_error($connect);
        }
    }
}


if ($mode == 'manage') {
    $profiles = mysqli_query($connect, "SELECT * FROM staff"); 
    $statuses = mysqli_query($connect, "SELECT * FROM statuses"); 

    $smarty->assign('statuses', $statuses); 
    $smarty->assign('profiles', $profiles); 
    $smarty->display('design/profiles/manage.tpl'); 
}

if ($mode == 'view') {
    $user_id = $_REQUEST['user_id'];

    $user = mysqli_query($connect, "SELECT * FROM staff WHERE user_id = $user_id");
    if (!empty($user)) {
        $works = mysqli_query($connect, "SELECT * FROM task WHERE developer = $user_id"); 
        $tested = mysqli_query($connect, "SELECT * FROM task WHERE tester = $user_id AND status = 'C'"); 
        $time = mysqli_query($connect, "SELECT SUM(time) FROM task WHERE developer = $user_id AND status = 'C'");
        $clock = mysqli_fetch_assoc($time);
        $result = array_values($clock);
        $statuses = mysqli_query($connect, "SELECT * FROM statuses"); 
        $ranks = mysqli_query($connect, "SELECT * FROM ranks WHERE `lang_code` = '".$lang."'");
        $price = mysqli_query($connect, "SELECT price FROM settings");
        $wallet = mysqli_fetch_assoc($price);
        $final_price = array_values($wallet);
        $paycheck = $final_price[0] * $result[0];

        $smarty->assign('works', $works);
        $smarty->assign('tested', $tested);
        $smarty->assign('result',$result);
        $smarty->assign('final_price', $final_price);
        $smarty->assign('paycheck',$paycheck);
        $smarty->assign('user', mysqli_fetch_assoc($user)); 
    }
    
    $smarty->display('design/profiles/view.tpl'); 
}

if ($mode == 'edit') {
    $user_id = $_REQUEST['user_id'];

    $user = mysqli_query($connect, "SELECT * FROM staff WHERE user_id = $user_id");
    if (!empty($user)) {
        $works = mysqli_query($connect, "SELECT * FROM task WHERE developer = $user_id"); 
        $tested = mysqli_query($connect, "SELECT * FROM task WHERE tester = $user_id AND status = 'C'"); 
        $statuses = mysqli_query($connect, "SELECT * FROM statuses"); 
        $ranks = mysqli_query($connect, "SELECT * FROM ranks WHERE `lang_code` = '".$lang."'");

        $smarty->assign('works', $works);
        $smarty->assign('tested', $tested);
        $smarty->assign('ranks', $ranks);
        $smarty->assign('user', mysqli_fetch_assoc($user)); 
        $smarty->assign('statuses', $statuses);
    }
    
    $smarty->display('design/profiles/edit.tpl'); 
}
