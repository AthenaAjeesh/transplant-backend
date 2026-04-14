<?php
include 'db.php';

$name = $_POST['pName'];
$age = $_POST['pAge'];
$blood = $_POST['pBlood'];
$organ = $_POST['pOrgan'];
$urgency = $_POST['pUrgency'];


$sql = "INSERT INTO Recipient (name, age, blood_group, required_organ, urgency)
VALUES ('$name', '$age', '$blood', '$organ', '$urgency')";

if ($conn->query($sql) === TRUE) {
    echo "Recipient added successfully!";
} else {
    echo "Error: " . $conn->error;
}
?>
