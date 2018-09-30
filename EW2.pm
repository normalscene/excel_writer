package EW2;

use Econf;
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
      $work_tab->freeze_panes(
        $row_freeze,
        $col_freeze 
      );
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
        # extract config details or set default(s)
        my $row_size = $merge_config->{row_size} || 40;
        my $merge_format = $merge_config->{merge_format};
        my $merge_text = $merge_config->{merge_range_text};
        my $merge_range_size = $merge_config->{merge_range_size};

        # set row height
        $work_tab->set_row(0,$row_size);

        # add merged header format
        my $format = $wb->add_format(%$merge_format);

        # write merged header 
        $work_tab->merge_range($merge_range_size,$merge_text,$format);
      }
    }
  }

  bless ($self,$class);
  return $self;
}

sub get_random_color {
  #my $self = shift ;
  my @colors = (
    'black', 'blue', 'brown',
    'cyan', 'gray', 'green',
    'lime', 'magenta', 'navy',
    'orange', 'pink', 'purple',
    'red', 'silver', 'white', 'yellow',
  );

  my @shuffled = shuffle(@colors);
  return $shuffled[0];
}

sub close_excel {
  my $self = shift;
  return $self->{_obj}->close();
}

1;
