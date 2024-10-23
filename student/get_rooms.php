<?php
include('../includes/dbconn.php');

if (isset($_GET['hostel_name'])) { // Check for hostel_name
    $hostel_name = $_GET['hostel_name'];

    // Fetch room numbers associated with the specified hostel name
    $query = "SELECT rooms.room_no FROM rooms JOIN hostel ON rooms.hostel_id = hostel.id WHERE hostel.hostel_name = ?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("s", $hostel_name); // Use "s" for string
    $stmt->execute();
    $res = $stmt->get_result();

    $rooms = [];
    while ($row = $res->fetch_object()) {
        $rooms[] = $row; // Collect room data
    }

    // Return room data as JSON
    echo json_encode($rooms);
} else {
    // Optionally handle the case where hostel_name is not set
    echo json_encode([]);
}
?>
