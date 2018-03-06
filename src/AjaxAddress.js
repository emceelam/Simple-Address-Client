import Conf from '../address_app.conf.json';
  // webpack import

export default class AjaxAddresses {
  constructor( output_error = console.log) {
    this.output_error = output_error;   // output_error("error text")
  }

  promise_get_all () {
    return new Promise( (resolve) => {
      $.ajax({
        type: "GET",
        url: `http://${Conf.host}:${Conf.port}/api/addresses`,
        success: resolve,
        error: this.reject.bind(this),
      });
    });
  }
  promise_get_one (id) {
    return new Promise( (resolve) => {
      $.ajax({
        type: "GET",
        url: `http://${Conf.host}:${Conf.port}/api/addresses/${id}`,
        success: resolve,
        error: this.reject.bind(this),
      });
    });
  }
  promise_delete (id) {
    return new Promise ( (resolve) => {
      $.ajax({
        type: "DELETE",
        url: `http://${Conf.host}:${Conf.port}/api/addresses/${id}`,
        xhrFields: {
          withCredentials: true
        },
        success: resolve,
        error: this.reject.bind(this),
      });
    });
  }
  promise_post (addr_data) {
    return new Promise ( (resolve) => {
      $.ajax({
        type: "POST",
        url: `http://${Conf.host}:${Conf.port}/api/addresses`,
        xhrFields: {
          withCredentials: true
        },
        data : JSON.stringify(addr_data),
        headers: {
          "Content-Type" : "application/json",
        },
        dataType: "json",
        success: resolve,
        error: this.reject.bind(this),
      });
    });
  }
  promise_put (address) {
    var id = address["id"];
    delete address["id"];
    return new Promise ( (resolve) => {
      $.ajax({
        type: "PUT",
        url: `http://${Conf.host}:${Conf.port}/api/addresses/${id}`,
        xhrFields: {
          withCredentials: true
        },
        data: JSON.stringify(address),
        headers: {
          "Content-Type" : "application/json",
        },
        dataType: "json",
        success: resolve,
        error: this.reject.bind(this),
      });
    });
  }

  promise_geocode (address) {
    var street = encodeURI(address["street"]);
    var city   = encodeURI(address["city"]);
    var state  = encodeURI(address["state"]);
    var zip    = encodeURI(address["zip"]);
    return new Promise ( (resolve) => {
      $.ajax({
        type: "GET",
        url: `http://${Conf.host}:${Conf.port}/api/geocode?street=${street}&city=${city}&state=${state}&zip=${zip}`,
        success: resolve,
        error: this.reject.bind(this),
      });
    });
  }

  // error function for failed AJAX call
  reject (xhr, textStatus, errorThrown) {
    let error_out = "";

    if (xhr.readyState == 0) {
      error_out = `Could not connect to ${Conf.host}:${Conf.port}`;
    }
    else {  // generic error
      error_out = `ajax failed: ${textStatus}, ${errorThrown}, ${xhr.responseText}`;
    }
    this.output_error (error_out);
  }
}

