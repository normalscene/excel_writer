#!/usr/bin/env perl

use JSON;
use econf;
use strict;
use JSON::Any;
use XML::Simple;
use Data::Dumper;

my $conf = $econf::conf;
my $json = encode_json($conf);
my $convertor = JSON::Any->new();
my $data = $convertor->decode($json);
my $xml = XMLout($data);
print Dumper $xml;
