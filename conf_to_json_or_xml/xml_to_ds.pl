#!/usr/bin/env perl

use strict;
use warnings;
use XML::Simple;
use Data::Dumper;

my $xml = shift or die "No XML! Exiting!\n";

my $ds =  XMLin($xml);
print Dumper $ds;
