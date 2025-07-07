<?php
include 'connection.php'; // Include database connection

$id = $_GET['id']; // Get student ID from the URL

// Delete query
$sql = "DELETE FROM Books WHERE isbn_no = '$id'";

if ($conn->query($sql) === TRUE) {
    header('Location: index.php'); // Redirect to the student list after deletion
    exit();
} else {
    echo "Error: " . $conn->error;
}
?>
