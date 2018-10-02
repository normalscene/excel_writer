#!/usr/bin/env perl

use econf;
use strict;
use warnings;
use Data::Dumper;
use JSON;

my $conf = $econf::conf;

my $json = encode_json $conf;
print  $json;
