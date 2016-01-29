<?php
require_once 'config/db.php';
// Create the database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($mysqli->connect_errno) {
  echo 'Connection error: (', $mysqli->connect_errno, ') ', $mysqli->connect_error;
} else {
  echo "db connection ok <br>";
}
// Get the user's categories &  items
$stmt = $mysqli->prepare('SELECT* FROM categories ORDER BY id ASC;');
if ($stmt->execute()) {
  $result = $stmt->get_result();
  $businesses = $result->fetch_all(MYSQLI_ASSOC);
}
$stmt->fetch();
$stmt->close();

$stmt = $mysqli->prepare('SELECT categories.id as cat_id, categories.name as cat_name, items.id as item_id, items.name as item_name from categories LEFT OUTER JOIN itemMap ON itemMap.category_id = categories.id LEFT OUTER JOIN items on itemMap.item_id = items.id ORDER BY categories.name ASC;');
if ($stmt->execute()) {
  $result = $stmt->get_result();
  $items = $result->fetch_all(MYSQLI_ASSOC);
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
    <div class="col-xs-12">
      <div class="row group">
        <div class="btn-group">
          <button  class="btn btn-primary"> Add A New Category </button>
          <button  class="btn btn-default"> Add A New Item </button>
        </div>
      </div>
    </div>

    <table class="table table-striped">
      <thead>
        <tr>
          <th> #id   </th>
          <th> Name  </th>
          <th> Items </th>
          <th> Edit  </th>
        </tr>
      </thead>
      <tbody>
        <?php
        foreach ($businesses as $b) {
          echo "<tr> <th scope='row' class='id'> $b[id] </th> <td class='name'> $b[name] </td><td><ul class='items'>";
          for($i=0; $i<count($items); $i++) {
            if ( $items[$i]['cat_id'] == $b['id'] )  echo "<li>  " . $items[$i]['item_name'] . "  </li>";
          }
          echo "</ul></td> <td><button class='btn btn-primary edit' data-toggle='modal' data-target='#editModal'> Edit </button></td> </tr>";
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
            <h4 class="modal-title" id="myModalLabel">Edit Category and Items</h4>
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


              <input type="text" class="form-control" id="tags" value="" />

            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="saveItems" data-dismiss="modal">Save changes</button>
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
  console.log('event!');
  editing = e;


  // set items in modal
  var id        = $(e.target).parent().parent().find('.id').text();
  var name      = $(e.target).parent().parent().find('.name').text();
  var cat_items     = $(e.target).parent().parent().find('.items').text();

  console.log('id', id, name, cat_items);
  $('#id').val(id.trim());
  $('#name').val(name.trim());
  cat_items = cat_items.split('   ');
  existingItems = cat_items.map(function(i,idx){
    if (i.length === 0)
    {
      console.log('no zero');
      return "-1";
    }
    return i.trim();
  });

  var baseUrl = window.location.href.substr( 0, window.location.href.lastIndexOf('/') + 1 );
  //console.log('base ', baseUrl);
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
  // send selectedArray and the current item's name

  $.ajax({
    url: baseUrl + 'forms/saveItems.php',
    method: 'POST',
    data: JSON.stringify({selected: selectedArray, name: $('#name').val(), id: Number($('#id').val())}),
    dataType: 'json',
    success: function(res) {
      console.log('save res', res);
      $(editing.target).parent().parent().find('.name').text($('#name').val());
      var htmlString = "";
      selectedArray.forEach(function(s,i){
         htmlString += "<li>" + s.name + "   </li>";
      })
      console.log('html string', htmlString);
      $(editing.target).parent().parent().find('.items').html(htmlString);
      // add items to that row
      sweetAlert("Alright!", "Category and Items Saved!", "success");
    },
    error: function(error) {
      console.error('error', error);
    }
  });

})

</script>
</html>
