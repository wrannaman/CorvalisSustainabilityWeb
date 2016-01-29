<?php

// Create an associative array for storing the (JSON) response
$response = ['errors' => []];
$data = json_decode(file_get_contents('php://input'), true);

// Make sure the parameters are present and non-empty
$selected_is_empty = ( !$data['selected'] );
$name_is_empty = ( !$data['name'] );
$id_is_empty = ( !$data["id"] );


if ($id_is_empty || $selected_is_empty || $name_is_empty ) {
  // Formulate a response (to send back as JSON)
  if ($id_is_empty) {
    $response['errors'][] = '"id" parameter must be present.';
  }

  if ($name_is_empty) {
    $response['errors'][] = '"name" parameter must be present.';
  }

  if ($selected_is_empty) {
    $response['errors'][] = '"selected" parameter must be present.';
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
if ($mysqli->connect_errno) {
  // echo 'Connection error: (', $mysqli->connect_errno, ') ',
  //   $mysqli->connect_error;
    $response['errors'][] = 'Database connection failed';
}
//
$stmt = $mysqli->prepare("UPDATE categories SET name = ? WHERE id = ?");
$stmt->bind_param('si', $data['name'], $data["id"] );
if( $stmt->execute() ) {
  $response = ['success' => true];
}


// delete all old ones and save the new ones
$stmt = $mysqli->prepare("DELETE FROM itemMap WHERE category_id = ?");
$stmt->bind_param('i', $data["id"] );
if( $stmt->execute() ) {
  $response = ['success' => true];
} else {
    printf("Errormessage: %s\n", $mysqli->error);
}

// // create new ones
for($i=0; $i<count($data['selected']); $i++) {

  $stmt = $mysqli->prepare("INSERT INTO itemMap (category_id, item_id) VALUES (?,?)");
  $stmt->bind_param('ii',$data["id"], $data['selected'][$i]["id"] );
  if( $stmt->execute() ) {
    $response = ['success' => true];
  }

}


// loop through each item in the array and add a record to the database



// $stmt->close();
// $mysqli->close();
// If we make it this far then we'll simply return a successful response
http_response_code(200);
header('Content-Type: application/json');
echo json_encode($response);
?>
