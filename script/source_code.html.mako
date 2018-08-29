<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Simple Address Client</title>
    <meta charset="utf-8">
    <meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" media="screen" href="css/master.css" />
    <link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
      integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
      crossorigin="anonymous">
    <style type="text/css">
      .tab-content {
        background: #272822;
        border-radius: 0.25rem;
      }
    </style>
  </head>
  <body>
    <div class='container-fluid'>
      <h1>Simple Address Client</h1>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="nav nav-pills mr-auto" id="pills-tab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="address_app_app-tab" data-toggle="pill" href="#address_app_html" role="tab" aria-controls="address_app_html" aria-selected="true">
                address_app.html
                <span class="sr-only">(currently)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="ajax_address_js-tab" data-toggle="pill" href="#ajax_address_js" role="tab" aria-controls="ajax_address_js" aria-selected="false">
                AjaxAddress.js</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="list_addresses_js-tab" data-toggle="pill" href="#list_addresses_js" role="tab" aria-controls="list_addresses_js" aria-selected="false">
                ListAddresses.js</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="address_map_js-tab" data-toggle="pill" href="#address_map_js" role="tab" aria-controls="address_map_js" aria-selected="false">
                AddressMap.js</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="util_js-tab" data-toggle="pill" href="#util_js" role="tab" aria-controls="util_js" aria-selected="false">
                util.js</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                github
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item"
                  href="https://github.com/emceelam/Simple-Address-Client">
                  Simple Address Client</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="https://github.com/emceelam/Simple-Address-Laravel">
                  Laravel(PHP) REST back-end</a>
                <a class="dropdown-item" href="https://github.com/emceelam/Simple-Address-Mojo">
                  Mojolicious(Perl) REST back-end</a>
                <a class="dropdown-item" href="https://github.com/emceelam/Simple-Address-Dancer">
                  Dancer2(Perl) REST back-end</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      <div class="row">
        <div class="col-10">
          <div class="tab-content" >
            <div class="tab-pane fade show active" id="address_app_html" role="tabpanel" aria-labelledby="address_app_html-tab">
              <pre class="line-numbers line-highlight"><code class="language-html">${address_app_html}</code></pre>
            </div>
            <div class="tab-pane fade" id="ajax_address_js" role="tabpanel" aria-labelledby="ajax_address_js-tab">
              <pre class="line-numbers line-highlight"><code class="language-js">${ajax_address_js}</code></pre>
            </div>
            <div class="tab-pane fade" id="list_addresses_js" role="tabpanel" aria-labelledby="list_addresses_js-tab">
              <pre class="line-numbers line-highlight"><code class="language-js">${list_addresses_js}</code></pre>
            </div>
            <div class="tab-pane fade" id="address_map_js" role="tabpanel" aria-labelledby="address_map_js-tab">
              <pre class="line-numbers line-highlight"><code class="language-js">${address_map_js}</code></pre>
            </div>
            <div class="tab-pane fade" id="util_js" role="tabpanel" aria-labelledby="util_js-tab">
              <pre class="line-numbers line-highlight"><code class="language-js">${util_js}</code></pre>
            </div>
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
    <script src="source_code.bundle.js"></script>
  </body>
</html>

