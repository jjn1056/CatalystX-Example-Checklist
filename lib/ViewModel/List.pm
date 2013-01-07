package ViewModel::List;

use Moose;

has model => (
  is=>'bare',
  required=>1,
  handles=>[qw/items total/]);

__PACKAGE__->meta->make_immutable;
