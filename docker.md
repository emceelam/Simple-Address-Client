
# Docker instructions


    docker image build --tag=simple_address_client:latest .

    docker container run \
      --rm \
      --detach \
      --name simple_address_client \
      --publish 8088:80 \
      simple_address_client:latest

    docker container exec \
      --interactive \
      --tty \
      simple_address_client /bin/sh

    docker container stop simple_address_client
