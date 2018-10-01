package Econf;

use strict;

our $conf = { 
  tabs => {
    country_item => 
    {
      merge_head => [],
      header_row_height => undef,
      rows => [],
      tabColor => 'red',
      separator => ',',
      autoFilter => 0,
      rowFreeze => 1,
      colFreeze => 2,
      tableTotal => 0,
      tableBreadths => [2,3,3],
      dataOrder => [1,2,3,4,5,6,7,8],
      header => [qw( country item code 
                     weight color shape 
                     price tag)] ,
    },
    country_code => 
    {
      merge_head => [],
      header_row_height => undef,
      rows => [],
      tabColor => 'blue',
      separator => ',',
      autoFilter => 0,
      rowFreeze => 1,
      colFreeze => 2,
      tableTotal => 0,
      tableBreadths => [2,3,3],
      dataOrder => [1,3,2,4,5,6,7,8],
      header => [ qw( country code item 
                      weight color shape 
                      price tag)],
    },
 }};

my $data = {
  'mt' => { 
    'srcmtkey' => 'src_mt_val|NULL',
    'f1key' => 'src_f1val|NULL'
  },
  'diff' => {
    'commonkeydiffval' => 'srcval|tgtval'
  },
  'ms' => {
    'tgtmskey' => 'NULL|tgt_mt_val',
    'f2key' => 'NULL|tgt_f2val'
  }};

# formats
# color       fgcolor     bgcolor
# font        align       border
# bordercolor num_fmt     txt_wrap
our $header_1 = [qq
  (black black #2bd22b 
   Arial vcenter undef 
   undef undef undef)
];

sub get_conf {
  return $conf;
}
sub get_data {
  return $data;
}

##########
# true val
##########
1;
##########
