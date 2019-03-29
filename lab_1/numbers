<?php

header('Content-Type: application/json');

$number = basename($_SERVER['REQUEST_URI']);
$nf = new NumberFormatter("ru", NumberFormatter::SPELLOUT);
$result = $nf->format($number);

echo json_encode($result, JSON_UNESCAPED_UNICODE);

require_once "_example.php";
SaveExample("lab_1.json", $result);
?>