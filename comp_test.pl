#!/usr/bin/env perl

use lib $ENV{PWD};

use strict;
use Data::Dumper;

sub comp {
  my $result = {};
  my ($data,$src,$tgt) = @_;

  my $ms    = ($result->{ms} = {});
  my $mt    = ($result->{mt} = {});
  my $diff  = ($result->{diff} = {});

  foreach my $key (keys %{$data->{$src}})
  {
    my $src_val = $data->{$src}{$key}; 
    my $tgt_val = $data->{$tgt}{$key};

    next if ($src_val eq $tgt_val);

    if (!exists $data->{$tgt}{$key}) {
      push (@{$mt->{$key}}, [qw ($src_val NULL)]);
    }
    if (exists $data->{$tgt}{$key} && $src_val ne $tgt_val) {
      push (@{$diff->{$key}}, [qw ($src_val $tgt_val)]);
    }
  }

  foreach my $key (keys %{$data->{$tgt}})
  {
    my $src_val = $data->{$src}{$key};
    my $tgt_val = $data->{$tgt}{$key};

    next if ($src_val eq $tgt_val);

    if (!exists $data->{$src}{$key}) {
      push (@{$ms->{$key}},[qw (NULL $tgt_val)]);
    }
  }

  return $result;
}

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

my $result = comp($data2,'f1','f2');
print Dumper $result;
print Dumper $data2;
