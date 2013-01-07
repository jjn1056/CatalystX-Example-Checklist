package ViewModel;

use ViewModel::List;
use base 'Exporter';

our @EXPORT_OK = qw(List);

sub List { ViewModel::List->new(model => shift) }
