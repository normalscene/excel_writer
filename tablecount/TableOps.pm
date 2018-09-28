package TableOps;

use strict;
use Data::Dumper;

# This package produces a 
# sum of rows for a given
# matrix values.

sub sum_of_rows 
{
  my $sumRow ;
  my ($matrix,$args) = @_;
  my $height = scalar @{$matrix} - 1;
  my $breadth = scalar @{$matrix->[0]} -1;
    
  for my $b (0 .. $breadth) {
    for my $h (0 .. $height) 
    {
      $sumRow->[$b] += 
        $matrix->[$h][$b];
    }
  } return $sumRow;
}

1;
