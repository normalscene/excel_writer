package EW2;

use econf;
use strict;
use warnings;
use Data::Dumper;
use Excel::Writer::XLSX;
use List::Util qw(shuffle);

#####################
sub generate_excel_file {
  return undef if scalar @_ != 4;

  my ($class,$excel_name,
    $data, $config) = @_;

  # handle extension. null or xls TO xlsx. 
  $excel_name =~ s/^(.+?)xls$/${1}xlsx/g 
    if ($excel_name =~ /^.+?xls$/);
  $excel_name = $excel_name.'.xlsx' 
    if ($excel_name !~ /\.xlsx$/);

  my $self = {};
  $self->{name} = $excel_name;
  $self->{conf} = $config;
  $self->{workbook} = Excel::Writer::XLSX->new($excel_name); 

  # get current workbook to work upon.
  my $wb = $self->{workbook};

  # set workbook properties
  # title, comment ..etc.
  if ($econf::properties)
  {
    $wb->set_properties(%{$econf::properties});
  }

  # set tabs 
  foreach my $tab_name (keys %{$config->{tabs}})
  {
    my $work_tab = $wb->add_worksheet($tab_name);
    my $tab_config  = $self->{conf}{tabs}{$tab_name}; 

    # set row and col freeze
    if ($tab_config->{row_freeze} || $tab_config->{col_freeze}) 
    {
      my $row_freeze = $tab_config->{row_freeze} || undef;
      my $col_freeze = $tab_config->{col_freeze} || undef;
      $work_tab->freeze_panes($row_freeze, $col_freeze);
    }

    # associate tab data in config
    $tab_config->{tab_data} = $data;

    # set tab color
    my $tab_color = $tab_config->{tab_color} || get_random_color();
    $work_tab->set_tab_color($tab_color);

    # write merged_header if set in conf
    if ($tab_config->{has_merged_headers}) 
    {
      my $merge_config_list = $tab_config->{has_merged_headers}; 
      for my $merge_config (@$merge_config_list)
      {
        print Dumper $merge_config;

        # extract config details or set default(s)
        my $row_size = $merge_config->{row_size} || 20;
        my $merge_format = $merge_config->{merge_format};
        my $merge_text = $merge_config->{merge_range_text};
        my $merge_range_size = $merge_config->{merge_range_size};

        # set row height
        $work_tab->set_row(0,$row_size);

        # add merged header format
        my $format = $wb->add_format(%$merge_format);

        # write merged header 
        $work_tab->merge_range(
          $merge_range_size,
          $merge_text,
          $format
        );
      }

      # write header
      if ($tab_config->{headers}) 
      {
        my $header_config_list = $tab_config->{headers};
        for my $header_config (@$header_config_list)
        {
          my $tab_header = $header_config->{fields};
          my $header_row_num = $header_config->{row_number};
          my $header_format_config = $header_config->{header_format};
          my $format = $wb->add_format(%$header_format_config);

          # if autofilter is ON
          my $max_header_col = scalar @$tab_header -1 ;
          if ($header_config->{autofilter})
          {
            $work_tab->autofilter(
              $header_row_num,
              0,
              $header_row_num,
              $max_header_col,
            );  
          } 

          for my $header_col_num (0 .. $#{$tab_header})
          {
            my $header_field = $tab_header->[$header_col_num];
            $work_tab->write(
              $header_row_num,
              $header_col_num,
              $header_field,
              $format
            );
          }
        }
      }
      else
      {
       die "Need header config or will not proceed!\n";
      }

      # write data
      return undef if !$tab_config->{tab_data};

      my $data = $tab_config->{tab_data};
      my $current_row = $tab_config->{tab_data_row_start_num};
      my $data_format = $wb->add_format(%{$econf::normal_format});
      my $null_format = $wb->add_format(%{$econf::null_format});

      # override data cell format parameters
      if ($tab_config->{override}) {
        if ($tab_config->{override}{data_cell_bg_color}) {
          $data_format->set_bg_color(
            $tab_config->{override}{data_cell_bg_color}
          );
        }
      }

      for my $row_array (@$data)
      {
        # for conditional formatting
        my $max_col = scalar @$row_array - 1;
        $work_tab->conditional_formatting(
          $current_row,
          0,
          $current_row,
          $max_col,
          {
            type => 'text',
            criteria => 'begins with',
            value => 'NULL',
            format => $null_format,
          },
        );
        $work_tab->write(
          $current_row,
          0,
          $row_array,
          $data_format
        );
        $current_row++;
      }
    }
  }

  bless ($self,$class);
  if (!$self->close_excel()){
    print "WARNING: Excel file wasn't properly closed!\n";
  }
  return $self;
}

sub get_random_color 
{
  my @colors = qw
  (
    black     blue      brown
    cyan      gray      green
    lime      magenta   navy
    orange    pink      purple
    red       silver    white 
    yellow
  );

  my @shuffled = shuffle(@colors);
  return $shuffled[0];
}

sub close_excel {
  my $self = shift;
  return $self->{workbook}->close();
}

1;
