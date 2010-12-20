package JavaScript::Gears;

1;

__END__

=head1 NAME

JavaScript::Gears - Perl JavaScript dependency management and concatenation

=head1 VERSION

This documentation describes version 0.000.

=head1 SYNOPSIS

Sample "stand-alone" usage:

  use JavaScript::Gears 0.000;

  # Create a new JS::Gears object
  my $js_gears = JavaScript::Gears->new;

  # Require a JavaScript file
  # in HTML: <script src="/static/js/login.js" type="text/javascript"></script>
  $js_gears->require('/var/www/static/js/login.js');

  # We don't like concatenation, but like dependency management
  say join qq{\n}, map { qq!<script type="text/javascript" src="$_"></script>! }
      map { $_->file_name->relative('/var/www/') }
      $js_gears->javascript_files;

  # Individually include all files as data: URIs
  say join qq{\n}, map { qq!<script type="text/javascript" src="$_"></script>! }
      map { 'data:text/javascript;base64,' . MIME::Base64::encode($_) }
      map { $_->file_name->slurp }
      $js_gears->javascript_files;

=head1 DESCRIPTION

Manage JavaScript dependencies in web applications.

=head1 CONSTRUCTOR

This is fully object-oriented, and as such before any method can be used,
the constructor needs to be called to create an object to work with.

=head2 new

This will construct a new object.

=over

=item new(%attributes)

C<%attributes> is a HASH where the keys are attributes (specified in the
L</ATTRIBUTES> section).

=item new($attributes)

C<$attributes> is a HASHREF where the keys are attributes (specified in the
L</ATTRIBUTES> section).

=back

=head1 ATTRIBUTES

=head1 METHODS

=head2 javascript_files

This method will return a list of all JavaScript files (as
L<Path::Class::File|Path::Class::File> objects) that are required or that
are dependencies of requires JavaScript files.

=head2 require

This method takes an array or array reference of file names of JavaScript
files and will list these files as being required. This will cause all
dependencies to be resolved and will die on any error encountered.

=head1 DEPENDENCIES

=head1 SEE ALSO

=over

=item * L<Sprockets|http://getsprockets.org/> is a similar JavaScript
dependency management system written in Ruby. This was out first and this
module should be compatable with version 1.0.2.

=back

=head1 AUTHOR

Douglas Christopher Wilson, C<< <doug at somethingdoug.com> >>

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to C<bug-javascript-gears at rt.cpan.org>,
or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=JavaScript-Gears>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

I highly encourage the submission of bugs and enhancements to my modules.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

  perldoc JavaScript::Gears

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=JavaScript-Gears>

=item * Search CPAN

L<http://search.cpan.org/dist/JavaScript-Gears/>

=item * Search MetaCPAN

L<http://search.metacpan.org/#/dist/JavaScript-Gears>

=back

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
