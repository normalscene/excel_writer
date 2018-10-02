#!/usr/bin/env perl

use JSON;
use ethemes;
use econf;
use strict;
use JSON::Any;
use XML::Simple;
use Data::Dumper;

my $conf = $econf::conf;
my $json_conf = encode_json($conf);
my $c1 = JSON::Any->new();
my $data_conf = $c1->decode($json_conf);
my $xml_conf = XMLout($data_conf, RootName => 'conf');
print $xml_conf;

my $themes = $ethemes::themes;
my $json_themes = encode_json($themes);
my $c2 = JSON::Any->new();
my $data_themes = $c2->decode($json_themes);
my $xml_themes = XMLout($data_themes, RootName => 'themes');
print $xml_themes;
