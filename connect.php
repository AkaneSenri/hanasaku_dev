<?php

$servername = "localhost";
$username = "root";
$db_password = "root";
$db = "hanasaku_dev";

$connect = mysqli_connect($servername, $username, $db_password, $db);
if (!$connect) {
    die("Connect failed " . mysqli_connect_error());
}

require_once('libs/smarty/Smarty.class.php');

$lang = 'RU';
$smarty = new Smarty();
$smarty->template_dir = 'design';
$smarty->compile_dir = 'cache';
$mode = $_REQUEST['mode'];