package econf;

use strict;
use warnings;

our $conf = 
{
  tabs => 
  {
    tab_a => 
    {
      theme => 'theme_1',
      row_freeze => 2,
      col_freeze => 2,
      tab_data => undef,
      tab_data_row_start_num => 2,
      tab_color => undef, 
      headers => 
      [
        {
          autofilter => 1,
          row_number => 1,
          fields => [qw (country item_no item weight(kg) color shape price status)],
        },
      ],
      has_merged_headers => 
      [
        { 
          row_size => undef,
          merge_range_size => 'A1:B1',
          merge_range_text => 'comp keys', 
        },
        {
          row_size => undef, 
          merge_range_size => 'C1:H1',
          merge_range_text => 'Current situation', 
        }
      ]
    },
    tab_b => 
    {
      theme => 'theme_2',
      override => 
      { 
        data_cell_bg_color => '#cdfcc1' 
      },
      row_freeze => 2,
      col_freeze => 2,
      tab_data => undef,
      tab_data_row_start_num => 2,
      tab_color => undef,
      headers => 
      [
        {
          autofilter => 1,
          row_number => 1,
          fields => [qw (country item_no item weight(kg) color shape price status)],
        },
      ],
      has_merged_headers => 
      [
        { 
          row_size => undef, 
          merge_range_size => 'A1:B1',
          merge_range_text => 'comp keys', 
        },
        {
          row_size => undef, 
          merge_range_size => 'C1:H1',
          merge_range_text => 'Current situation', 
        }
      ]
    },
  },
};

our $properties = 
{
  title => 'Test Excel Workbook',
  author => 'Mr. Author',
  comments => 'Created with Excel::Writer::XLSX with perl 5.28',
  subject => 'Just for testing',
  manager => 'No One',
  company =>  undef,
  category => 'General',
  keywords => undef,
  status => 'Valid till 2019',
  hyperlink_base => 'www.google.com',
  #created - File create date. Such be an aref of gmtime() values.
};

1;
