#!/usr/bin/env perl

use lib $ENV{PWD};
use COMP;
use strict;
use warnings;
use Data::Dumper;

my $data2 = {
  f1 => {
    Amitabh => 'Bacchan',
    YellowSun => 'Yes', 
    Sunday_isit => 'Yes',
    Source => 'source',
  },
  f2 => {
    Amitabh => 'Bacchan',
    YellowSun => 'Yes', 
    Sunday_isit => 'No',
    Target => 'target',
  },
};

my $result = COMP::comp ($data2,'f1','f2');
print Dumper $result;
