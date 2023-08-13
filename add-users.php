<?php
// Include config file
include "config.php";
 
// Define variables and initialize with empty values
$email = $password = $address = $name = $phone = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $isOldUser = isset($_POST["user_id"])? true : false;
    if(trim($_POST['name']) < 0 || is_null($_POST['name'])){
        $response['status'] = 400;
        $response['message'] = 'Name is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['email']) < 0 || is_null($_POST['email']) ){
        $response['status'] = 400;
        $response['message'] = 'Email is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['address']) < 0 || is_null($_POST['address']) ){
        $response['status'] = 400;
        $response['message'] = 'Address is missing';
        echo json_encode($response);
        exit();
    }
    $email = $_POST['email'];
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];
    if($isOldUser){
        if(trim($_POST['user_id']) < 0 || is_null($_POST['user_id']) ){
            $response['status'] = 400;
            $response['message'] = 'User Id is missing';
            echo json_encode($response);
            exit();
        }
        $id = $_POST['user_id'];
        $select= "select * from users where id='$id'";
        $sql = mysqli_query($conn,$select);
        $row = mysqli_fetch_assoc($sql);
        $res= $row['id'];
        if($res === $id) {
            $update = "update users set email='$email',name='$name',phone='$phone',address='$address', updated=now() where id='$id'";
            try {
                $sql2=mysqli_query($conn,$update);
            } catch (\Throwable $th) {
                $response['status'] = 400;
                $response['message'] = $th->getMessage();
                echo json_encode($response);
                exit();
            }
            
        } else {
            $response['status'] = 400;
            $response['message'] = 'No User found with these details.';
            echo json_encode($response); 
        }
    } else {
        if(trim($_POST['password']) < 0 || is_null($_POST['password']) ){
            $response['status'] = 400;
            $response['message'] = 'Password is missing';
            echo json_encode($response);
            exit();
        } 
        $password = password_hash($_POST['password'],PASSWORD_DEFAULT);
        $sql_users = "INSERT INTO users (name, email, phone, password, address)
        VALUES ('$name', '$email','$phone','$password','$address')";  
        try {
            $sql2=mysqli_query($conn,$sql_users);
        } catch (\Throwable $th) {
            $response['status'] = 400;
            $response['message'] = $th->getMessage();
            echo json_encode($response);
            exit();
        }
    }

    if($sql2) { 
        $response['status'] = 200;
        $response['message'] = 'Profile created or updated successfully!';
        echo json_encode($response);
    } else {
        $response['status'] = 400;
        $response['message'] = 'Something went wrong!, Please try again later';
        echo json_encode($response);
    }
    $conn->close();
    exit();
}

?>