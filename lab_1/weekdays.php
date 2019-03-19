<?php

header('Content-Type: application/json');

$date = $_GET['date'];
$dmy = explode(".", $date);
$result = date("l", mktime(0, 0, 0, $dmy[1], $dmy[0], $dmy[2]));

echo json_encode($result, JSON_UNESCAPED_UNICODE);

require_once "_example.php";
SaveExample("lab_1.json", $result);
?>