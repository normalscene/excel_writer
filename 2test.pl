#!/usr/bin/env perl

use lib $ENV{PWD};

use EW2;
use econf;
use strict;
use warnings;
use Data::Dumper;

#my ($excel_name,$file1,$file2) = @ARGV;
#die "Need excel_name, file_1, file_2 !\n" if scalar @ARGV != 3;

my $excel_name = 'test_excel.xlsx';
my $data= 
[
  [qw (IN 1 white-rice 1 white long 50.51 none)],
  [qw (IN 1 yellow-rice 1 yellow long 63.51 none)],
  [qw (IN 3 brown-rice 1 white long 62.51 NULL)],
  [qw (CN 3 yellow-rice 1 yellow long 68.61 none)],
  [qw (KE 4 white-rice 1 white long 70.61 NULL)]
];

my $excel_file = EW2->generate_excel_file (
  $excel_name,   # excel name
  $data,         # data to be written
  $econf::conf   # excel configuration
); 
__END__
