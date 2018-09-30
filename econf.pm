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
      tab_color => 'red',
      headers => 
      [
        {
          row_number => 1,
          fields => [qw (country item_no item weight(kg) color shape price status)],
          header_format => 
          {
            align => 'center',
            valign => 'vcenter',
            border => 1,
            color => 'white',
            bg_color => 'green',
            font => 'Arial',
            size => 10,
          }
        },
      ],
      has_merged_headers => 
      [
        { 
          row_size => 40,
          merge_range_size => 'A1:B1',
          merge_range_text => 'comp keys', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            border => 1,
            color => 'white', 
            bg_color => 'red',
            font => 'Calibri',
            size => 14,
            bold => 1,
          },
        },
        {
          row_size => 40, 
          merge_range_size => 'C1:H1',
          merge_range_text => 'Current situation', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            border => 1,
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
      row_freeze => 2,
      col_freeze => 2,
      tab_data => undef,
      tab_data_row_start_num => 2,
      tab_color => 'blue',
      headers => 
      [
        {
          row_number => 1,
          fields => [qw (country item_no item weight(kg) color shape price status)],
          header_format => 
          {
            align => 'center',
            valign => 'vcenter',
            border => 1,
            color => 'white',
            bg_color => 'magenta',
            font => 'Arial',
            size => 10,
          },
        },
      ],
      has_merged_headers => 
      [
        { 
          row_size => 40, 
          merge_range_size => 'A1:B1',
          merge_range_text => 'comp keys', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            border => 1,
            color => 'white',
            bg_color => 'navy',
            font => 'Calibri',
            size => 14,
            bold => 1,
          },
        },
        {
          row_size => 40, 
          merge_range_size => 'C1:H1',
          merge_range_text => 'Current situation', 
          merge_format => 
          {
            align => 'left',
            valign => 'vcenter',
            border => 1,
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

1;
