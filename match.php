<?php
include 'db.php';

$sql = "SELECT d.name AS donor, r.name AS patient
FROM Donor d
JOIN Recipient r
ON d.blood_group = r.blood_group
AND d.organ = r.required_organ
WHERE d.status = 'Available'";

$result = $conn->query($sql);

while($row = $result->fetch_assoc()) {
    echo "Donor: " . $row['donor'] . 
         " → Patient: " . $row['patient'] . "<br>";
}
?>
