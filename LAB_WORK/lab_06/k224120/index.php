<?php
include 'connection.php'; // Include the database connection

// Fetch all Books from the database
$sql = "SELECT * FROM Books order by isbn_no";
$result = $conn->query($sql); // Execute the query

$Books = []; // Initialize an empty array for Books

if ($result->num_rows > 0) {
    // Fetch all the rows and store them in $Books array
    $Books = $result->fetch_all(MYSQLI_ASSOC); // Use mysqli_fetch_all for an associative array
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Student Management</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <center>
    <h2>Student List</h2>
    </center>
    <div class="container">
    <table  class="table table-striped table-bordered">
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Course</th>
            <th>Action</th>
        </tr>
        <?php if (!empty($Books)): ?> <!-- Check if $Books is not empty -->
            <?php foreach ($Books as $student): ?>
            <tr>
                <td><?php echo $student['isbn_no']; ?></td>
                <td><?php echo $student['title']; ?></td>
                <td><?php echo $student['author']; ?></td>
                <td>
                    <center>
                  <button  class="btn btn-primary">  <a class="edit" href="edit.php?id=<?php echo $student['isbn_no']; ?>">Edit</a></button>
                  <button class="btn btn-primary">  <a class="delete" href="delete.php?id=<?php echo $student['isbn_no']; ?>" onclick="return confirm('Are you sure?')">Delete</a></button>
                  </center>
                </td>
            </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="4">No Books found</td>
            </tr>
        <?php endif; ?>
    </table>
    </div>
    <br>
    <center>
   <button class="btn btn-success"> <a class="ans" href="create.php">Add New Student</a></button>
   </center>
</body>
</html>
