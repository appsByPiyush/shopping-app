<?php
// Include config file
include "config.php";
 
// Define variables and initialize with empty values
$p_id = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    //$isOldUser = isset($_POST["user_id"])? true : false;
    if(trim($_POST['u_id']) < 0 || is_null($_POST['u_id'])){
        $response['status'] = 400;
        $response['message'] = 'User ID is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['p_id']) < 0 || is_null($_POST['p_id'])){
        $response['status'] = 400;
        $response['message'] = 'Product ID is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['quantity']) < 0 || is_null($_POST['quantity'])){
        $response['status'] = 400;
        $response['message'] = 'Quantity is missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST['price']) < 0 || is_null($_POST['price'])){
        $response['status'] = 400;
        $response['message'] = 'Price is missing';
        echo json_encode($response);
        exit();
    }
    $p_id = $_POST['p_id'];
    $u_id = $_POST['u_id'];
    $quantity = $_POST['quantity'];
    $price = $_POST['price'];
    $select= "select quantity from products where id='$p_id'";
    $sql = mysqli_query($conn,$select);
    $row = mysqli_fetch_assoc($sql);
    if(count($row) > 0){
        if( $row['quantity'] < $quantity){
            $response['status'] = 400;
            $response['message'] = "Ordered More than available, left quantity is: ".$row['quantity']." .";
            echo json_encode($response);
            exit();
        }
    }else{
        $response['status'] = 400;
        $response['message'] = 'Product Not Found!';
        echo json_encode($response);
        exit();
    }
    $sql_to_comment = "INSERT INTO orders (product_id, quantity, user_id, price, created)
    VALUES ('$p_id', '$quantity','$u_id', '$price', now())";  
    $stmt = mysqli_prepare($conn, $sql_to_comment);
    if (mysqli_stmt_execute($stmt)) {
        $left_quantity = $row['quantity'] - $quantity; 
        $updateProducts = "update products set quantity='$left_quantity', updated=now() where id='$p_id'";
        try {
            $sql2=mysqli_query($conn,$updateProducts);
        } catch (\Throwable $th) {
            $response['status'] = 400;
            $response['message'] = $th->getMessage();
            echo json_encode($response);
            exit();
        }
        $response['status'] = 200;
        $response['message'] = 'Order placed successfully';
        echo json_encode($response);
    } else {
        $response['status'] = 400;
        $response['message'] = 'Something went wrong!';
        echo json_encode($response);
        exit();
    }
    
    $conn->close();
    //echo $isCorrectPassword;
}

?>