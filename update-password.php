<?php
// Include config file
include "config.php";
 
// Define variables and initialize with empty values
$email = $password = $address = $name = $phone = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    if(trim($_POST['u_id']) < 0 || is_null($_POST['u_id'])){
        $response['status'] = 400;
        $response['message'] = 'User ID is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['currentPassword']) < 0 || is_null($_POST['currentPassword']) ){
        $response['status'] = 400;
        $response['message'] = 'Current Password is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['newPassword']) < 0 || is_null($_POST['newPassword']) ){
        $response['status'] = 400;
        $response['message'] = 'New Password is missing';
        echo json_encode($response);
        exit();
    }
    $id = $_POST['u_id'];
    $currentPassword = $_POST['currentPassword'];
    $newPassword = $_POST['newPassword'];
    $select= "select password from users where id='$id'";
    $sql = mysqli_query($conn,$select);
    $row = mysqli_fetch_assoc($sql);
    if(count($row) < 0){
        $response['status'] = 400;
        $response['message'] = "User not found";
        echo json_encode($response);
        exit();
    }
    if(password_verify($currentPassword,$row['password'])) {
        $password = password_hash($newPassword,PASSWORD_DEFAULT);
        $update = "update users set password='$password', updated=now() where id='$id'";
        try {
            $sql2=mysqli_query($conn,$update);
        } catch (\Throwable $th) {
            $response['status'] = 400;
            $response['message'] = $th->getMessage();
            echo json_encode($response);
            exit();
        }
        if($sql2){
            $response['status'] = 200;
            $response['message'] = 'Password updated successfully';
            echo json_encode($response); 
        } else{
            $response['status'] = 400;
            $response['message'] = 'Something went wrong!';
            echo json_encode($response); 
        }
        
    } else {
        $response['status'] = 400;
        $response['message'] = 'Current Password is incorrect';
        echo json_encode($response); 
    }
    $conn->close();
    exit();
}

?>