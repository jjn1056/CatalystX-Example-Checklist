package CatalystX::Example::Checklist::Schema::Result::Checklist;

use CatalystX::Example::Checklist::Schema::Candy;

table 'checklist';

primary_column checklist_id => {
  data_type => "integer",
  is_auto_increment => 1};

column title => {
  data_type => 'varchar',
  size => '64'};

column description => {
  data_type => 'text'};


1;

=head1 NAME

CatalystX::Example::Checklist::Schema::Result::Checklist

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<CatalystX::Example::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CatalystX::Example::Checklist> for rights information.

=cut
