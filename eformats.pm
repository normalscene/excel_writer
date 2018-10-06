package eformats;

use strict;
use warnings;

our $null_format = {
  align => 'right',
  valign => undef, 
  #border => undef,
  color => '#ffffff',
  #color => 'black',
  bg_color => '#ff8d00',
  font => 'Calibri',
  size => 11,
};
our $normal_format = {
  align => 'right',
  valign => undef, 
  #border => undef,
  color => 'black',
  bg_color => '#dbeb6a',
  font => 'Calibri',
  size => 11,
};

our $zero_format = {
  align => 'left',
  valign => undef, 
  #border => undef,
  color => 'white',
  bg_color => 'navy',
  font => 'Calibri',
  size => 11,
};

our $red_num_format = {
  align => 'left',
  valign => undef, 
  #border => undef,
  color => 'white',
  bg_color => 'navy',
  font => 'Calibri',
  size => 11,
};
our $green_num_format = {
  align => 'left',
  valign => undef, 
  #border => undef,
  color => 'white',
  bg_color => 'navy',
  font => 'Calibri',
  size => 11,
};

1;
