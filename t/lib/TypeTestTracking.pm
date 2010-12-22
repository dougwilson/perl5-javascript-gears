package t::lib::TypeTestTracking;

use Test::Routine 0.004;
use Test::More;

# ALL IMPORTS BEFORE THIS WILL BE ERASED
use namespace::autoclean;

# ATTRIBUTES
has library_tested => (
	is => 'ro',
	isa => 'ClassName',
	lazy => 1,
	builder => 'build_library_tested',
);

# TESTS
test library_tested_check => sub {
	my $self = shift;

	# Get the list of tested types using method name rules
	my @all_tested_types = grep { defined $_ && $self->_has_type($_) }
		map { $_ =~ m{\A Type \s (\w+) \z}msx }
		$self->meta->get_method_list;

	# Compare type lists
	is_deeply([sort @all_tested_types], [sort $self->library_tested->type_names],
		'all types tested in ' . $self->library_tested->meta->identifier);

	return;
};

# PRIVATE METHODS
sub _has_type {
	my $self = shift;
	my ($type_name) = @_;

	# Return if the tested library has the given type
	return $self->library_tested->has_type($type_name);
}

1;
