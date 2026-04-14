<?php
include 'db.php';

$result = $conn->query("SELECT * FROM Donor");

while($row = $result->fetch_assoc()) {
    echo $row['name'] . " - " . $row['blood_group'] . "<br>";
}
?>
