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

if(!isset($_SESSION['user']))      // if there is no valid session
{
    $location = getCurrentUri2() . "/login.php";
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

// Get the businesses from the database
$stmt = $mysqli->prepare(
  'SELECT * FROM businesses ORDER BY id ASC;'
);
if ($stmt->execute()) {
  $result = $stmt->get_result();
  $businesses = $result->fetch_all(MYSQLI_ASSOC);
}
$stmt->fetch();
$stmt->close();

$stmt = $mysqli->prepare('SELECT businesses.id as bz_id, businesses.name as bz_name, items.id as item_id, items.name as item_name from businesses LEFT OUTER JOIN busMap ON busMap.bus_id = businesses.id LEFT OUTER JOIN items on busMap.item_id = items.id ORDER BY businesses.id ASC;');
if ($stmt->execute()) {
  $result = $stmt->get_result();
  $items = $result->fetch_all(MYSQLI_ASSOC);
}


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

  .bootstrap-tagsinput {
      width: 100% !important;
      min-height: 170px !important;
  }
  ul {
    display: inline;
  }
  li {
    float: left;
    width: auto;
    margin-left: 10px;
  }
  .items-td {
    border-top: none !important;
  }
  .group {
    margin: 0 auto;
    width: 376px;
    margin-bottom: 25px;
    margin-top: 25px;
    outline: 1px solid #606060;
    padding: 20px;
    text-align: center;
  }
  .row.group {
    margin: 0 auto;
    margin-bottom: 25px;
  }
  .inline {
    display: inline;
    width: 100%;
  }
  .inline:after {
     visibility: hidden;
     display: block;
     font-size: 0;
     content: " ";
     clear: both;
     height: 0;
  }
  .radio-inline {
    float:left;
    width: 100px;
  }
</style>

<body>
  <?php include 'partials/nav.php';?>
  <div class="container">

    <div class="col-xs-12">
      <div class="row group">
        <div class="btn-group">
          <button  class="btn btn-primary" data-toggle='modal' data-target='#busModal'> Add A New Business </button>
        </div>
      </div>
    </div>

    <table class="table table-striped">
      <thead>
        <tr>
          <th>id</th>
          <th>Business Name</th>
          <th>Type</th>
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
            echo "<tr> <th scope='row' class='id'> $b[id] </th> <td class='name'> $b[name] </td> <td class='type'> $b[type] </td> <td class='address'> $b[address] </td> <td class='city'>$b[city]</td> <td class='state'> $b[state] </td> <td class='phone'>$b[phone]</td> <td class='website'>$b[website]</td> <td class='notes'>$b[notes]</td> <td class='latitude'>$b[latitude]</td> <td class='longitude'>$b[longitude]</td> <td> <button class='btn btn-primary edit' data-toggle='modal' data-target='#editModal'> Edit </button></td>";
            echo "</tr><tr class='items-tr'><td class='items-td' colspan='11'>  <div class='items-div'> <ul class='items-" . $b['id']  ."'>";
            // loop
            for($i=0; $i<count($items); $i++) {
              if ( $items[$i]['bz_id'] == $b['id'] )  echo "<li>  " . $items[$i]['item_name'] . "  </li>";
            }
            echo "</ul> </div> </td></tr>";
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
          <div class="form-group" style="display:none;">
            <label for="exampleInputEmail1">id</label>
            <input type="text" class="form-control" id="id" placeholder="id" disabled>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Business Name</label>
            <input type="text" class="form-control" id="name" placeholder="Name">
          </div>
          <div class="form-group inline">
            <div class="radio radio-inline">
              <label><input type="radio" name="type" value="reuse">Reuse</label>
            </div>
            <div class="radio radio-inline" style="margin-top: 10px;">
              <label><input type="radio" name="type" value="repair">Repair</label>
            </div>
            <div class="radio radio-inline" style="margin-top: 10px;">
              <label><input type="radio" name="type" value="both">Both</label>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Address</label>
            <input type="text" class="form-control" id="address" placeholder="Address">
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">City</label>
                <input type="text" class="form-control" id="city" placeholder="City">
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">State</label>
                <input type="text" class="form-control" id="state" placeholder="State">
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Phone</label>
                <input type="text" class="form-control" id="phone" placeholder="Phone">
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">Website</label>
                <input type="text" class="form-control" id="website" placeholder="Website">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Notes</label>
            <input type="text" class="form-control" id="notes" placeholder="Notes">
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Longitude</label>
                <input type="number" class="form-control" id="longitude" placeholder="Longitude">
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">Latitude</label>
                <input type="number" class="form-control" id="latitude" placeholder="Latitude">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Items</label>
            <input type="text" class="form-control" id="tags" value="" />
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="deleteBusiness" data-dismiss="modal">Delete</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="saveBussiness">Save changes</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="busModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Create A Business</h4>
      </div>
      <div class="modal-body">

        <form id="createForm">
          <div class="form-group" style="display:none;">
            <label for="exampleInputEmail1">id</label>
            <input type="text" class="form-control" id="id1" placeholder="id" disabled>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Business Name</label>
            <input type="text" class="form-control" id="name1" placeholder="Name">
          </div>
          <div class="form-group inline">
            <div class="radio radio-inline">
              <label><input type="radio" name="type" value="reuse">Reuse</label>
            </div>
            <div class="radio radio-inline" style="margin-top: 10px;">
              <label><input type="radio" name="type" value="repair">Repair</label>
            </div>
            <div class="radio radio-inline" style="margin-top: 10px;">
              <label><input type="radio" name="type" value="both">Both</label>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Address</label>
            <input type="text" class="form-control" id="address1" placeholder="Address">
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">City</label>
                <input type="text" class="form-control" id="city1" placeholder="City">
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">State</label>
                <input type="text" class="form-control" id="state1" placeholder="State">
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Phone</label>
                <input type="text" class="form-control" id="phone1" placeholder="Phone">
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">Website</label>
                <input type="text" class="form-control" id="website1" placeholder="Website">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Notes</label>
            <input type="text" class="form-control" id="notes1" placeholder="Notes">
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Longitude</label>
                <input type="number" class="form-control" id="longitude1" placeholder="Longitude">
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">Latitude</label>
                <input type="number" class="form-control" id="latitude1" placeholder="Latitude">
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="createBus">Save changes</button>
      </div>
    </div>
  </div>
</div>

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

<script>
/* Put data in modal */
var editing;
var items   = [];
var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );

function tokenize() {


  var bh = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: items,
  });
  bh.initialize();

  $('#tags').tagsinput({
    allowDuplicates: false,
    trimValue: true,
    itemText: function(item) {
      //console.log('item', item);
      return item;
    },
    typeaheadjs: {
      name: 'items',
      displayKey: 'name',
      valueKey: 'name',
      source: bh.ttAdapter(),
    }
  });
  $('#tags').tagsinput({
    onTagExists: function(item, $tag) {
      $tag.hide().fadeIn();
    }
  });

  $('#tags').on('beforeItemAdd', function(event) {
     var tag = event.item;

     for (var i=0; i<items.length; i++) {
       if (items[i].name.indexOf(tag) !== -1) {
         // allow them to add it.
         return true
       }
     }
     event.cancel = true;
  });

  $('#tags').tagsinput('removeAll');
  existingItems.forEach(function(e,i){
    if(e) $('#tags').tagsinput('add', e);
  })


}
$('body').on('click', '.edit', function(e){
  console.log('clicked', $(e.target));
  editing = e;

  var id        = $(e.target).parent().parent().find('.id').text();
  var name      = $(e.target).parent().parent().find('.name').text();
  var type      = $(e.target).parent().parent().find('.type').text();
  var address   = $(e.target).parent().parent().find('.address').text();
  var city      = $(e.target).parent().parent().find('.city').text();
  var state     = $(e.target).parent().parent().find('.state').text();
  var phone     = $(e.target).parent().parent().find('.phone').text();
  var website   = $(e.target).parent().parent().find('.website').text();
  var notes     = $(e.target).parent().parent().find('.notes').text();
  var latitude  = $(e.target).parent().parent().find('.latitude').text();
  var longitude = $(e.target).parent().parent().find('.longitude').text();
  var query     = '.items-' + id.trim();
  var cat_items = $(query).text();
  console.log('id', query);
  console.log('cat_items', cat_items);


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

  var $radios = $('input:radio[name=type]');

  $radios.prop('checked', false);
  $radios.filter('[value=' + type +']').prop('checked', true);

  cat_items = cat_items.split('   ');
  existingItems = cat_items.map(function(i,idx){
    if (i.length === 0)
    {
      return "-1";
    }
    return i.trim();
  });

  $.ajax({
    url: baseUrl + 'forms/getItems.php',
    method: 'GET',
    dataType: 'json',
    success: function(res) {
      items = res;
      //console.log('res', res);
      /* Set up typeahead */
      tokenize();
    },
    error: function(error) {
      sweetAlert("Oops...", "Something went wrong!" + error, "error");
    }
  });

});

$('body').on('click', '#saveBussiness', function(e){

  var data = {
    id        : $('#id').val().trim(),
    name      : $('#name').val().trim(),
    type      : $('input[name=type]:checked', '#editForm').val(),
    address   : $('#address').val().trim(),
    city      : $('#city').val().trim(),
    state     : $('#state').val().trim(),
    phone     : $('#phone').val().trim(),
    website   : $('#website').val().trim(),
    notes     : $('#notes').val().trim(),
    latitude  : $('#latitude').val().trim() ? Number($('#latitude').val().trim()) : -1,
    longitude : $('#longitude').val().trim() ? Number($('#longitude').val().trim()) : -1,
  }

  console.log('type', data.type);

  var selected = $("#tags").tagsinput('items');
  var selectedArray = [];
  items.forEach(function(it,idx){
    for (var i = 0; i< selected.length; i++ ) {
      if (it.name.indexOf(selected[i]) !== -1 ) {
        selectedArray.push(it);
        break;
      }
    }
  });
  console.log('final selected items', selectedArray);
  data.selected = selectedArray;

  //console.log('* * Form Submission * *');
  console.log('data', data);

  /* Post to /forms/businesses to save */
  // Submit #add-item-form using AJAX
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

$('body').on('click', '#deleteBusiness', function(e){
  var id        = $('#id').val();
  var name      = $('#name').val();
  var displayName =  name.length > 10 ? (name.substr(0,10) + ' ... ') : name;

  console.log('deleting', id, name);
  swal({
    title: "Are you sure?",
    text: "You will not be able to undo this!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Yes, delete " + displayName + "!",
    closeOnConfirm: false },
    function(){
      // do actual delete
      console.log('actual delete here', id);

      $.ajax({
        url: baseUrl + 'forms/deleteBusiness.php',
        method: 'POST',
        data: JSON.stringify({id: id}),
        dataType: 'json',
        success: function(res) {
          console.log('save res', res);
          $(editing.target).parent().parent().remove();

          swal("Deleted!", "The business has been deleted.", "success");
        },
        error: function(error) {
          console.error('error', error);
          swal("Error!", "There was an error deleting this business", "error");
        }
      });
    });


})

$('body').on('click', '#createBus', function(e){
  console.log('create');

  var data = {
    name      : $('#name1').val(),
    type      : $('input[name=type]:checked', '#createForm').val(),
    address   : $('#address1').val(),
    city      : $('#city1').val(),
    state     : $('#state1').val(),
    phone     : $('#phone1').val(),
    website   : $('#website1').val(),
    notes     : $('#notes1').val(),
    latitude  : $('#latitude1').val(),
    longitude : $('#longitude1').val(),
  }

  console.log('data type', data.type);

  if ( !data.name ) return swal("Error!", "A business needs a name.", "error");

  $.ajax({
    url: baseUrl + 'forms/createBusiness.php',
    method: 'POST',
    data: JSON.stringify(data),
    dataType: 'json',
    success: function(res) {
      console.log('save res', res);
      swal("Created!", "The business has been created.", "success");
    },
    error: function(error) {
      console.error('error', error);
      swal("Error!", "There was an error creating this business", "error");
    }
  });





})
</script>
</html>
