<?php
include 'connection.php'; // Include database connection

$id = $_GET['id']; // Get student ID from the URL

// Fetch student details for the given ID
$sql = "SELECT * FROM Books WHERE isbn_no = '$id'";
$result = $conn->query($sql);
$student = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get form inputs
    $name = $_POST['title'];
    $course = $_POST['author'];

    // Update query
    $sql = "UPDATE Books SET title = '$name', author = '$course' WHERE isbn_no = '$id'";

    if ($conn->query($sql) === TRUE) {
        header('Location: index.php'); // Redirect to the student list after success
        exit();
    } else {
        echo "Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <center>
    <h2>Edit Student</h2>
    <form method="post">
        <label for="title">Student Name:</label><br>
        <input type="text" id="title" name="title" value="<?php echo $student['title']; ?>" required><br><br>

        <label for="author">Course:</label><br>
        <input type="text" id="author" name="author" value="<?php echo $student['author']; ?>" required><br><br>

        <input class="btn btn-success" type="submit" value="Update Student">
    </form>
    <br>
    <button class="btn btn-primary"> <a class="bs" href="index.php">Back to Student List</a></button>
    </center>   
</div>    
</body>
</html>
