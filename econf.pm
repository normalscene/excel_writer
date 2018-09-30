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
      tab_color => 'red',
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
      tab_color => 'blue',
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
