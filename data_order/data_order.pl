#!/usr/bin/env perl

use strict;
use Data::Dumper;

my $data = [
  [qw( a b c d )],
  [qw( a b c d )],
];

sub reorder_AoA_data 
{
  return undef if scalar @_ < 2;
  my ($order,$data) = @_;

  my $result;
  for my $line_array (@$data) {
    my $ordered;
    for my $order (@$order) {
      push(@$ordered,@$line_array[$order]);
    }
    push (@$result,$ordered);
  }

  return $result;
}

my $ordered_data = reorder_AoA_data([0,3,2,1],$data);
print Dumper $ordered_data;
