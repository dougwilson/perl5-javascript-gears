JavaScript-Gears 0.000
======================

`JavaScript::Gears` is a Perl library that processes JavaScript files for
deployment.

What does `JavaScript::Gears` do?
---------------------------------

`JavaScript::Gears` is meant to be a complete JavaScript dependency
management system. If you've heard of [Sprockets](http://getsprockets.org/)
this is like that, but in Perl.

* **Dependency management.** `JavaScript::Gears` will read JavaScript files
  and manage dependency groups using concatenation (or not, you decide).
  Dependent files may be concatenated together or listed.
* **Minification.** All JavaScript files may be post-processed, providing
  the ability to minify JavaScript for faster network transfer speeds.

Installation
------------

To install this module, run the following commands:

    perl Build.PL
    ./Build
    ./Build test
    ./Build install

Support and Documentation
-------------------------

After installing, you can find documentation for this module with the
`perldoc` command.

    perldoc JavaScript::Gears

You can also look for information at:

*   [RT, CPAN's request tracker](http://rt.cpan.org/NoAuth/Bugs.html?Dist=JavaScript-Gears)

*   [Search CPAN](http://search.cpan.org/dist/JavaScript-Gears)

*   [Search MetaCPAN](http://search.metacpan.org/#/dist/JavaScript-Gears)

COPYRIGHT AND LICENCE
---------------------

Copyright 2010 Douglas Christopher Wilson.

This program is free software; you can redistribute it and/or modify it
under the terms of either:

*   the GNU General Public License as published by the Free Software Foundation;
    either version 1, or (at your option) any later version, or
*   the Artistic License version 2.0.
