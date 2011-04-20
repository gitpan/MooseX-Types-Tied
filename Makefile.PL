
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Basic tied Moose types library',
  'AUTHOR' => 'Chris Weyl <cweyl@alumni.drew.edu>',
  'BUILD_REQUIRES' => {
    'Carp' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Moose' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0.94',
    'Tie::Array' => '0',
    'Tie::Handle' => '0',
    'Tie::Hash' => '0',
    'Tie::Scalar' => '0',
    'perl' => '5.004'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'MooseX-Types-Tied',
  'EXE_FILES' => [],
  'LICENSE' => 'lgpl',
  'NAME' => 'MooseX::Types::Tied',
  'PREREQ_PM' => {
    'MooseX::Types' => '0',
    'MooseX::Types::Moose' => '0',
    'Scalar::Util' => '0',
    'Tie::IxHash' => '0'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



