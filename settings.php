<?php
require_once('connect.php');

$smarty->display('design/settings/view.tpl'); 

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $price = $_REQUEST['settings_data']['price'];

    $sql = "UPDATE settings SET 
    price='$price'";

    if (mysqli_query($connect, $sql)) {
        echo "Цена обновлена!";
    } else {
        echo "Error: " . $sql . ":-" . mysqli_error($connect);
    }
}
 
$smarty->assign('price',$price);