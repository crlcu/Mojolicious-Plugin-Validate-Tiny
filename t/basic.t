#!/usr/bin/env perl
use Mojo::Base -strict;

use Test::More tests => 3;

use Mojolicious::Lite;
use Test::Mojo;

plugin 'Validate::Tiny';

get '/' => sub {
  my $self = shift;
  $self->render(text => 'Hello Mojo!');
};

my $t = Test::Mojo->new;
$t->get_ok('/')->status_is(200)->content_is('Hello Mojo!');
