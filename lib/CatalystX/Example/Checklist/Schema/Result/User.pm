package CatalystX::Example::Checklist::Schema::Result::User;

use CatalystX::Example::Checklist::Schema::Candy
  -components => ['PassphraseColumn'];

table 'user';

primary_column user_id => {
  data_type => "integer",
  is_auto_increment => 1};

unique_column handle => {
  data_type => 'varchar',
  size => '32'};

unique_column email => {
  data_type => 'varchar',
  size => '96'};

column password => {
  data_type => 'text',
  passphrase_check_method => 'check_password',
  passphrase => 'rfc2307',
  passphrase_class => 'SaltedDigest',
  passphrase_args  => {
    algorithm   => 'SHA-1',
    salt_random => 20 }};

1;

=head1 NAME

CatalystX::Example::Checklist::Schema::Result::User

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<CatalystX::Example::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CatalystX::Example::Checklist> for rights information.

=cut
