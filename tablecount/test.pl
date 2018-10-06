#!/usr/bin/env perl

use strict;
use Data::Dumper;

my $d = 
[
  [1,2,3],
  [3,2,1],
  [2,3,1],
];
print Dumper $d;

sub sum_cols 
{
  my $data = shift; 
  my $sum_cols = [undef];

  for my $row_no (0 .. $#{$data}) {
    for my $col_no (0 .. $#{$data->[$row_no]}) {
      $sum_cols->[$col_no] += $data->[$row_no][$col_no] || 0;
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

sub print_table {
  my $table = shift;
  foreach my $row (@$table){
    print join(',',@$row),"\n";
  }
  print join(',',@{sum_cols($table)}),"\n";
  return;
}
#for my $d ($d,$d2) {
#print Dumper sum_cols($d),sum_rows($d);
print_table($d);
  #}
