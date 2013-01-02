use DBIx::Class::Migration::RunScript;
use DBIx::Class::Migration::RunScript::Trait::AuthenPassphrase;

migrate {
  my $self = shift;
  if($self->set_has_fixtures('users')) {
    $self->populate('users');
  } else {
    my $schema = $self->schema;
    my $args = {
      passphrase => 'rfc2307',
        passphrase_class => 'SaltedDigest',
        passphrase_args  => {
          algorithm   => 'SHA-1',
          salt_random => 20,
        },
    };
 
    $schema->resultset('User')
      ->find_or_create({
          handle=>'Smiley',
          email=>'smiles@smile.org',
          password=>$self->authen_passphrase($args, 'donotguessit!!'),
        });

    $schema->resultset('User')
      ->find_or_create({
          handle=>'RowdyJake',
          email=>'jake@rowkdy.org',
          password=>$self->authen_passphrase($args, 'jakeiscool123'),
        });

    $schema->resultset('User')
      ->find_or_create({
          handle=>'jnap',
          email=>'jjnapiork@cpan.org',
          password=>$self->authen_passphrase($args, 'abc123'),
        });

    $self->dump('users');
  }

};

