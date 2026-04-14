<?php
include 'db.php';

$name = $_POST['dName'];
$age = $_POST['dAge'];
$blood = $_POST['dBlood'];
$organ = $_POST['dOrgan'];


$sql = "INSERT INTO Donor (name, age, blood_group, organ)
VALUES ('$name', '$age', '$blood', '$organ')";

if ($conn->query($sql) === TRUE) {
    echo "Donor added successfully";
} else {
    echo "Error: " . $conn->error;
}
?>
