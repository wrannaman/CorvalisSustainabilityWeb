<?php

// Create an associative array for storing the (JSON) response
$response = ['errors' => []];
$data = json_decode(file_get_contents('php://input'), true);

// Make sure the parameters are present and non-empty
$id_is_empty = ( !$data['id'] );


if ($id_is_empty ) {
  // Formulate a response (to send back as JSON)
  if ($id_is_empty) {
    $response['errors'][] = '"id" parameter must be present.';
  }

  // Send a 400 ("Bad Request") response code if we're missing parameters
  http_response_code(400);
  header('Content-Type: application/json');
  echo json_encode($response);
  exit;
}

require_once '../config/db.php';

// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) { $response['errors'][] = 'Database connection failed'; }

$stmt = $mysqli->prepare("DELETE FROM itemMap WHERE category_id = ? ");
$stmt->bind_param('i', $data['id'] );
if( $stmt->execute() ) {
  $response = ['success' => true];
}

$stmt->close();

$stmt = $mysqli->prepare("DELETE FROM categories WHERE id = ? ");
$stmt->bind_param('i', $data['id'] );
if( $stmt->execute() ) {
  $response = ['success' => true];
}

$stmt->close();
$mysqli->close();
// If we make it this far then we'll simply return a successful response
http_response_code(200);
header('Content-Type: application/json');
echo json_encode($response);
?>
