#!/usr/bin/env perl

use 5.008003;
use strict;
use warnings 'all';

use Test::More 0.96; # done_testing & subtests
use Test::Fatal 0.003;
use Test::NoWarnings 1.02 qw[had_no_warnings];
$Test::NoWarnings::do_end_test = 0; # We do this manually

# MODULES
use JavaScript::Gears::Library qw[ListOfDirs];
use Path::Class;

subtest ListOfDirs => sub {
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

# End
had_no_warnings;
done_testing;

exit 0;
