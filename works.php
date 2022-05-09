<?php

require_once('connect.php'); 

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $task_id = $_REQUEST['task_data']['task_id']; 
    $status = $_REQUEST['task_data']['status'];
    $time = $_REQUEST['task_data']['time'];
    $type = $_REQUEST['task_data']['type'];
    $name = $_REQUEST['task_data']['name'];
    $developer = $_REQUEST['task_data']['developer'];
    $tester = $_REQUEST['task_data']['tester'];
    $description = $_REQUEST['task_data']['description'];
    $time_start = $_REQUEST['task_data']['time_start'];
    $time_end = $_REQUEST['task_data']['time_end'];
    
    if (empty($task_id)) {

        $sql = "INSERT INTO `task` 
        (`status`, `time`,`type`, `name`,`developer`, `tester`, `description`, `time_start`, `time_end`)
        VALUES ('$status','$time', '$type', '$name', '$developer', '$tester', '$description', '$time_start', '$time_end')";

        if (mysqli_query($connect, $sql)) {
            echo "Задача добавлена!";
        } else {
            echo "Error: " . $sql . ":-" . mysqli_error($connect);
        }
    } else {
        $sql = "UPDATE task SET 
        status='$status', 
        time='$time', 
        type='$type',
        name='$name',
        developer='$developer',
        tester='$tester',
        description='$description',
        time_start='$time_start',
        time_end='$time_end'
        WHERE task_id=$task_id";

        if (mysqli_query($connect, $sql)) {
            echo "Задача обновлена!";
        } else {
            echo "Error: " . $sql . ":-" . mysqli_error($connect);
        }
    }
}

if ($mode == 'manage') {
    $works = mysqli_query($connect, "SELECT * FROM task"); 
    $statuses = mysqli_query($connect, "SELECT * FROM `statuses` WHERE `lang_code` = '".$lang."'"); 

    $smarty->assign('statuses', $statuses); 
    $smarty->assign('works', $works); 
    $smarty->display('works/manage.tpl'); 
}
if ($mode == 'view') {
    $task_id = $_REQUEST['task_id']; 
    $task = mysqli_query($connect, "SELECT * FROM task WHERE task_id = $task_id"); 
    $statuses = mysqli_query($connect, "SELECT * FROM `statuses` WHERE `lang_code` = '".$lang."'");
    $profiles = mysqli_query($connect, "SELECT * FROM staff");

    $smarty->assign('profiles', $profiles);
    $smarty->assign('statuses', $statuses);
    $smarty->assign('task', mysqli_fetch_assoc($task)); 
    $smarty->display('works/view.tpl'); 
}

