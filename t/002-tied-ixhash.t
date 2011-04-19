#!/usr/bin/env perl
#
# This file is part of MooseX-Types-Tied
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#

use strict;
use warnings;

use Test::More;
use Test::Exception;

{
    package TestClass;

    use Moose;
    use MooseX::Types::Tied::Hash::IxHash ':all';

    has ixhash => (is =>'rw', isa => IxHash);
}

{
    package Test::Tie::Hash;
    use base 'Tie::Hash';

    sub TIEHASH { bless \(my $x), $_[0] }
}

my $foo = TestClass->new();

tie my %hash,   'Test::Tie::Hash';
tie my %ixhash, 'Tie::IxHash';

dies_ok  { $foo->tiedhash(\%hash) } 'IxHash NOK';
dies_ok  { $foo->tiedhash({}) }     'IxHash NOK';
lives_ok { $foo->ixhash(\%ixhash) } 'IxHash OK';

done_testing;
