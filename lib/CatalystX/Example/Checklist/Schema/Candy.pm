package CatalystX::Example::Checklist::Schema::Candy;

use strict;
use warnings;
use base 'DBIx::Class::Candy';

sub base { $_[1] || 'CatalystX::Example::Checklist::Schema::Result' }

1;

=head1 NAME

CatalystX::Example::Checklist::Schema::Candy - My Candy Class

=head1 SYNOPSIS

	package CatalystX::Example::Checklist::Schema::Result::User;
  use CatalystX::Example::Checklist::Schema::Candy;

=head1 DESCRIPTION

Our custom subclass of L<DBIx::Class::Candy>

=head1 METHODS

This module defines the following methods.

=head2 base

Sets the base class for all Results

=head1 AUTHOR

See L<CatalystX::Example::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CatalystX::Example::Checklist> for rights information.

=cut


