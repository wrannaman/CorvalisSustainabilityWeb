<?php
require_once 'config/db.php';
// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) {
  echo 'Connection error: (', $mysqli->connect_errno, ') ', $mysqli->connect_error;
} else {
  echo "db connection ok <br>";
}
// Get the user's food items from the database
$stmt = $mysqli->prepare('SELECT* FROM categories ORDER BY name ASC;');
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

<body>
  <?php include 'partials/nav.php';?>
  <div class="container">

    <table class="table table-striped">
      <thead>
        <tr>
          <th> #id  </th>
          <th> Name </th>
          <th> Edit </th>
        </tr>
      </thead>
      <tbody>
        <?php
        foreach ($businesses as $b) {
          echo "<tr> <th scope='row' class='id'> $b[id] </th> <td class='name'> $b[name] </td> <td><button class='btn btn-primary edit' data-toggle='modal' data-target='#editModal'> Edit </button></td> </tr>";
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
            <h4 class="modal-title" id="myModalLabel">Edit Business</h4>
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


              <input type="text" class="form-control" id="tags" value="red,green,blue" />

            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="saveItems">Save changes</button>
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

<style>
.bootstrap-tagsinput {
  width: 100% !important;
  min-height: 170px !important;
}
</style>

<script>
var items = [];
function tokenize() {

  var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );

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
      console.log('item', item);
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
     // Do some processing here
     console.log('tag', tag);
  });


}
$('body').on('click', '.edit', function(e){
  console.log('event!');

  // set items in modal
  var id        = $(e.target).parent().parent().find('.id').text();
  var name      = $(e.target).parent().parent().find('.name').text();
  $('#id').val(id);
  $('#name').val(name);

  var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );
  //console.log('base ', baseUrl);
  $.ajax({
    url: baseUrl + 'forms/getItems.php',
    method: 'GET',
    dataType: 'json',
    success: function(res) {
      items = res;
      console.log('res', res);
      //sweetAlert("Alright!", "Item Saved Saved!", "success");
      //close modal
      // $('#editModal').modal('hide');
      // $('.modal-backdrop').remove();

      /* Set up typeahead */
      tokenize();
    },
    error: function(error) {
      //sweetAlert("Oops...", "Something went wrong!" + errString, "error");
    }
  });

  $('body').on('click', '#saveItems', function(e){

    console.log('items', $("#tags").tagsinput('items'));
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
  })



})

</script>
</html>
