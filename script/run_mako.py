#!/usr/bin/env python3

import json
import os
from os.path import realpath, dirname
from html import escape
from mako.template import Template
from spitslurp import spit, slurp

script_path = dirname(realpath(__file__))
os.chdir(script_path)

dest_dir = "../dist"
src_dir  = "../src"

conf = json.loads(slurp('../address_app.conf.json'))
port    = conf['port']
host    = conf['host']
api_key = conf['browser_gmap_api_key']

templ = Template(filename = 'address_app.html.mako')
address_app_html = templ.render(api_key=api_key)
spit (dest_dir + '/address_app.html', address_app_html)

templ = Template(filename = 'source_code.html.mako')
spit (dest_dir + '/source_code.html', templ.render(
  address_app_html  = escape(address_app_html),
  ajax_address_js   = escape(slurp (src_dir + '/AjaxAddress.js')),
  list_addresses_js = escape(slurp (src_dir + '/ListAddresses.js')),
  address_map_js    = escape(slurp (src_dir + '/AddressMap.js')),
  util_js           = escape(slurp (src_dir + '/util.js')),
))
