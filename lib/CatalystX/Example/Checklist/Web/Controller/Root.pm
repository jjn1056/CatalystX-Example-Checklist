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

  sub add : Chained('start')
   PathPart('') Args(0) Method('POST')
  {
    my ($self, $ctx) = @_;
    my $post = $ctx->req->body_parameters;
    push @{$ctx->session->{items}}, $post->{'new-item'};
    $ctx->go('my_first_checklist');
  }

  sub default : Chained('start')
    PathPart('') Args(0) { pop->res->body('NOT ALLOWED') }

  sub delete : Chained('start')
    PathPart('delete') Args(0) Method('POST')
  {
    my ($self, $ctx) = @_;
    my $post = $ctx->req->body_parameters;
    splice @{$ctx->session->{items}}, $post->{'delete-item'}, 1;
    $ctx->res->redirect(
      $ctx->uri_for_action(
        $ctx->controller->action_for('my_first_checklist')));
    $ctx->detach;
  }


sub end : ActionClass('RenderView') { }
 
__PACKAGE__->meta->make_immutable;
