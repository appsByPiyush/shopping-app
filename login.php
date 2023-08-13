<?php
// Include config file
include "config.php";
 
// Define variables and initialize with empty values
$email = $password = $address = $name = $phone = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    //$isOldUser = isset($_POST["user_id"])? true : false;
    if(trim($_POST['email']) < 0 || is_null($_POST['email'])){
        $response['status'] = 400;
        $response['message'] = 'Email is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['password']) < 0 || is_null($_POST['password']) ){
        $response['status'] = 400;
        $response['message'] = 'Password is missing';
        echo json_encode($response);
        exit();
    }
    $email = $_POST['email'];
    $password = $_POST['password'];
    $select= "select password,email from users where email='$email'";
    $sql = mysqli_query($conn,$select);
    $row = mysqli_fetch_assoc($sql);
    //echo print_r($row);
    if(count($row) > 0 && isset($row['email']) && $_POST['email'] == $row['email']){
        if(password_verify($password,$row['password'])){
            $select= "select name,email,phone,address,created from users where email='$email'";
            $sql = mysqli_query($conn,$select);
            $data = mysqli_fetch_assoc($sql);
            $response["message"] = "login success"; 
            $response["status"] = "200"; 
            $response["data"] = $data; 
            echo json_encode($response);
        }else{
            $response["status"] = "400"; 
            $response["message"] = "Invalid login details"; 
            echo json_encode($response);
        }
    } else {
        $response["status"] = "400"; 
        $response["message"] = "No User found or Invalid login details"; 
        echo json_encode($response);
    }
    $conn->close();
    //echo $isCorrectPassword;
}

?>