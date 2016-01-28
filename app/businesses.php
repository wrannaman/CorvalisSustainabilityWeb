<?php
require_once 'config/db.php';
// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) {
  echo 'Connection error: (', $mysqli->connect_errno, ') ', $mysqli->connect_error;
} else {
  echo "db connection ok <br>";
}

// Get the businesses from the database
$stmt = $mysqli->prepare(
  'SELECT* FROM businesses ORDER BY name ASC;'
);
if ($stmt->execute()) {
  $result = $stmt->get_result();
  $businesses = $result->fetch_all(MYSQLI_ASSOC);
}
$stmt->fetch();
$stmt->close();
?>
<!DOCTYPE html>
<html>
<head>
  <title>Corvalis Sustainability App</title>
</head>
<style>
.website {
  max-width: 200px;
  padding-right: 10px !important;
  overflow-wrap: break-word;
}
</style>

<body>
  <?php include 'partials/nav.php';?>
  <div class="container">

    <table class="table table-striped">
      <thead>
        <tr>
          <th>id</th>
          <th>Business Name</th>
          <th>Address</th>
          <th>City</th>
          <th>State</th>
          <th>Phone</th>
          <th class="website">Website</th>
          <th>Notes</th>
          <th>Latitude</th>
          <th>Longitude</th>
          <th> Edit </th>
        </tr>
      </thead>
      <tbody>
        <?php
          foreach ($businesses as $b) {
            echo "<tr> <th scope='row' class='id'> $b[id] </th> <td class='name'> $b[name] </td> <td class='address'> $b[address] </td> <td class='city'>$b[city]</td> <td class='state'> $b[state] </td> <td class='phone'>$b[phone]</td> <td class='website'>$b[website]</td> <td class='notes'>$b[notes]</td> <td class='latitude'>$b[latitude]</td> <td class='longitude'>$b[longitude]</td> <td> <button class='btn btn-primary edit' data-toggle='modal' data-target='#editModal'> Edit </button></td> </tr>";
          }
        ?>
      </tbody>
    </table>

  </div>

  <!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Business</h4>
      </div>
      <div class="modal-body">

        <form id="editForm">
          <div class="form-group">
            <label for="exampleInputEmail1">id</label>
            <input type="text" class="form-control" id="id" placeholder="id" disabled>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Business Name</label>
            <input type="text" class="form-control" id="name" placeholder="Name">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Address</label>
            <input type="text" class="form-control" id="address" placeholder="Address">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">City</label>
            <input type="text" class="form-control" id="city" placeholder="City">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">State</label>
            <input type="text" class="form-control" id="state" placeholder="State">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Phone</label>
            <input type="text" class="form-control" id="phone" placeholder="Phone">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Website</label>
            <input type="text" class="form-control" id="website" placeholder="Website">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Notes</label>
            <input type="text" class="form-control" id="notes" placeholder="Notes">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Latitude</label>
            <input type="number" class="form-control" id="latitude" placeholder="Latitude">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Longitude</label>
            <input type="number" class="form-control" id="longitude" placeholder="Longitude">
          </div>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="saveBussiness">Save changes</button>
      </div>
    </div>
  </div>
</div>

</body>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>

<!-- Sweet Alerts -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<script>
/* Put data in modal */
var editing;
$('body').on('click', '.edit', function(e){
  console.log('clicked', $(e.target));
  editing = e;

  var id        = $(e.target).parent().parent().find('.id').text();
  var name      = $(e.target).parent().parent().find('.name').text();
  var address   = $(e.target).parent().parent().find('.address').text();
  var city      = $(e.target).parent().parent().find('.city').text();
  var state     = $(e.target).parent().parent().find('.state').text();
  var phone     = $(e.target).parent().parent().find('.phone').text();
  var website   = $(e.target).parent().parent().find('.website').text();
  var notes     = $(e.target).parent().parent().find('.notes').text();
  var latitude  = $(e.target).parent().parent().find('.latitude').text();
  var longitude = $(e.target).parent().parent().find('.longitude').text();


  $('#id').val(id);
  $('#name').val(name);
  $('#address').val(address);
  $('#city').val(city);
  $('#state').val(state);
  $('#phone').val(phone);
  $('#website').val(website);
  $('#notes').val(notes);
  $('#latitude').val(latitude);
  $('#longitude').val(longitude);

  // console.log('name', name);
  // console.log('address', address);
  // console.log('city', city);
  // console.log('state', state);
  // console.log('phone', phone);
  // console.log('website', website);
  // console.log('notes', notes);
  // console.log('latitude', latitude);
  // console.log('longitude', longitude);

});

$('body').on('click', '#saveBussiness', function(e){

  var data = {
    id        : $('#id').val().trim(),
    name      : $('#name').val().trim(),
    address   : $('#address').val().trim(),
    city      : $('#city').val().trim(),
    state     : $('#state').val().trim(),
    phone     : $('#phone').val().trim(),
    website   : $('#website').val().trim(),
    notes     : $('#notes').val().trim(),
    latitude  : $('#latitude').val().trim() ? Number($('#latitude').val().trim()) : -1,
    longitude : $('#longitude').val().trim() ? Number($('#longitude').val().trim()) : -1,
  }

  //console.log('* * Form Submission * *');
  //console.log('data', data);

  /* Post to /forms/businesses to save */
  // Submit #add-item-form using AJAX
  var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );
  //console.log('base ', baseUrl);
  $.ajax({
    url: baseUrl + 'forms/business.php',
    method: 'POST',
    data: data,
    dataType: 'json',
    success: function(res) {

      sweetAlert("Alright!", "Business Saved!", "success");

      // update table
      $(editing.target).parent().parent().find('.id').text(data.id);
      $(editing.target).parent().parent().find('.name').text(data.name);
      $(editing.target).parent().parent().find('.address').text(data.address);
      $(editing.target).parent().parent().find('.city').text(data.city);
      $(editing.target).parent().parent().find('.state').text(data.state);
      $(editing.target).parent().parent().find('.phone').text(data.phone);
      $(editing.target).parent().parent().find('.website').text(data.website);
      $(editing.target).parent().parent().find('.notes').text(data.notes);
      $(editing.target).parent().parent().find('.latitude').text(data.latitude);
      $(editing.target).parent().parent().find('.longitude').text(data.longitude);

      //close modal
      $('#editModal').modal('hide');
      $('.modal-backdrop').remove();
    },
    error: function(error) {
      console.error('error', error);
      var err = null;
      if ( error && typeof(error.responseText) !== 'undefined')
      {
        err = JSON.parse(error.responseText);
        console.log('err', err);
      }
      var errString = "";
      if (err && typeof(err.errors) != 'undefined'  && err.errors.length > 0)
      {
        err.errors.forEach(function( e, i){
          errString += " " + e;
        })
      }
      console.log('err string', errString);

      sweetAlert("Oops...", "Something went wrong!" + errString, "error");
    }
  });


})

</script>
</html>
