//rest_doc.js
import AjaxAddress from "./AjaxAddress";

function rest_doc_start () {
  var ajax_address = new AjaxAddress();
  
  var id_to_address = {};
  ajax_address.promise_get_all().then(function(addresses) {
    addresses.forEach( function (address) {
      var id = address['id'];
      id_to_address[id] = address;

    });
    var ids = Object.keys(id_to_address);
    var first_id = ids[0];
    $("#get_address_id").text(first_id);
    $("#put_address_id").text(first_id);
    $("#get_address_id_button").click(function () {
      ajax_address.promise_get_one(first_id).then(function(address) {
        $("#get_address_id_output").text(JSON.stringify(address, null, 4));
      });
    });
  });

  console.log ("rest_doc_start()");
  $("#get_addresses_button").click(function() {
    ajax_address.promise_get_all().then(
      function(addresses) {
        $("#get_addresses_output").text(JSON.stringify(addresses, null, 4));
      }
    );
  });
  
  var post_data = {
    street : "384 W Carribean Dr",
    city   : "Sunnyvale",
    state  : "CA",
    zip    : 94089
  };
  $("#post_address_body").text(JSON.stringify(post_data, null, 4));
  $("#post_address_button").click(function() {
    ajax_address.promise_post(post_data).then( function(address) {
      $("#post_address_output").text(JSON.stringify(address, null, 4));
    });
  });
  
  var put_data = {
    street : "3051 Corvin Dr",
    city   : "Santa Clara",
    state  : "CA",
    zip    : 95051
  };
  $("#put_address_body").text(JSON.stringify(put_data, null, 4));
  $("#put_address_button").click(function() {
    put_data["id"] = $("#put_address_id").text();
    console.log("put: " + put_data["id"]);
    ajax_address.promise_put(put_data).then( function (address) {
      //console.log("promise_put resolves");
      //console.log(address);
      $("#put_address_output").text(JSON.stringify(address, null, 4));
    });
  });
}


$(document).ready(function() {
  rest_doc_start();
});

