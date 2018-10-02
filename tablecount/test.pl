#!/usr/bin/env perl

use strict;
use Data::Dumper;

my $d1 = 
[
  [1,2,3],
  [3,2,1],
  [2,3,1],
];

my $d2 = 
[
  [1,2,3,4,5],
  [1,'a',3,4,5],
  [1,2,3,4,5],
  [1,2,'b',4,5],
  [1,2,3,4,5],
];

sub sum_cols 
{
  my $data = shift; 
  my $sum_cols = [undef];

  for my $row_no (0 .. $#{$data}) {
    for my $col_no (0 .. $#{$data->[$row_no]}) {
      $sum_cols->[$col_no] += $data->[$row_no][$col_no];
    }
  }  

  return $sum_cols;
}

sub sum_rows 
{
  my $data = shift;
  my $sum_rows = [undef];

  for my $row_no (0 .. $#{$data}) {
    for my $col_no (0 .. $#{$data->[$row_no]}) {
      $sum_rows->[$row_no] += $data->[$row_no][$col_no] || 0;
    }
  }  

  return $sum_rows;
}

for my $d ($d1,$d2) {
  print Dumper sum_cols($d),sum_rows($d);
}
