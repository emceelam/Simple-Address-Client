//rest_doc.js
import AjaxAddress from "./AjaxAddress";

function rest_doc_start () {
  var ajax_address = new AjaxAddress(
    (errorText) => { $("#error").show(300).text(errorText); }
  );
  var id_to_address = {};

  ajax_address.promise_get_all().then(function(addresses) {
    addresses.forEach( function (address) {
      let id = address['id'];
      id_to_address[id] = address;
    });

    set_button_address_id(id_to_address);
    $("#get_address_id_button").click(function () {
      let id = $("#get_address_id").text();
      ajax_address.promise_get_one(id).then(function(address) {
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
      let id = address["id"];
      id_to_address[id] = address;
      set_button_address_id (id_to_address);
      $("#post_address_output").text(JSON.stringify(address, null, 4));
    });
  });

  $("#delete_address_button").click(function() {
    var delete_id = $("#delete_address_id").text();
    ajax_address.promise_delete(delete_id).then( function (data) {
      console.log (`delete ${delete_id}`);
      delete id_to_address[delete_id];
      set_button_address_id(id_to_address);
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

function set_button_address_id(id_to_address) {
  let ids = Object.keys(id_to_address);
  let id = ids.length ? ids[0] : "{id}";
  $("#get_address_id").text(id);
  $("#put_address_id").text(id);
  $("#delete_address_id").text(id);

  if (ids.length) {
    return;
  }

  $("#get_address_id_button").prop("disabled", true);
  $("#put_address_button").prop("disabled", true);
  $("#delete_address_button").prop("disabled", true);
}


