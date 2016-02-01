<?php
session_start();
session_regenerate_id();
function getCurrentUri5() {
  $basepath = implode('/', array_slice(explode('/', $_SERVER['SCRIPT_NAME']), 0, -1)) . '/';
  $uri = substr($_SERVER['REQUEST_URI'], strlen($basepath));
  if (strstr($uri, '?')) $uri = substr($uri, 0, strpos($uri, '?'));
  $uri = '/' . trim($uri, '/');
  $bodytag = str_replace($uri, "", "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}");
  return $bodytag;
}

if(!isset($_SESSION['user']))      // if there is no valid session
{
    $location = getCurrentUri5() . "/login.php";
    header("Location: " . $location );
}
require_once 'config/db.php';
// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) {
  echo 'Connection error: (', $mysqli->connect_errno, ') ', $mysqli->connect_error;
} else {
  echo "db connection ok <br>";
}

?>
<!DOCTYPE html>
<html>
<head>
  <title>Corvalis Sustainability App</title>
</head>

<body>
  <?php include 'partials/nav.php';?>
  <div class="container">

    <div class="container">
      <form class="form-signin" style="max-width: 330px; padding: 15px; margin: 0 auto;">
        <h2 class="form-signin-heading">Change Password</h2>
        <label for="inputEmail" class="sr-only">Current Password</label>
        <input type="password" id="curPass" class="form-control" placeholder="current password" required="true" autofocus="">
        <label for="inputPassword" class="sr-only">New Password</label>
        <input type="password" id="pass" class="form-control" placeholder="New Password" required="true">
        <label for="inputPassword" class="sr-only">Confirm New Password</label>
        <input type="password" id="pass2" class="form-control" placeholder="Confirm New Password" required="true">
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="change">Sign in</button>
      </form>

    </div>

  </div>

  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>

  <!-- Sweet Alerts -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" >
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>


</body>

<script>
var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );

$('body').on('click', '#change', function(e){
  e.preventDefault();
  console.log('');

 var data =  {
   current : $('#curPass').val(),
   pass1   : $('#pass').val(),
   pass2   : $('#pass2').val(),
 }

  if(!data.current.trim()){
    return swal("Uh oh!", 'Please enter your current password', "error");
  }
  if (data.pass1 !== data.pass2) {
    return swal("Uh oh!", 'You\'re new passwords must match', "error");
  }

  $.ajax({
    url: baseUrl + 'forms/changePassword.php',
    method: 'POST',
    data: JSON.stringify(data),
    dataType: 'json',
    success: function(res) {
      console.log('res', res);
      if  (typeof(res.errors) !== 'undefined' && res.errors.length > 0) {
        return swal("Uh oh!", res.errors[0] , "error");
      }
      return swal('Success!', 'Your new password has been saved.', 'success');
    },
    error: function(error) {
      console.error('error', error);
    }
  });

});
</script>
</html>
