package CatalystX::Example::Checklist::Web::Controller::Root;
 
use Moose;
use MooseX::MethodAttributes;

extends 'Catalyst::Controller';
 
sub start : Chained('/')
  PathPrefix CaptureArgs(0) { }

  sub index : Chained('start')
    PathPart('') Args(0) { }

sub end : ActionClass('RenderView') { }
 
__PACKAGE__->meta->make_immutable;
