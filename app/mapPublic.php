<?php
	session_start();
	session_regenerate_id();
	function getCurrentUri2() {
		$basepath = implode('/', array_slice(explode('/', $_SERVER['SCRIPT_NAME']), 0, -1)) . '/';
		$uri = substr($_SERVER['REQUEST_URI'], strlen($basepath));
		if (strstr($uri, '?')) $uri = substr($uri, 0, strpos($uri, '?'));
		$uri = '/' . trim($uri, '/');
		$bodytag = str_replace($uri, "", "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}");
		return $bodytag;
	}

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
	
	require_once 'config/db.php';
	// Create the database connection
	$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
	if ($mysqli->connect_errno) {
		echo 'Connection error: (', $mysqli->connect_errno, ') ', $mysqli->connect_error;
	}

	$resource = $mysqli->query('SELECT * FROM businesses WHERE 1');

	
	$resource->free();
	$mysqli->close();

?>


<!DOCTYPE html>
<html>
	<head>
	    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
		<title>Corvallis Sustainability App</title>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBxHi86fAJJ2ki7Yj-pFG3cOBCPQMTonfo"
				type="text/javascript"></script>
		<script type="text/javascript">
			function load() {
				var map = new google.maps.Map(document.getElementById("map"), {
					center: new google.maps.LatLng(44.5482, -123.265),
					zoom: 10
				});
				var infoWindow = new google.maps.InfoWindow;
			      
				// Change this depending on the name of your PHP file
				downloadUrl("phpsqlajax_genxml.php", function(data) {
					var xml = data.responseXML;
					var markers = xml.documentElement.getElementsByTagName("marker");
					for (var i = 0; i < markers.length; i++) {
						var name = markers[i].getAttribute("name");
						var type = markers[i].getAttribute("type");
						var point = new google.maps.LatLng(
							parseFloat(markers[i].getAttribute("latitude")),
							parseFloat(markers[i].getAttribute("longitude")));
						var address = markers[i].getAttribute("address");
						var city = markers[i].getAttribute("city");
						var state = markers[i].getAttribute("state");
						var phone = markers[i].getAttribute("phone");
						var website = markers[i].getAttribute("website");
						var html = "<b>" + name + "</b><br><b>Type: </b>" + type + "</b><br><b>Address: </b>" + address + ", " + city + ", " + state + "</b><br><b>Phone #: </b>" + phone + "</b><br><b>Website: </b>" + website;
						var marker = new google.maps.Marker({
							map: map,
							position: point
						});
						bindInfoWindow(marker, map, infoWindow, html);
					}
				});
			}

			function bindInfoWindow(marker, map, infoWindow, html) {
				google.maps.event.addListener(marker, 'click', function() {
					infoWindow.setContent(html);
					infoWindow.open(map, marker);
				});
			}

			function downloadUrl(url, callback) {
				var request = window.ActiveXObject ?
				new ActiveXObject('Microsoft.XMLHTTP') :
				new XMLHttpRequest;

				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						request.onreadystatechange = doNothing;
						callback(request, request.status);
					}
				};

				request.open('GET', url, true);
				request.send(null);
			}

			function doNothing() {}

		</script>
	</head>

	<body onload="load()">
		<?php include 'partials/navPublic.php';?>
		<div id="map" style="top:-20px; width: 100%; height: 1000px";></div>
	</body>


	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>


	<!-- typeahead -->
	<script src="dependencies/typeahead.js/typeahead.bundle.min.js"></script>
	<script src="dependencies/typeahead.js/typeahead.jquery.min.js"></script>
	<script src="dependencies/typeahead.js/bloodhound.min.js"></script>
	<link href="dependencies/typeahead.js/css.css" rel="stylesheet">

	<script src="dependencies/tags/bootstrap-tagsinput.min.js"></script>
	<link href="dependencies/tags/bootstrap-tagsinput.css" rel="stylesheet">


	<!-- Sweet Alerts -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" >
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	
</html>