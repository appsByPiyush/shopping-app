<?php
include "config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if(trim($_POST["p_id"])< 0 || is_null($_POST["p_id"])){
        $response['status'] = 400;
        $response['message'] = 'Product ID Missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST["u_id"])< 0 || is_null($_POST["u_id"])){
        $response['status'] = 400;
        $response['message'] = 'User ID Missing';
        echo json_encode($response);
        exit();
    }
    if(trim($_POST["title"])< 0 || is_null($_POST["title"])){
        $response['status'] = 400;
        $response['message'] = 'Title Missing';
        echo json_encode($response);
        exit();
    }
    //if()
    $product_id = $_POST["p_id"];
    $user_id = $_POST["u_id"];
    $title = $_POST["title"];
    $description = $_POST["description"];
    $rating = $_POST["rating"];
    $target_file = null;
    if($_FILES["file"]['size'] > 0){
        //echo print_r($_FILES);
        $newFileName = time()."-".$_FILES["file"]["name"];
        //echo($target_file);
        move_uploaded_file($_FILES["file"]["tmp_name"], "images/" . $newFileName);
        
        //Get the File Location
        $target_file = $newFileName;
        //exit();
    }

    $sql_to_comment = "INSERT INTO comments (product_id, user_id, title, description, rating, imagelink)
    VALUES ('$product_id', '$user_id','$title','$description','$rating','$target_file')";  
    $stmt = mysqli_prepare($conn, $sql_to_comment);

    if (mysqli_stmt_execute($stmt)) {
        $response['status'] = 200;
        $response['message'] = 'Comment added successfully';
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