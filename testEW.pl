#!/usr/bin/env perl

use lib $ENV{PWD};

use EW;
use strict;
use warnings;
use Data::Dumper;


my %h = ();

my %conf = ( 
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
                             header => [qw(country item code weight color shape price tag)] ,
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
                                             price tag
                                            )],
                             rows => [],
                        },
                     },
           );

my @data;
while (my $l = <DATA>)
{
  chomp $l;
  next if $l =~ /^#/;
  next if $l =~ /^(?:\s|\t)+/;
  push (@data,[split(/\,/,$l)]);
}

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
                  }
        };

my $excelFile = EW->new('mybook',\%conf);
$excelFile->createFinalExcel(\@data);


__DATA__
#  1       2   3     4      5     6     7    8
#IN,white-rice,01,1kg,white,long,50.51 USD,none
#IN,brown-rice,03,1kg,white,long,60.51 USD,none
#CN,yellow-rice,03,1kg,white,long,60.61 USD,none
#KE,white-rice,05,1kg,white,long,40.61 USD,none
#
#  1       2   3     4      5     6     7    8
# numeric column values
IN,white-rice,1,1,white,long,50.51,none
IN,brown-rice,3,1,white,long,60.51,none
CN,yellow-rice,3,1,white,long,60.61,none
KE,white-rice,4,1,white,long,40.61,none
