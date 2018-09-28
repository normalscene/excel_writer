package Econf;

use strict;

our $conf = { 
  tabs => {
    country_item => 
    {
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
         rows => [],
    },
    country_code => 
    {
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
         rows => [],
    },
 }};

sub get_conf {
  return $conf;
}

##########
# true val
##########
1;
##########
