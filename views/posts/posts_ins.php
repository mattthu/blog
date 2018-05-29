<?php
var_dump($post);
include ('/var/www/html/blog/config.php');
$conn = new mysqli(DATABASE_HOSTNAME, DATABASE_USERNAME, DATABASE_PASSWORD, DATABASE_DATABASE);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$comment = $_POST['comment'];
$sql1 = "INSERT INTO comment (comment_text) VALUES ('$comment')";
$con=mysqli_connect(DATABASE_HOSTNAME,DATABASE_USERNAME,DATABASE_PASSWORD,DATABASE_DATABASE);
        $val = mysqli_query($con,"select * from comment WHERE comment_text='$comment'");
        if (!$val) {
            die('Error: ' . mysqli_error($con));
        }
        if(mysqli_num_rows($val) > 0) {
            echo "Already inserted";
        } else {
        if ($conn->query($sql1) === TRUE) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql1 . "<br>" . $conn->error;
}
}
$sql2 = "SELECT comment_id FROM `comment` order by `comment_id` desc limit 1";
$result = mysqli_query($conn, $sql2);
if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
      $comment_te = $row["comment_id"];
      $postid = $post['post_id'];
      $sql3 = "INSERT INTO `post_comments`(`post_id`, `comment_id`) VALUES ($postid,$comment_te)";
      if ($conn->query($sql3) === TRUE) {
          echo "New record created successfully";
      } else {
          echo "Error: " . $sql3 . "<br>" . $conn->error;
      }
    }
} else {
    echo "0 results";
}

$post['post_id'];
$conn->close();
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
