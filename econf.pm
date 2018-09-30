package econf;

use strict;
use warnings;

our $conf = 
{
  tabs => 
  {
    tab_a => 
    {
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
          header_format => 
          {
            align => 'center',
            valign => 'vcenter',
            #border => undef,
            color => 'white',
            bg_color => 'green',
            font => 'Arial',
            size => 12,
          }
        },
      ],
      has_merged_headers => 
      [
        { 
          row_size => undef,
          merge_range_size => 'A1:B1',
          merge_range_text => 'comp keys', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            #border => undef,
            color => 'white', 
            bg_color => 'red',
            font => 'Calibri',
            size => 14,
            bold => 1,
          },
        },
        {
          row_size => undef, 
          merge_range_size => 'C1:H1',
          merge_range_text => 'Current situation', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            #border => undef,
            color => 'white',
            bg_color => 'navy',
            font => 'Calibri',
            size => 14,
            bold => 1,
          },
        }
      ]
    },
    tab_b => 
    {
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
          header_format => 
          {
            align => 'center',
            valign => 'vcenter',
            #border => undef,
            color => 'white',
            bg_color => '#4e376b',
            font => 'Arial',
            size => 12,
          },
        },
      ],
      has_merged_headers => 
      [
        { 
          row_size => undef, 
          merge_range_size => 'A1:B1',
          merge_range_text => 'comp keys', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            #border => undef,
            color => 'white',
            bg_color => 'navy',
            font => 'Calibri',
            size => 14,
            bold => 1,
          },
        },
        {
          row_size => undef, 
          merge_range_size => 'C1:H1',
          merge_range_text => 'Current situation', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            #border => undef,
            color => 'white',
            bg_color => 'red',
            font => 'Calibri',
            size => 14,
            bold => 1,
          },
        }
      ]
    },
  },
};

our $null_format = {
  align => 'right',
  valign => undef, 
  #border => undef,
  color => '#dddddd',
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

our $properties = 
{
  title => 'Test Excel Workbook',
  author => 'Gaurav Arya (aryaaur)',
  comments => 'Created with Excel::Writer::XLSX with perl 5.28',
  subject => 'Just for testing',
  manager => 'No One',
  company => 'NWM plc',
  category => 'General',
  keywords => undef,
  status => 'Valid till 2019',
  hyperlink_base => 'www.google.com',
  #created - File create date. Such be an aref of gmtime() values.
};

1;
