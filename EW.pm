#!/usr/bin/perl

package EW;

use strict;
use warnings;
use Data::Dumper;
use Excel::Writer::XLSX;

#####################
sub new {

  my $class = shift;
  my $name = shift;
  my $conf = shift;

  return undef if 
    (!$name || !$conf);
    #return undef if !$conf;

  # handle extension. null or xls TO xlsx. 
  $name =~ s/^(.+?)xls$/${1}xlsx/g 
    if ($name =~ /^.+?xls$/);

  $name = $name.'.xlsx' 
    if ($name !~ /\.xlsx$/);

  my $self = {};
  $self->{name} = $name;
  $self->{conf} = $conf;
  $self->{workbook} = 
    Excel::Writer::XLSX->new($name); 

  # get current workbook to work upon.
  my $wb = $self->{workbook};

  # add tabs
  foreach my $t (keys %{$conf->{tabs}})
  {
    my $tab = 
      $wb->add_worksheet($t);

    # set tab color
    my $tab_color = 
      "$conf->{tabs}{$t}{tabColor}" || undef;

    $tab->set_tab_color($tab_color);
  }

  bless ($self,$class);
  return $self;
}


sub create_merged_header
{
  my (  $self,
        $text_array,
        $size_array   ) = @_;

  return $self;
}


#####################
sub set_format {
  return undef unless scalar @_ == 3;

  my ( $self,
       $format_conf,
       $format_object ) = @_;

  my $format = {
    0 => 'set_color',
    1 => 'set_fg_color',
    2 => 'set_bg_color',
    3 => 'set_font',
    4 => 'set_align',
    5 => 'set_border',
    6 => 'set_border_color',
    7 => 'set_num_format',
    8 => 'set_text_wrap',
  };

  for my $i (0 .. $#{$format_conf})
  {
    my $attribute_name    = $format->{$i};
    my $attribute_value   = $format_conf->{$i};

    if ($attribute_value) {
      $format_object->$attribute_name($attribute_value);
    }
  }

  return $self;
}


sub close_excel {
  my $self = shift;
  return $self->{_obj}->close();
}


#####################
# reorders the data tabwise.
sub reorder_data 
{ 
  my $self = shift;
  my $data = shift;

  my $conf = $self->{conf};

  for my $row_array (@{$data})
  {
    foreach my $tab (keys %{$conf->{tabs}})
    {
      my $rawData       = $row_array;
      my $separator     = $conf->{tabs}{$tab}{separator}; 
      my $dataOrder     = \@{$conf->{tabs}{$tab}{dataOrder}};
      my $rowStorage    = \@{$conf->{tabs}{$tab}{rows}};

      my $orderedLine;

      for my $idx (@$dataOrder) 
      {
        if ($orderedLine) {
          $orderedLine = 
            $orderedLine.','.@$row_array[$idx-1];
        }
        else {
          $orderedLine = 
            @$row_array[$idx-1];
        }
      }

      push (@$rowStorage,[$orderedLine]);

    }
  } return $self;
}

#####################
sub create_final_excel {

  my $self = shift;
  my $data = shift;
  return undef if !$data; 

  my $conf = $self->{conf};

  # populate tabwise re-ordered
  # data to be written into the
  # tab(s).
  $self->reorder_data($data);

  foreach my $tab (keys %{$conf->{tabs}})
  {
    # get workbook/worksheet.
    my $wb = $self->{workbook};
    my $worksheet = $wb->get_worksheet_by_name($tab);

    # get the ref to current tab config.
    my $tabConf = $conf->{tabs}{$tab};
    #print Dumper $tabConf;

    # get tab specific configuration.
    my $tabData = $tabConf->{rows} ;
    my $tabHeader = $tabConf->{header} ;

    # get freeze config
    my $rowFreeze = $tabConf->{rowFreeze} || 0; 
    my $colFreeze = $tabConf->{colFreeze} || 0; 
    
    #> set freeze (vertical and horizontal)
    $worksheet->freeze_panes ($rowFreeze,$colFreeze);
    print "TAB ($tab)\n",Dumper $tabData;
  }
}
#####################
__DATA__
#####################


#####################
1;
