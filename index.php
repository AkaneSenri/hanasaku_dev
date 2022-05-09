<?php

require_once('connect.php');


// Smarty connect
$smarty = new Smarty();
$smarty->template_dir = 'design';
$smarty->compile_dir = 'cache';
$smarty->display('index.tpl');
