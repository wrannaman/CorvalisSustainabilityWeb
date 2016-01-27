<?php

// Create an associative array for storing the (JSON) response
$response = ['errors' => []];

// name      : $('#name').val(),
// address   : $('#address').val(),
// city      : $('#city').val(),
// state     : $('#state').val(),
// phone     : $('#phone').val(),
// website   : $('#website').val(),
// notes     : $('#notes').val(),
// latitude  : $('#latitude').val(),
// longitude : $('#longitude').val()

// Make sure the parameters are present and non-empty
$id_is_empty = (!isset($_POST['id']) || $_POST['id'] === '');
$name_is_empty = !isset($_POST['name'];
$address_is_empty = !isset($_POST['address'];
$city_is_empty = !isset($_POST['city'];
$state_is_empty = !isset($_POST['state'];
$phone_is_empty = !isset($_POST['phone'];
$website_is_empty = !isset($_POST['website'];
$notes_is_empty = !isset($_POST['notes'];
$latitude_is_empty = !isset($_POST['latitude'];
$longitude_is_empty = !isset($_POST['longitude'];

if ($id_is_empty || $name_is_empty || $address_is_empty || $city_is_empty || $state_is_empty || $phone_is_empty || $website_is_empty || $notes_is_empty || $latitude_is_empty || $longitude_is_empty) {
  // Formulate a response (to send back as JSON)
  if ($id_is_empty) {
    $response['errors'][] = '"id" parameter must be present.';
  }

  if ($name_is_empty) {
    $response['errors'][] = '"name" parameter must be present.';
  }

  if ($address_is_empty) {
    $response['errors'][] = '"address" parameter must be present.';
  }

  if ($city_is_empty) {
    $response['errors'][] = '"city" parameter must be present.';
  }

  if ($state_is_empty) {
    $response['errors'][] = '"state" parameter must be present.';
  }

  if ($phone_is_empty) {
    $response['errors'][] = '"phone" parameter must be present.';
  }

  if ($website_is_empty) {
    $response['errors'][] = '"website" parameter must be present.';
  }

  if ($notes_is_empty) {
    $response['errors'][] = '"notes" parameter must be present.';
  }

  if ($latitude_is_empty) {
    $response['errors'][] = '"latitude" parameter must be present.';
  }

  if ($longitude_is_empty) {
    $response['errors'][] = '"longitude" parameter must be present.';
  }


  // Send a 400 ("Bad Request") response code if we're missing parameters
  http_response_code(400);
  header('Content-Type: application/json');

  echo json_encode($response);
  exit;
}

require_once 'config/db.php';

// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) {
  echo 'Connection error: (', $mysqli->connect_errno, ') ',
    $mysqli->connect_error;
}  else {
  echo "ok";
}

// TODO: Modify the quantity of the existing item if this addition is within
//       24 hours of the last time that item was added.

// Get the shelf life for the food item
$stmt = $mysqli->prepare(
  'SELECT shelf_life FROM food_items WHERE id = ? LIMIT 1;'
);
$stmt->bind_param('i', $_POST['id']);

if ($stmt->execute()) {
  $result = $stmt->get_result();
}
$stmt->close();

// TODO: Do the error handling for the query result

$food_item = $result->fetch_all(MYSQLI_ASSOC);
$result->close();

// Calculate the future expiration date using the current date and shelf life
date_default_timezone_set('America/Los_Angeles');
$strtotime_string = '+ ' . $food_item[0]['shelf_life'] . ' days';
$expiration_date = date('Y-m-d H:i:s', strtotime($strtotime_string));

// Add a food item to the user's inventory
$stmt = $mysqli->prepare(
  'INSERT INTO users_food_items (user_id, food_item_id, quantity, '
  . 'expiration_date) VALUES (?, ?, ?, ?);'
);
$stmt->bind_param(
  'iids',
  $_SESSION['user'],
  $_POST['id'],
  $_POST['qty'],
  $expiration_date
);

$stmt->execute();

// Return an error if the insertion fails
if ($stmt->affected_rows <= 0) {
  $stmt->close();
  // Formulate a response array (to send back as JSON)
  // TODO: Make this error more granular/explanatory
  $response['errors'][] = 'Problem adding the item to the database.';

  // Send a 400 ("Bad Request") response code if we're missing parameters
  http_response_code(400);
  header('Content-Type: application/json');

  echo json_encode($response);
  exit;
}

$stmt->close();
$mysqli->close();

// If we make it this far then we'll simply return a successful response
http_response_code(200);
header('Content-Type: application/json');
echo json_encode($response);
