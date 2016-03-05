<?php
session_start();
session_regenerate_id();
function getCurrentUri9() {
  $basepath = implode('/', array_slice(explode('/', $_SERVER['SCRIPT_NAME']), 0, -1)) . '/';
  $uri = substr($_SERVER['REQUEST_URI'], strlen($basepath));
  if (strstr($uri, '?')) $uri = substr($uri, 0, strpos($uri, '?'));
  $uri = '/' . trim($uri, '/');
  $bodytag = str_replace($uri, "", "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}");
  return $bodytag;
}

if(isset($_SESSION['user']))      // if there is no valid session
{
    $location = getCurrentUri9() . "/businesses.php";
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
<title>Corvallis Sustainability App</title>
</head>

<body>
  <div class="container">

        <form class="form-signin" style="max-width: 330px; padding: 15px; margin: 0 auto;">
          <h2 class="form-signin-heading">Please sign in</h2>
          <label for="inputEmail" class="sr-only">Email address</label>
          <input type="email" id="email" class="form-control" placeholder="Email address" required="" autofocus="">
          <label for="inputPassword" class="sr-only">Password</label>
          <input type="password" id="pass" class="form-control" placeholder="Password" required="">
          <button class="btn btn-lg btn-primary btn-block" type="submit" id="login">Sign in</button>
        </form>

      </div>
</body>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>

<!-- Sweet Alerts -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<script>
$('body').on('click', '#login', function(e){
  e.preventDefault();
  var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );
  var emailRg = /^(([a-zA-Z]|[0-9])|([-]|[_]|[.]))+[@](([a-zA-Z0-9])|([-])){2,63}[.](([a-zA-Z0-9]){2,63})+$/gi;


  var data = {
    email : $('#email').val(),
    password : $('#pass').val(),
  }
  if (!emailRg.test(data.email)){
    return swal("Uh oh!", 'Please enter a valid email address.', "error");
  }
  console.log('data', data);

  $.ajax({
    url: baseUrl + 'forms/login.php',
    method: 'POST',
    data: JSON.stringify(data),
    dataType: 'json',
    success: function(res) {
      console.log('res', res);
      if (typeof(res.errors) !== 'undefined') {
        return swal("Uh oh!", res.errors[0], "error");
      }
      window.location = baseUrl + 'businesses.php';
      return swal("Success!", "Logged in.", "success");
    },
    error: function(error) {
      console.error('error', error);
      if (error.responseText.indexOf('email') !== -1) return   swal("Error!", "Email not found", "error");
      if (error.responseText.indexOf('Incorrect Password') !== -1 ) return swal("Error!", "Incorrect email password combination", "error");
      swal("Error!", "Error!", "error");
    }
  });
})
</script>
</html>
