<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Simple Address App</title>
    <meta charset=utf-8 />
    <meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
      crossorigin="anonymous">
    <style>
      #gmap {
        width:100%;
        height:400px;
        border:thin solid black;
      }
      #error {
        display:none;
      }
    </style>
  </head>
  <body>
    <div class='container-fluid'>
      <div class="alert alert-danger" id="error"></div>
      <h1>Simple Address App</h1>
      <div class="row">
        <div class="col-4">
          <button type="button" class="btn btn-primary" style="float:right"
            data-toggle="modal" data-target="#form_modal" data-whatever="New Address"
            id="new_address">
            New Address
          </button>
          <h3>Current addresses</h3>
          <ul class="list-group" id="list_addresses">
          </ul>
        </div>
        <div class="col-8">
          <div id="gmap">
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="form_modal" tabindex="-1" role="dialog" 
      aria-labeledby="address_title" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="address_title">Address</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="street">Street</label>
                <input type="text" class="form-control" id="street" name="street"
                      placeholder="Street">
              </div>
              <div class="form-group">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city" name="city"
                      placeholder="City">
              </div>
              <div class="form-group">
                <label for="state">State</label>
                <input type="text" class="form-control" id="state" name="state"
                      placeholder="CA">
              </div>
              <div class="form-group">
                <label for="zip">Zip</label>
                <input type="text" class="form-control" id="zip" name="zip"
                      placeholder="Zip">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">
              Cancel
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal"
              id="save_address">
              Save
            </button>
          </div>
        </div>
      </div>
    </div>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
      integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
      crossorigin="anonymous"></script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=${api_key}&callback=initMap"
      type="text/javascript">
    </script>

    <!-- webpack bundling of multiple javascript files -->
    <script src="app.bundle.js"></script>

  </body>
</html>
<!--
25800 Carlos Bee Blvd, Hayward, CA 94542
25555 Hesperian Blvd, Hayward, CA 94545
43600 Mission Blvd, Fremont, CA 94539
21250 Stevens Creek Blvd, Cupertino, CA 95014
3095 Yerba Buena Rd, San Jose, CA 95135
3000 Mission College Blvd, Santa Clara, CA 95054
450 Serra Mall, Stanford, CA 94305
2100 Moorpark Ave, San Jose, CA 95128
1 Washington Sq, San Jose, CA 95192
-->
