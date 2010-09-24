#!/usr/bin/env perl
use strict;
use warnings;

use PHP::Serialization;
use Test::More tests => 3;

SKIP: {
    eval "use RDF::Trine";
    skip "RDF::Trine needed for tests.", 2 if ($@);
    is(PHP::Serialization->new->encode(RDF::Trine::Node::Literal->new('Hello','en')),'a:3:{i:0;s:5:"Hello";i:1;s:2:"en";i:2;N;}');
    is(PHP::Serialization->new->encode(RDF::Trine::Model->temporary_model),'O:5:"Model":4:{s:9:"threshold";i:2000;s:5:"store";O:6:"Memory":7:{s:10:"statements";a:0:{}s:6:"object";a:0:{}s:9:"ctx_nodes";a:0:{}s:9:"predicate";a:0:{}s:7:"subject";a:0:{}s:7:"context";a:0:{}s:4:"size";i:0;}s:5:"added";i:0;s:9:"temporary";i:1;}');
}


SKIP: {
    eval "use URI";
    skip "URI needed for tests.", 1 if ($@);
    
    is(PHP::Serialization->new->encode(URI->new('http://example.com/')),'s:19:"http://example.com/";');
}

