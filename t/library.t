#!/usr/bin/env perl

use 5.008003;
use strict;
use warnings 'all';

use Test::Routine 0.004;
use Test::Routine::Util 0.004;
use Test::More 0.96; # done_testing & subtests
use Test::Fatal 0.003;

# MOOSE ROLES
with(qw[t::lib::TypeTestTracking]);

# MODULES
use JavaScript::Gears::Library qw[ListOfDirs];
use Path::Class;

# ALL IMPORTS BEFORE THIS WILL BE ERASED
use namespace::autoclean 0.09;

sub build_library_tested { 'JavaScript::Gears::Library' };

# TESTS
test 'Type ListOfDirs' => sub {
	my $self = shift;

	# Make some variables to use
	my $dir    = 't';
	my $dir_o  = dir('t');
	my @dirs   = (qw[lib t t/lib]);
	my @dirs_o = map { dir($_) } @dirs;

	# Definition
	is(exception { ListOfDirs->assert_valid(\@dirs_o) }, undef, 'is an arrayref of dir objects');
	isnt(exception { ListOfDirs->assert_valid(\@dirs) }, undef, 'isnt an arrayref of dir strings');
	isnt(exception { ListOfDirs->assert_valid($dir) }, undef, 'isnt a dir string');
	isnt(exception { ListOfDirs->assert_valid($dir_o) }, undef, 'isnt a dir object');

	# Coercions
	is(exception { ListOfDirs->assert_coerce($dir) }, undef, 'coerces from single dir string');
	is(exception { ListOfDirs->assert_coerce($dir_o) }, undef, 'coerces from single dir object');
	is(exception { ListOfDirs->assert_coerce(\@dirs) }, undef, 'coerces from arrayref of dir strings');
	is(exception { ListOfDirs->assert_coerce(\@dirs_o) }, undef, 'coerces from arrayref of dir objects');
};

# RUN
run_me;

# END
done_testing;

exit 0;
