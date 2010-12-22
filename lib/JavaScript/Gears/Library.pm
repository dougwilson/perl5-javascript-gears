package JavaScript::Gears::Library;

use 5.008003;
use strict;
use warnings 'all';

# METADATA
our $AUTHORITY = 'cpan:DOUGDUDE';
our $VERSION   = '0.000';

# MOOSE TYPES DECLARATIONS
use MooseX::Types 0.24 -declare => [qw(
	ListOfDirs
)];

# MOOSE TYPES
use MooseX::Types::Moose qw[ArrayRef Str];
use MooseX::Types::Path::Class qw[Dir];

# ALL IMPORTS BEFORE THIS WILL BE ERASED
use namespace::autoclean 0.09;

# TYPES
subtype ListOfDirs,
	as ArrayRef[Dir];

# COERCIONS
coerce ListOfDirs,
	from ArrayRef,
	via { _to_list_of_dirs(@{$_}) };
coerce ListOfDirs,
	from Str | Dir,
	via { _to_list_of_dirs($_) };

# PRIVATE FUNCTIONS
sub _to_list_of_dirs {
	my (@dir) = @_;

	# Get a list of directories
	my @list = map { Dir->assert_coerce($_) } @dir;

	# Return the list as a reference
	return \@list;
}

1;

__END__

=head1 NAME

JavaScript::Gears::Library - Types for use in JavaScript::Gears

=head1 VERSION

This documentation describes version 0.000.

=head1 TYPES PROVIDED

=head2 ListOfDirs

=head1 DEPENDENCIES

This module is dependent on the following modules:

=over 4

=item * L<MooseX::Types|MooseX::Types> 0.24

=item * L<MooseX::Types::Moose|MooseX::Types::Moose>

=item * L<MooseX::Types::Path::Class|MooseX::Types::Path::Class>

=item * L<namespace::autoclean|namespace::autoclean> 0.09

=back

=head1 AUTHOR

Douglas Christopher Wilson, C<< <doug at somethingdoug.com> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Douglas Christopher Wilson.

This program is free software; you can redistribute it and/or
modify it under the terms of either:

=over 4

=item * the GNU General Public License as published by the Free
Software Foundation; either version 1, or (at your option) any
later version, or

=item * the Artistic License version 2.0.

=back

