# NAME

Simple Adddress App

# DESCRIPTION

This is a simple address app, utilizing Google Maps, AJAX, and REST. The REST side is available for [download](https://github.com/emceelam/Simple-Address-Mojo) also.

# GOOGLE MAP API KEY

Get a [Google Map API key](https://developers.google.com/maps/documentation/javascript/get-api-key).

If you are running on a public server, generate an API key and set Key Restriction to "HTTP referrers". This API key works on browser clients (exactly what we need). On this API key, add the URL that your web page will originate from, e.g.
http://sjsutech.com/simple_address_client/*


If you are running on a localhost, you can use a single API key for both browser and server. When you generate your API key, set Key restriction to "None".

# INSTALL

Recent version of [Node.js](https://nodejs.org/en/download/package-manager/) is required. Ubuntu 16.04 default Node.js is out of date.

Open terminal

    sudo cpanm Text::Xslate

    git clone git@github.com:emceelam/Simple-Address-Client.git simple_address_client
    cd simple_address_client

    sudo apt-get install python3 python3-pip
    sudo pip3 install mako spitslurp

    make

    vi address_app.conf.json
      # Add API key(s)
      # Set hostname and port, e.g. localhost, 3000

    make
      # yes, again
      # uses modified address_app.conf to regenerate files

    # put a soft link of the dist directory to your public_html directory
    ln -s /your_path/simple_address_client/dist/ ~/public_html/simple_address_client


Open web browser

    http://localhost/~username/simple_address_client/address_app.html

# DOCKER

[Docker instructions](docker.md)

# SEE ALSO

The server side portion, [Simple Address Mojo](https://github.com/emceelam/Simple-Address-Mojo), [Simple Address Laravel](https://github.com/emceelam/Simple-Address-Laravel)

# AUTHOR

Lambert Lum

![email address](http://sjsutech.com/small_email.png)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2018 by Lambert Lum

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
