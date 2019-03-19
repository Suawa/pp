<?php

header('Content-Type: application/json');

$n = basename($_SERVER['REQUEST_URI']);
$codes = json_decode(file_get_contents("region_codes.json"));

$result = $codes->$n;
echo json_encode($result, JSON_UNESCAPED_UNICODE);

require_once "_example.php";
SaveExample("lab_1.json", $result);
?>