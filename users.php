<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

include "config.php";
$sql = "SELECT * from users";
$response = mysqli_query($conn,$sql) or die ("Something Went Wrong!");
$response = mysqli_fetch_all($response, MYSQLI_ASSOC);
echo json_encode($response);

?>