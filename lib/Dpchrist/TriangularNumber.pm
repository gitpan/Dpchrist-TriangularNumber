#######################################################################
# $Id: TriangularNumber.pm,v 1.23 2010-12-03 05:13:53 dpchrist Exp $
#######################################################################
# package:
#----------------------------------------------------------------------

package Dpchrist::TriangularNumber;

use strict;
use warnings;

use constant DEBUG		=> 0;
use constant EPSILON		=> 1.0E-06;

use Dpchrist::Debug		qw( :all );

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
    triangular_number
    triangular_inverse
    is_triangular_number
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = sprintf("%d.%03d", q$Revision: 1.23 $ =~ /(\d+)/g);

#######################################################################

=head1 NAME

Dpchrist::TriangularNumber - Perl extension for Triangular numbers.


=head1 SYNOPSIS

    use Test::More tests => 1;
    use Dpchrist::TriangularNumber qw( :all );

    ### triangular numbers():
    print join(", ", map({ triangular_number($_)}   1..10)), "\n";

    ### triangular inverses():
    print join(", ", map({ triangular_inverse($_)}  1..10)), "\n";

    ### is_triangular_number():
    print join(", ", map({ is_triangular_number($_)}  1..10)), "\n";

    ok(1);


Output:

    1..1
    1, 3, 6, 10, 15, 21, 28, 36, 45, 55
    1, 1.56155281280883, 2, 2.37228132326901, 2.70156211871642, 3, 3.27491721763537, 3.53112887414927, 3.77200187265877, 4
    1, , 1, , , 1, , , , 1
    ok 1


=head1 DESCRIPTION

This documentation describes module revision $Revision: 1.23 $.


This is alpha test level software
and may change or disappear at any time.


I was using the following function for games:

    T(n) = 1 + 2 + ... + (n-1) + n

         = n * (n+1) / 2

For example:

    T(1) =  1
    T(2) =  3
    T(3) =  6
    T(4) = 10
    T(5) = 15
    T(6) = 21
    etc.

These are called Triangular numbers, after Pascal's Triangle:

				1
			    1       1
			1       2       1
		    1       3       3       1
		1       4       6       4       1
	    1       5      10      10       5       1
	1       6      15      20      15       6       1
    1       7      21      35      35      21       7       1

Observe the diagonal numbers starting at the third row:
1, 3, 6, 10, 15, 21.

The inverse is given by:

    n = -0.5 +- sqr(0.25 + 2*T)


=head2 SUBROUTINES

=cut

#----------------------------------------------------------------------

=head3 is_triangular_number

    is_triangular_number EXPR

Returns true if EXPR is zero, a triangular number,
or the negative of a triangular number.
otherwise returns false.

=cut

sub is_triangular_number
{
    ddump 'entry', [\@_], [qw(*_)] if DEBUG;

    my $t = shift;

    my $n = triangular_inverse($t);

    my $e = abs($n - int($n));

    my $b = $e < EPSILON;
    
    ddump 'returning', [$b], [qw(b)] if DEBUG;
    return $b;
}

#----------------------------------------------------------------------

=head3 triangular_inverse

    triangular_inverse EXPR

Returns triangular inverse of EXPR --
e.g. the inverse of triangular_number().

=cut

sub triangular_inverse
{
    ddump 'entry', [\@_], [qw(*_)] if DEBUG;

    my $t = shift;

    my $n = ($t == 0)
	    ? 0
	    : ($t < 0)
	      ?  +0.5 - sqrt(0.25 - 2 * $t)
	      :  -0.5 + sqrt(0.25 + 2 * $t);

    ddump 'returning', [$n], [qw(n)] if DEBUG;
    return $n;
}

#----------------------------------------------------------------------

=head3 triangular_number

    triangular_number EXPR

Returns the N-th Triangular number given by EXPR --
e.g. 1, 3, 6, 10, etc..
Note that T(0) = 0, and T(-$n) = -T($n).

=cut

sub triangular_number
{
    ddump 'entry', [\@_], [qw(*_)] if DEBUG;

    my $n = shift;

    my $t = 0 < $n
	?  $n * ( $n + 1) / 2
	:  $n * (-$n + 1) / 2;		# let T(-n) = -T(n)
    
    ddump 'returning', [$t], [qw(t)] if DEBUG;
    return $t;
}

#######################################################################
# end of code:
#----------------------------------------------------------------------

1;
__END__

#######################################################################
# remaining pod:
#----------------------------------------------------------------------

=head2 EXPORT

None by default.

All of the subroutines may be imported by using the ':all' tag:

    use Dpchrist::TriangularNumber	qw( :all ); 


=head1 INSTALLATION

Old school:

    $ perl Makefile.PL
    $ make    
    $ make test
    $ make install 

Minimal:

    $ cpan Dpchrist::TriangularNumber

Complete:

    $ cpan Bundle::Dpchrist


=head2 PREREQUISITES

See Makefile.PL in the source distribution root directory.


=head1 SEE ALSO

http://mathforum.org/dr.math/faq/faq.pascal.triangle.html

http://mathworld.wolfram.com/TriangularNumber.html

http://en.wikipedia.org/wiki/Triangular_numbers


=head1 AUTHOR

David Paul Christensen dpchrist@holgerdanske.com


=head1 COPYRIGHT AND LICENSE

Copyright 2010 by David Paul Christensen dpchrist@holgerdanske.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 2.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307,
USA.

=cut

#######################################################################
