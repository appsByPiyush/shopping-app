<?php
// Include config file
include "config.php";
 
// Define variables and initialize with empty values
$u_id = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    //$isOldUser = isset($_POST["user_id"])? true : false;
    if(trim($_POST['u_id']) < 0 || is_null($_POST['u_id'])){
        $response['status'] = 400;
        $response['message'] = 'User ID is missing';
        echo json_encode($response);
        exit();
    }
    $u_id = $_POST['u_id'];
    $select= "select * from orders where user_id ='$u_id'  ORDER BY id desc";
    $sql = mysqli_query($conn,$select);
    $row = mysqli_fetch_all($sql, MYSQLI_ASSOC);
    //echo print_r($row);
    if(count($row)> 0){
            $response["message"] = "Orders found"; 
            $response["status"] = "200"; 
            $response["data"] = $row; 
            echo json_encode($response);
    } else {
        $response["status"] = "400"; 
        $response["message"] = "No Orders Found"; 
        echo json_encode($response);
    }
    $conn->close();
    //echo $isCorrectPassword;
}

?>