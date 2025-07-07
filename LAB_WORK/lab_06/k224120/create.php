<?php
include 'connection.php'; // Include database connection

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get form inputs
    $id = $_POST['isbn_no'];
    $name = $_POST['title'];
    $course = $_POST['author'];

    // Insert query using basic mysqli_query
    $sql = "INSERT INTO Books (isbn_no, title, author) VALUES ('$id', '$name', '$course')";

    if ($conn->query($sql) === TRUE) {
        header('Location: index.php'); // Redirect to student list after success
        exit();
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <center>
    <h2>Add New Student</h2>
    <form method="post">
        <label for="isbn_no">Student ID:</label><br>
        <input type="text" id="isbn_no" name="isbn_no" required><br><br>

        <label for="title">Student Name:</label><br>
        <input type="text" id="title" name="title" required><br><br>

        <label for="std_course">Course:</label><br>
        <input type="text" id="author" name="author" required><br><br>

        <input class="btn btn-success" type="submit" value="Add Student">
       
    </form>
   
    <br>
   <button class="btn btn-primary"> <a class="bs" href="index.php">Back to Student List</a></button>
    </center>
    </div>
</body>
</html>
