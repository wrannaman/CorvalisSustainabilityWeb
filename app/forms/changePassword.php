<?php

session_start();
session_regenerate_id();
// Create an associative array for storing the (JSON) response
$response = ['errors' => []];
$data = json_decode(file_get_contents('php://input'), true);

// Make sure the parameters are present and non-empty
$email = $_SESSION["user"];
$curPass_empty = !isset($data['current']);
$pass1_empty = !isset($data['pass1']);
$pass2_empty = !isset($data['pass2']);

if ($curPass_empty || $pass1_empty || $pass2_empty) {
  if ($curPass_empty){
    $response['errors'][] = '"password" parameter must be present.';
  }
  if ($pass1_empty){
    $response['errors'][] = '"password confirm" parameter must be present.';
  }
  if ($pass2_empty){
    $response['errors'][] = '"password confirm" parameter must be present.';
  }
  // Formulate a response (to send back as JSON)

  // Send a 400 ("Bad Request") response code if we're missing parameters
  http_response_code(200);
  header('Content-Type: application/json');
  echo json_encode($response);
  exit;
}

require_once '../config/db.php';

// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) { $response['errors'][] = 'Database connection failed'; }

$stmt = $mysqli->prepare("SELECT * FROM users WHERE email = ? LIMIT 1");

$stmt->bind_param('s', $email);

if( $stmt->execute() ) {
  $result = $stmt->get_result();
  $users = $result->fetch_all(MYSQLI_ASSOC);

  if (sizeof($users) == 1 && $users[0]["email"] == $email) {
    //check password
    $salt = "alsjdkf230989021sdjklfclsa";
    $hashed = crypt($data['current'], $salt);

    if ($hashed == $users[0]["password"]) {
       // update to new password

       $newHash = crypt($data['pass1'], $salt);

       $stmt = $mysqli->prepare("UPDATE users SET password = ? WHERE id = ?");
       $stmt->bind_param('si', $newHash, $users[0]['id']);
       if( $stmt->execute() ) {
          $response = ['success' => true];
          http_response_code(200);
          header('Content-Type: application/json');
          echo json_encode($response);
          exit;
       }
    } else {
      $response['errors'][] = 'Incorrect Password';
      http_response_code(200);
      header('Content-Type: application/json');
      echo json_encode($response);
      exit;
    }

  } else {
    $response['errors'][] = '"email" not found.';
    http_response_code(200);
    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
  }
  // echo "$users[0]['email']";
  // var_dump($users[0]["email"]);
}
//
// $stmt->close();
// $mysqli->close();
// If we make it this far then we'll simply return a successful response
// http_response_code(200);
// header('Content-Type: application/json');
// echo json_encode($response);
?>
