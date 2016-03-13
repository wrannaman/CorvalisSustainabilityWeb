<?php
	require 'config/db.php';
		
	// Create the database connection
	$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
	if ($mysqli->connect_errno) {
		echo 'Connection error: (', $mysqli->connect_errno, ') ', $mysqli->connect_error;
	}
	
	$results = $mysqli->query("SELECT * FROM businesses");
	
	function parseToXML($htmlStr) {
		$xmlStr=str_replace('<','&lt;',$htmlStr);
		$xmlStr=str_replace('>','&gt;',$xmlStr);
		$xmlStr=str_replace('"','&quot;',$xmlStr);
		$xmlStr=str_replace("'",'&#39;',$xmlStr);
		$xmlStr=str_replace("&",'&amp;',$xmlStr);
		return $xmlStr;
	}

	header("Content-type: text/xml");
	
	echo '<markers>';
	
	while ($row = $results->fetch_assoc()) {
		echo '<marker ';
		echo 'name="' . parseToXML($row['name']) . '" ';
		echo 'type="' . parseToXML($row['type']) . '" ';
		echo 'latitude="' . parseToXML($row['latitude']) . '" ';
		echo 'longitude="' . parseToXML($row['longitude']) . '" ';
		echo 'address="' . parseToXML($row['address']) . '" ';
		echo 'city="' . parseToXML($row['city']) . '" ';
		echo 'state="' . parseToXML($row['state']) . '" ';
		echo 'phone="' . parseToXML($row['phone']) . '" ';
		echo 'website="' . parseToXML($row['website']) . '" ';
		echo '/>';
	}
	
	echo '</markers>';
?>