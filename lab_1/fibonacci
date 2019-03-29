<?php

header('Content-Type: application/json');

$n = basename($_SERVER['REQUEST_URI']);

if($n > 0)
{
	$result = round(((5 ** .5 + 1) / 2) ** $n / 5 ** .5);
}
else
{
	$result = null;
}

echo json_encode($result, JSON_UNESCAPED_UNICODE);

require_once "_example.php";
SaveExample("lab_1.json", $result);
?>