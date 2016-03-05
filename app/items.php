<?php
session_start();
session_regenerate_id();
function getCurrentUri4() {
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

if(!isset($_SESSION['user']))      // if there is no valid session
{
    $location = getCurrentUri4() . "/login.php";
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
// Get the user's categories &  items
$stmt = $mysqli->prepare('SELECT* FROM items ORDER BY id ASC;');
if ($stmt->execute()) {
  $result = get_result( $stmt );
  $items = $result;
}
$stmt->fetch();
$stmt->close();
?>
<!DOCTYPE html>
<html>
<head>
  <title>Corvallis Sustainability App</title>
</head>

<body>
  <?php include 'partials/nav.php';?>
  <div class="container">
    <div class="col-xs-12">
      <div class="row group">
        <div class="btn-group">
          <button  class="btn btn-default" data-toggle='modal' data-target='#itModal'> Add A New Item </button>
        </div>
      </div>
    </div>

    <table class="table table-striped">
      <thead>
        <tr>
          <th> #id     </th>
          <th> Name    </th>
          <th> Edit    </th>
          <th> Delete  </th>
        </tr>
      </thead>
      <tbody>
        <?php
        foreach ($items as $b) {
          echo "<tr> <th scope='row' class='id'> $b[id] </th> <td class='name'> $b[name] </td> <td><button class='btn btn-primary edit' data-toggle='modal' data-target='#editModal'> Edit </button></td> <td><button class='btn btn-primary delete'> Delete </button></td></tr>";
        }
        ?>
      </tbody>
    </table>


    <!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Edit Item</h4>
          </div>
          <div class="modal-body">

            <form id="editForm">
              <div class="form-group">
                <label for="exampleInputEmail1">id</label>
                <input type="text" class="form-control" id="id" placeholder="id" disabled>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">name</label>
                <input type="text" class="form-control" id="name" placeholder="name" >
              </div>

            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="saveItems" data-dismiss="modal">Save changes</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="catModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Add A Category</h4>
          </div>
          <div class="modal-body">

            <form id="addCatForm">
              <div class="form-group">
                <label for="exampleInputEmail1">name</label>
                <input type="text" class="form-control" id="catName" placeholder="name" >
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="saveCat" data-dismiss="modal">Add Category</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="itModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Add A Category</h4>
          </div>
          <div class="modal-body">

            <form id="addCatForm">
              <div class="form-group">
                <label for="exampleInputEmail1">name</label>
                <input type="text" class="form-control" id="itName" placeholder="name" >
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="saveIt" data-dismiss="modal">Add Item</button>
          </div>
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

<style>
.bootstrap-tagsinput {
  width: 100% !important;
  min-height: 170px !important;
}
ul {
  max-height: 250px;
  overflow: scroll;
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
</style>

<script>
var items = [];
var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );
var existingItems = [];
var editing;
$('body').on('click', '.edit', function(e){
  editing = e;
  // set items in modal
  var id        = $(e.target).parent().parent().find('.id').text();
  var name      = $(e.target).parent().parent().find('.name').text();

  $('#id').val(id.trim());
  $('#name').val(name.trim());

  console.log('id', id, name);

});
$('body').on('click', '#saveItems', function(e){

  $('#id').val();
  $('#name').val();
  console.log('save items', id, name);

  $.ajax({
    url: baseUrl + 'forms/editItem.php',
    method: 'POST',
    data: JSON.stringify({ name: $('#name').val(), id: Number($('#id').val())}),
    dataType: 'json',
    success: function(res) {
      console.log('save res', res);
      // $(editing.target).parent().parent().find('.name').text($('#name').val());
      // var htmlString = "";
      // selectedArray.forEach(function(s,i){
      //    htmlString += "<li>" + s.name + "   </li>";
      // })
      // console.log('html string', htmlString);
      // $(editing.target).parent().parent().find('.items').html(htmlString);
      // // add items to that row
      sweetAlert("Alright!", "Item Updated!", "success");
    },
    error: function(error) {
      console.error('error', error);
      sweetAlert("Oops!", "There was an error saving this item.", "error");

    }
  });

})
$('body').on('click', '#saveIt', function(e){
  console.log('here');
  var name =  $('#itName').val();
  if ( name.trim() === '' ) return sweetAlert("Oops...", "please enter a name", "error");

  console.log('save it', name);
  $.ajax({
    url: baseUrl + 'forms/saveItem.php',
    method: 'POST',
    data: JSON.stringify({name: name}),
    dataType: 'json',
    success: function(res) {
      console.log('save res', res);
      sweetAlert("Alright!", "Item was created successfully!", "success");
    },
    error: function(error) {
      console.error('error', error);
    }
  });
})
$('body').on('click', '.delete', function(e){
  editing = e;
  var id        = $(e.target).parent().parent().find('.id').text();
  var name      = $(e.target).parent().parent().find('.name').text();

  console.log('deleting', id, name);
  swal({
    title: "Are you sure?",
    text: "You will not be able to undo this!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Yes, delete " + name + "!",
    closeOnConfirm: false },
    function(){
      // do actual delete
      console.log('actual delete here', id);

      $.ajax({
        url: baseUrl + 'forms/deleteItem.php',
        method: 'POST',
        data: JSON.stringify({id: id}),
        dataType: 'json',
        success: function(res) {
          console.log('save res', res);
          $(editing.target).parent().parent().remove();

          swal("Deleted!", "The item has been deleted.", "success");
        },
        error: function(error) {
          console.error('error', error);
          swal("Error!", "There was an error deleting this item", "error");
        }
      });
    });



})
</script>
</html>
