<?php
include "config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST["name"];
    $description = $_POST["description"];
    $rating = $_POST["rating"];
    $price = $_POST["price"];
    $quantity = $_POST["quantity"];
    $target_file = null;
    if($_FILES["file"]['size'] > 0){
        //echo print_r($_FILES);
        $newFileName = time()."-".$_FILES["file"]["name"];
        //echo($target_file);
        move_uploaded_file($_FILES["file"]["tmp_name"], "products/" . $newFileName);
        
        //Get the File Location
        $target_file = $newFileName;
        //exit();
    }

    $sql_to_comment = "INSERT INTO products (name, description, rating, price, quantity, image, created)
    VALUES ('$title', '$description','$rating','$price','$quantity','$target_file', now())";  
    $stmt = mysqli_prepare($conn, $sql_to_comment);

    if (mysqli_stmt_execute($stmt)) {
        $response['status'] = 200;
        $response['message'] = 'Product added successfully';
        echo json_encode($response);
        exit();
    } else {
        $response['status'] = 400;
        $response['message'] = 'Something went wrong!';
        echo json_encode($response);
        exit();
    }
}
$conn->close();
?>