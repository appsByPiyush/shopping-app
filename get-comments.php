<?php
// Include config file
include "config.php";
 
// Define variables and initialize with empty values
$p_id = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    //$isOldUser = isset($_POST["user_id"])? true : false;
    if(trim($_POST['p_id']) < 0 || is_null($_POST['p_id'])){
        $response['status'] = 400;
        $response['message'] = 'Product ID is missing';
        echo json_encode($response);
        exit();
    }
    $p_id = $_POST['p_id'];
    $select= "select * from comments where product_id ='$p_id' ORDER BY id desc";
    $sql = mysqli_query($conn,$select);
    $row = mysqli_fetch_all($sql, MYSQLI_ASSOC);
    //echo print_r($row);
    if(count($row)> 0){
        $response_new = array();
        foreach($row as $id => $data){
            $id= $data['id'];
            $select= "select name from users where id='$id'";
            $sql = mysqli_query($conn,$select);
            $userDetails = mysqli_fetch_assoc($sql);
            $data["Username"] = $userDetails['name'];
            //echo print_r($data);
            $response_new[] = $data;
        }
        $response["message"] = "Comments found"; 
        $response["status"] = "200"; 
        $response["data"] = $response_new; 
        echo json_encode($response);
    } else {
        $response["status"] = "400"; 
        $response["message"] = "No Comments Found"; 
        echo json_encode($response);
    }
    $conn->close();
    //echo $isCorrectPassword;
}

?>