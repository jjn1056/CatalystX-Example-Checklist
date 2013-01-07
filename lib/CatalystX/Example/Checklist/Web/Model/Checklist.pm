package CatalystX::Example::Checklist::Web::Model::Checklist;
 
use Moose;

with 'Catalyst::Component::InstancePerContext';

has 'session' => (is=>'ro');

sub items : { shift->session->{items} || [] }
sub total { scalar @{shift->session->{items}||[]} }
sub has_index { shift->items->[shift] }

sub add {
  my ($self, $item) = @_;
  push @{$self->session->{items}}, $item;
}

sub delete {
  my ($self, $index) = @_;
  splice @{$self->session->{items}}, $index, 1;
}

sub build_per_context_instance {
  my ($self, $ctx) = @_;
  (my $class = ref $self || $self)
    ->new(session => $ctx->session);
}

1;
