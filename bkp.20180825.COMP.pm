package COMP;

use strict;
use Data::Dumper;

sub comp 
{
  my ($data,$src,$tgt) = @_; 
  my $result = {};

  my $ms = ($result->{ms} = {});
  my $mt = ($result->{mt} = {});
  my $diff = ($result->{diff} = {});

  foreach my $key (keys %{$data->{$src}})
  {
    my $src_val = $data->{$src}{$key};
    my $tgt_val = $data->{$tgt}{$key};

    next if ($src_val eq $tgt_val);

    $mt->{$key} = "$src_val|NULL" if 
      (!exists $data->{$tgt}{$key});

    $diff->{$key} = "$src_val|$tgt_val" if 
      (exists $data->{$tgt}{$key} && $src_val ne $tgt_val);
  }
  foreach my $key (keys %{$data->{$tgt}})
  {
    my $src_val = $data->{$src}{$key};
    my $tgt_val = $data->{$tgt}{$key};

    next if ($src_val eq $tgt_val);

    $ms->{$key} = "NULL|$tgt_val"  if 
      (!exists $data->{$src}{$key});
  }
  return $result;
}
1;
