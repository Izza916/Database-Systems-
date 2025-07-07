<?php
$host = 'localhost';
$username = 'root';
$password = ''; // Add your password if needed
$dbname = 't1';

// Create a connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
