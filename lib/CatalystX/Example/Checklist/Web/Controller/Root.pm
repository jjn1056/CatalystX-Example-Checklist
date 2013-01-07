package CatalystX::Example::Checklist::Web::Controller::Root;
 
use Moose;
use MooseX::MethodAttributes;
use ViewModel 'List';

extends 'CatalystX::Example::Checklist::Web::Controller';

sub start : Chained('/')
 PathPrefix CaptureArgs(0)
{
  my ($self, $ctx) = @_;
  $ctx->stash(current_model => 'Checklist');
}

  sub my_first_checklist : Chained('start')
   PathPart('') Args(0) Method('GET')
  {
    my ($self, $ctx) = @_;
    $ctx->stash(checklist => List($ctx->model));
  }

  sub posted : Chained('start')
    PathPart('')  CaptureArgs(0) Method('POST')
  {
    my ($self, $ctx) = @_;
    $ctx->res->redirect(
      $ctx->uri_for_action(
        $ctx->controller->action_for('my_first_checklist')));
  }

    sub add : Chained('posted') Args(0)
    {
      my ($self, $ctx) = @_;
      my $post = $ctx->req->body_parameters;
      $ctx->model->add($post->{'new-item'});
    }

    sub delete : Chained('posted') Args(0)
    {
      my ($self, $ctx) = @_;
      my $post = $ctx->req->body_parameters;
      $ctx->model->delete($post->{'delete-index'});
    }

sub end : ActionClass('RenderView') { }
 
__PACKAGE__->meta->make_immutable;
