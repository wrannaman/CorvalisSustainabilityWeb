<?php
// Start the session if it hasn't been started
if (session_status() == PHP_SESSION_NONE) {
  session_start();
}

function getCurrentUri6() {
  $basepath = implode('/', array_slice(explode('/', $_SERVER['SCRIPT_NAME']), 0, -1)) . '/';
  $uri = substr($_SERVER['REQUEST_URI'], strlen($basepath));
  if (strstr($uri, '?')) $uri = substr($uri, 0, strpos($uri, '?'));
  $uri = '/' . trim($uri, '/');
  $bodytag = str_replace($uri, "", "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}");
  return $bodytag;
}


// Destroy the session
session_destroy();

// Redirect the user to the index
$location = getCurrentUri6() . "/login.php";
header("Location: " . $location );
exit();
