#!/usr/bin/env perl

use warnings;
use strict;
use Text::Xslate;
use File::Slurp qw(read_file write_file);
use JSON;
use Cwd qw(abs_path chdir);
use File::Basename qw(dirname);

# chdir to script's location.
# Corrects for makefile calling this script from strange locations
my $script_path = dirname(abs_path($0));
chdir ($script_path);

my $dest_dir = "../dist";

# process address_app.html.tx into address_app.html
my $tx = Text::Xslate->new(
  suffix => '.html.tx',
  syntax => 'Kolon',
  type   => 'html',   # html escaping
);
my $conf = JSON->new->relaxed(1)->decode( scalar read_file ('../address_app.conf.json'));
my $api_key = $conf->{browser_gmap_api_key} || die "missing browser_gmap_api_key";
my $host    = $conf->{host} || die "missing host";
my $port    = $conf->{port} || die "missing port";
my $address_app_html = $tx->render('address_app.html.tx', {
  api_key   => $api_key,
  host_port => "$host:$port",
});
write_file ("$dest_dir/address_app.html", $address_app_html);

my $source_code_html = $tx->render('source_code.html.tx', {
  address_app_html => $address_app_html,
});
write_file ("$dest_dir/source_code.html", $source_code_html);

