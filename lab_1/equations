<?php

header('Content-Type: application/json');

$a = $_GET['a'];
$b = $_GET['b'];
$c = $_GET['c'];

$d = ($b * $b) - (4 * $a *$c);

$result = array();
if ($d > 0)
{
	$result[] = (-$b + sqrt($d)) / (2 * $a);
	$result[] = (-$b - sqrt($d)) / (2 * $a);
}
elseif ($d == 0)
{
	$result[] = -$b / (2 * $a);
}
else
{
	$result[] = null;
}

echo json_encode($result, JSON_UNESCAPED_UNICODE);

require_once "_example.php";
SaveExample("lab_1.json", $result);
?>