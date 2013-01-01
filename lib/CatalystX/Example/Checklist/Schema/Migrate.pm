package CatalystX::Example::Checklist::Schema::Migrate;

use Moose;
 
extends 'DBIx::Class::Migration::Script';
 
sub defaults {
  schema_class => 'CatalystX::Example::Checklist::Schema',
}

__PACKAGE__->meta->make_immutable;
__PACKAGE__->run_if_script;

=head1 NAME

CatalystX::Example::Checklist::Schema::Migrate - 

=head1 SYNOPSIS

    TBD
    	
=head1 DESCRIPTION

    TBD

=head1 AUTHOR

See L<CatalystX::Example::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CatalystX::Example::Checklist> for rights information.

=cut

