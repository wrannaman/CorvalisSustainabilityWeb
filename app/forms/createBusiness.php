<?php

// Create an associative array for storing the (JSON) response
$response = ['errors' => []];
$data = json_decode(file_get_contents('php://input'), true);

// Make sure the parameters are present and non-empty
$name_is_empty = !isset($data['name']);

if ($name_is_empty) {
  $response['errors'][] = '"name" parameter must be present.';
  // Formulate a response (to send back as JSON)

  // Send a 400 ("Bad Request") response code if we're missing parameters
  http_response_code(400);
  header('Content-Type: application/json');
  echo json_encode($data);
  exit;
}

require_once '../config/db.php';

// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) { $response['errors'][] = 'Database connection failed'; }

$stmt = $mysqli->prepare("INSERT INTO businesses (name,type,address,city,state,phone,website,notes,latitude,longitude) VALUES (?,?,?,?,?,?,?,?,?,?)");
$stmt->bind_param('ssssssssii', $data['name'],
$data['type'],
$data['address'],
$data['city'],
$data['state'],
$data['phone'],
$data['website'],
$data['notes'],
$data['latitude'],
$data['longitude']);
if( $stmt->execute() ) { $response = ['success' => true]; }

$stmt->close();
$mysqli->close();
// If we make it this far then we'll simply return a successful response
http_response_code(200);
header('Content-Type: application/json');
echo json_encode($response);
?>
