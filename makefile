# $@  target
# $<  first dependency 
# $^  all dependencies

all: node_modules dist/address_app.html dist/bundle.js address_app.conf.json

node_modules:
	npm install

address_app.conf.json: address_app.conf.example
	cp $< $@
	@echo "* Don't forget to add your Google Map API key(s) to "$@

dist/address_app.html: script/xslate.pl script/address_app.html.tx address_app.conf.json
	mkdir -p dist
	script/xslate.pl > $@

dist/bundle.js: webpack.config.js address_app.conf.json src/index.js src/AddressMap.js src/AjaxAddress.js src/ListAddresses.js src/util.js
	npm run build

clean:
	rm dist/address_app.html
	rm dist/bundle.js

