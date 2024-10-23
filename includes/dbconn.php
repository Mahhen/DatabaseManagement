<?php
$servername = "localhost";
$username = "root";
$password = ""; // Replace with your actual MySQL password if needed
$dbname = "hostelmsphp";

// Create connection
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
?>
