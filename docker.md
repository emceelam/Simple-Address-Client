
# Docker instructions

You should already have docker installed. If not, please read [Install Docker Engine](https://docs.docker.com/engine/install/)

    docker image build --tag=simple_address_client:latest --file=Dockerfile .

    docker container run \
      --rm \
      --detach \
      --name simple_address_client \
      --publish 8088:80 \
      simple_address_client:latest

Notice, we use port 8088. This avoids conflict with the port 80 used by Apache web server

Open web browser

    http://localhost:8088/~username/simple_address_client/address_app.html

When you are done

    docker container stop simple_address_client

