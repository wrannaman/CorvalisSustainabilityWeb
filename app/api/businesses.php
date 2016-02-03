<?php

// Create an associative array for storing the (JSON) response
$response = ['errors' => []];
require_once '../config/db.php';

// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) {
    $response['errors'][] = 'Database connection failed';
}
$stmt = $mysqli->prepare(
  'SELECT * FROM businesses ORDER BY name ASC;'
);
if ($stmt->execute()) {
  $result = $stmt->get_result();
  $items = $result->fetch_all(MYSQLI_ASSOC);
}

$stmt->close();
$mysqli->close();
// If we make it this far then we'll simply return a successful response
http_response_code(200);
//header('Content-Type: application/json');
echo json_encode($items);
?>
