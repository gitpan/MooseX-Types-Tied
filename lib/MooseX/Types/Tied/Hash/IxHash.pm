#
# This file is part of MooseX-Types-Tied
#
# This software is Copyright (c) 2011 by Chris Weyl.
#
# This is free software, licensed under:
#
#   The GNU Lesser General Public License, Version 2.1, February 1999
#
package MooseX::Types::Tied::Hash::IxHash;
BEGIN {
  $MooseX::Types::Tied::Hash::IxHash::AUTHORITY = 'cpan:RSRCHBOY';
}
BEGIN {
  $MooseX::Types::Tied::Hash::IxHash::VERSION = '0.001';
}

# ABSTRACT: Moose type library for Tie::IxHash tied hashes

use strict;
use warnings;

use MooseX::Types -declare => [ qw{ IxHash } ];
#use namespace::clean;

use Scalar::Util qw{ blessed };
use Tie::IxHash;
use MooseX::Types::Moose ':all';
use MooseX::Types::Tied  ':all';

subtype IxHash,
    as TiedHash,
    where { blessed(tied %$_) eq 'Tie::IxHash' },
    message { 'Referenced hash is not tied to an Tie::IxHash: ' . ref tied $_ },
    ;

coerce IxHash,
    from HashRef,
    via { tie my $x, 'Tie::IxHash', %{$_}; $x },
    from ArrayRef,
    via { tie my $x, 'Tie::IxHash', @{$_}; $x },
    ;

1;



=pod

=head1 NAME

MooseX::Types::Tied::Hash::IxHash - Moose type library for Tie::IxHash tied hashes

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use Moose;
    use MooseX::Types::Tied::Hash::IxHash ':all';

    has tied_array => (is => 'ro', isa => IxHash);

    # etc...

=head1 DESCRIPTION

This is a collection of basic L<Moose> types and coercions for L<Tie::IxHash>
tied hashes.

The package behaves as you'd expect a L<MooseX::Types> library to act: either
specify the types you want imported explicitly or use the ':all' catchall.

=head1 TYPES

=head2 IxHash

Basetype: TiedHash

This type coerces from HashRef and ArrayRef.

=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Chris Weyl.

This is free software, licensed under:

  The GNU Lesser General Public License, Version 2.1, February 1999

=cut


__END__

