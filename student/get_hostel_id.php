<?php
include('../includes/dbconn.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $hostel_name = $_POST['hostel_name'];

    // Query to get hostel_id from hostel_name
    $query = "SELECT hostel_id FROM hostel WHERE hostel_name = ?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param('s', $hostel_name);
    $stmt->execute();
    $stmt->bind_result($hostel_id);
    $stmt->fetch();
    $stmt->close();

    // Return hostel_id as the AJAX response
    echo $hostel_id;
}
?>
