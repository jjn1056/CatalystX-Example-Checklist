package CatalystX::Example::Checklist::Schema::ResultSet::User;

use strict;
use warnings;
use base 'CatalystX::Example::Checklist::Schema::ResultSet';

sub new_member { shift->create({@_}) }

1;
