<?php
// Create an associative array for storing the (JSON) response
$response = ['errors' => []];
$data = json_decode(file_get_contents('php://input'), true);

// Make sure the parameters are present and non-empty
$pass_is_empty = !isset($data['password']);
$email_is_empty = !isset($data['email']);

function get_result( $Statement ) {
    $RESULT = array();
    $Statement->store_result();
    for ( $i = 0; $i < $Statement->num_rows; $i++ ) {
        $Metadata = $Statement->result_metadata();
        $PARAMS = array();
        while ( $Field = $Metadata->fetch_field() ) {
            $PARAMS[] = &$RESULT[ $i ][ $Field->name ];
        }
        call_user_func_array( array( $Statement, 'bind_result' ), $PARAMS );
        $Statement->fetch();
    }
    return $RESULT;
}

if ($pass_is_empty || $email_is_empty) {
  if ($pass_is_empty){
    $response['errors'][] = '"password" parameter must be present.';
  }
  if ($email_is_empty){
    $response['errors'][] = '"email" parameter must be present.';
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
$stmt->bind_param('s', $data['email']);
if( $stmt->execute() ) {
  $result = get_result( $stmt );
  $users = $result;
  if (sizeof($users) == 1 && $users[0]["email"] == $data['email']) {
    //check password
    $salt = "alsjdkf230989021sdjklfclsa";
    $hashed = crypt($data['password'], $salt);

    if ($hashed == $users[0]["password"]) {
       $response = ['success' => true];


       if (session_status() == PHP_SESSION_NONE) {
         // start a session
         session_start();
         $_SESSION['user'] = $data['email'];
       }



       http_response_code(200);
       header('Content-Type: application/json');
       echo json_encode($response);
       exit;
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
