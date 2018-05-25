//rest_doc.js
import AjaxAddress from "./AjaxAddress";

function rest_doc_start () {
  var ajax_address = new AjaxAddress(
    (errorText) => { $("#error").show(300).text(errorText); }
  );
  var id_to_address = {};

  ajax_address.done_get_all (function (addresses, parm2, xhr) {
    addresses.forEach( function (address) {
      let id = address['id'];
      id_to_address[id] = address;
    });

    console.log(id_to_address);
    set_button_address_id(id_to_address);
    $("#get_address_id_button").click(function () {
      let id = $("#get_address_id").text();
      ajax_address.done_get_one(id, function(address, parm2, xhr) {
        $("#card_get_address .result_body").text(JSON.stringify(address, null, 4));
        let status_line = `${xhr.status} ${xhr.statusText}`;
        $("#card_get_address>div.card-header").text(status_line);
      });
    });
  });

  console.log ("rest_doc_start()");
  $("#get_addresses_button").click(function() {
    ajax_address.done_get_all(function (addresses, parm2, xhr) {
      $("#card_get_addresses .result_body").text(JSON.stringify(addresses, null, 4));
      let status_line = `${xhr.status} ${xhr.statusText}`;
      $("#card_get_addresses>div.card-header").text(status_line);
    });
  });
  
  var post_data = {   // Weird Stuff Warehouse
    street : "384 W Carribean Dr",
    city   : "Sunnyvale",
    state  : "CA",
    zip    : 94089
  };
  $("#post_address_body").text(JSON.stringify(post_data, null, 4));
  $("#post_address_button").click(function() {
    ajax_address.done_post(post_data, function(address, parm2, xhr) {
      let id = address["id"];
      id_to_address[id] = address;
      set_button_address_id (id_to_address);
      $("#card_post_address .result_body").text(JSON.stringify(address, null, 4));
      let status_line = `${xhr.status} ${xhr.statusText}`;
      $("#card_post_address>.card-header").text(status_line);
    });
  });

  $("#delete_address_button").click(function() {
    var delete_id = $("#delete_address_id").text();
    ajax_address.done_delete(delete_id, function(parm1,parm2,xhr) {
      let address = id_to_address[delete_id];
      delete id_to_address[delete_id];
      set_button_address_id(id_to_address);
      //$("#card_delete_address .result_body").text(JSON.stringify(address, null, 4));
      let status_line = `${xhr.status} ${xhr.statusText}`;
      $("#card_delete_address>.card-header").text(status_line);
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
    ajax_address.done_put(put_data, function(address, parm2, xhr) {
      $("#card_put_address .result_body").text(JSON.stringify(address, null, 4));
      let status_line = `${xhr.status} ${xhr.statusText}`;
      $("#card_put_address>.card-header").text(status_line);
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


