<?php

// Create an associative array for storing the (JSON) response
$response = ['errors' => []];
$data = json_decode(file_get_contents('php://input'), true);

//var_dump($data);

// // Make sure the parameters are present and non-empty

$name_is_empty = ( !$data['name'] );

if ( $name_is_empty ) {

  if ($name_is_empty) {
    $response['errors'][] = '"name" parameter must be present.';
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
if ($mysqli->connect_errno) { $response['errors'][] = 'Database connection failed'; };

$stmt = $mysqli->prepare("INSERT INTO categories (name) VALUES (?)");
$stmt->bind_param('s', $data['name'] );
if( $stmt->execute() ) { $response = ['success' => true]; }
// If we make it this far then we'll simply return a successful response
http_response_code(200);
header('Content-Type: application/json');
echo json_encode($response);
?>
