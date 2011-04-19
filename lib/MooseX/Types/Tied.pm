#
# This file is part of MooseX-Types-Tied
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package MooseX::Types::Tied;
BEGIN {
  $MooseX::Types::Tied::AUTHORITY = 'cpan:RSRCHBOY';
}
BEGIN {
  $MooseX::Types::Tied::VERSION = '0.001';
}

# ABSTRACT: Basic tied Moose types library

use strict;
use warnings;

use MooseX::Types -declare => [ qw{ Tied TiedHash TiedArray TiedHandle } ];
use MooseX::Types::Moose ':all';

#use namespace::clean;

subtype Tied,
    as Ref,
    where { defined tied $$_ },
    message { 'Referenced scalar is not tied!' },
    ;

subtype TiedArray,
    as ArrayRef,
    where { defined tied @$_ },
    message { 'Array is not tied!' },
    ;

subtype TiedHash,
    as HashRef,
    where { defined tied %$_ },
    message { 'Hash is not tied!' },
    ;

subtype TiedHandle,
    as FileHandle,
    where { defined tied $$_ },
    message { 'Handle is not tied!' },
    ;

1;



=pod

=head1 NAME

MooseX::Types::Tied - Basic tied Moose types library

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use Moose;
    use MooseX::Types::Tied ':all';

    has tied_array => (is => 'ro', isa => TiedArray);

    # etc...

=head1 DESCRIPTION

This is a collection of basic L<Moose> types for tied references.  The package
behaves as you'd expect a L<MooseX::Types> library to act: either specify the
types you want imported explicitly or use the ':all' catchall.

=head1 TYPES

=head2 Tied

Basetype: Ref (to Scalar)

=head2 TiedArray

Basetype: ArrayRef

=head2 TiedHash

Basetype: HashRef

=head2 TiedHandle

Basetype: FileHandle

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut


__END__

