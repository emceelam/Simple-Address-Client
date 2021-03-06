# $@  target
# $<  first dependency 
# $^  all dependencies

all: node_modules dist/address_app.html dist/source_code.html dist/app.bundle.js dist/rest_doc.bundle.js dist/source_code.bundle.js address_app.conf.json

node_modules:
	npm install

address_app.conf.json: address_app.conf.example
	cp $< $@
	@echo "* Don't forget to add your Google Map API key(s) to "$@

dist/address_app.html: script/run_mako.py script/address_app.html.mako address_app.conf.json
	mkdir -p dist
	script/run_mako.py

dist/source_code.html: script/run_mako.py script/source_code.html.mako dist/address_app.html src/AddressMap.js src/AjaxAddress.js src/ListAddresses.js
	script/run_mako.py

dist/app.bundle.js: webpack.config.js address_app.conf.json src/index.js src/AddressMap.js src/AjaxAddress.js src/ListAddresses.js src/util.js
	npm run build

dist/rest_doc.bundle.js: webpack.config.js src/rest_doc.js src/AjaxAddress.js
	npm run build

dist/source_code.bundle.js: webpack.config.js src/source_code.js src/prism.js src/prism.css
	npm run build

clean:
	rm dist/address_app.html
	rm dist/source_code.html
	rm dist/app.bundle.js
	rm dist/rest_doc.bundle.js
	rm dist/source_code.bundle.js

