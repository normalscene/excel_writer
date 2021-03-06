#!/usr/bin/env perl

use lib $ENV{PWD};

use EW;
use Econf;
use strict;
use warnings;
use Data::Dumper;


my @data;
my $conf = Econf::get_conf();

while (my $l = <DATA>) 
{
  chomp $l;
  next if $l =~ /^#/;
  next if $l =~ /^(?:\s|\t)+/;
  ($l =~ s/[\r\f]//g) if $l =~ /[\r\f]/;
  push (@data,[split(/\,/,$l)]);
}

my $excelFile = EW->new('mybook',$conf);
$excelFile->create_final_excel(\@data);

###################################################
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
