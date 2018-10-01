#!/usr/bin/env perl

use strict;
use Data::Dumper;

# to print total of desired columns
# for a given matrix.

# Chose not to 
# use AoA.
my $data = 
[
  [qw(type1 1 2 3)],
  [qw(type1 1 2 3)],
  [qw(type2 2 1 3)],
  [qw(type2 2 1 3)],
];

# chose to use
# HoA, to get
# best of both
# worlds.
my $data2 = 
{
  type1 => [[qw(1 2 3)],[qw(1 2 3)]],
  type2 => [[qw(2 1 3)],[qw(2 1 3)]],
};

sub writeTable 
{
  my ($data,$args) = @_;
  die "No! data\n" unless $data;
  
  foreach my $tableKey (sort keys %{$data})
  {
    my $matrix = 
      $data->{$tableKey};

    my $calcTableSum = sub 
    { 
      my $sumRow ;
      my ($matrix,$args) = @_;
      my $height = scalar @{$matrix} - 1;
      my $breadth = scalar @{$matrix->[0]} -1;
      
      for my $b (0 .. $breadth) {
        for my $h (0 .. $height) {
          $sumRow->[$b] += $matrix->[$h][$b];
        }
      } 
      return $sumRow;
    };

    for my $row (@{$data->{$tableKey}}) {
      print "$tableKey".'|'.join('|',@$row)."\n";
    }

    if ($args->{tableSum})
    {
      print "tot_${tableKey}|".join('|',
        @{$calcTableSum->($matrix)})."\n";
    }
  }
}

# sending matrix
# and creating 
# the table.
writeTable ($data2, {tableSum => 1});

__END__
