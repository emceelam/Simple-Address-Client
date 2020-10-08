FROM httpd:2-alpine

LABEL maintainer="Lambert Lum"
LABEL description="Simple Address Client"

WORKDIR /root

RUN mkdir dist \
  && mkdir src \
  && mkdir script

COPY package.json .
COPY package-lock.json .
COPY webpack.config.js .
COPY address_app.conf.json .
COPY src ./src
COPY script ./script

RUN apk add g++ make wget curl \
    perl-dev perl-app-cpanminus \
    python3 py3-pip \
    nodejs npm \
  && cpanm Text::Xslate \
  && pip3 install mako spitslurp \
  && ./script/run_mako.py \
  && npm install \
  && npm run build \
  && mkdir /usr/local/apache2/htdocs/simple_address_client \
  && cp ./dist/* /usr/local/apache2/htdocs/simple_address_client \
  && pip3 uninstall -y mako spitslurp \
  && apk del g++ make wget curl \
        perl-dev perl-app-cpanminus \
        python3 py3-pip \
        nodejs npm \
  && rm -rf /root/* /usr/local/share/man/* \
            /usr/local/bin/xslate /usr/local/lib/perl5/site_perl
