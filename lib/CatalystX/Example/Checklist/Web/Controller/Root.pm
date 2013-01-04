package CatalystX::Example::Checklist::Web::Controller::Root;
 
use Moose;
use MooseX::MethodAttributes;

extends 'CatalystX::Example::Checklist::Web::Controller';

sub start : Chained('/')
 PathPrefix CaptureArgs(0) { }

  sub my_first_checklist : Chained('start')
   PathPart('') Args(0) Method('GET')
  {
    my ($self, $ctx) = @_;
    $ctx->stash->{items} = $ctx->session->{items};
  }

  sub validate_checklist: Chained('start')
   PathPart('') Args(0) Method('POST')
  {
    my ($self, $ctx) = @_;
    my $post = $ctx->req->body_parameters;
    push @{$ctx->session->{items}}, $post->{'new-item'};
  }

  sub default: Chained('start')
    PathPart('') Args(0) { pop->res->body('NOT ALLOWED') }


sub end : ActionClass('RenderView') { }
 
__PACKAGE__->meta->make_immutable;
