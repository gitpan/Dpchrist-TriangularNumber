#######################################################################
# $Id: 2_triangular_inverse.t,v 1.6 2010-07-03 04:52:45 dpchrist Exp $
#
# Test script for Dpchrist::TriangularNumber::triangular_inverse().
#
# Copyright 2010 by David Christensen <dpchrist@holgerdanske.com>
#######################################################################

use Test::More tests => 21;

use Dpchrist::TriangularNumber qw( triangular_inverse );

$| = 1;

ok(abs(triangular_inverse(   0) -   0.00) < 0.01);		#     1
ok(abs(triangular_inverse(   1) -   1.00) < 0.01);		#     2
ok(abs(triangular_inverse(   2) -   1.56) < 0.01);		#     3
ok(abs(triangular_inverse(   3) -   2.00) < 0.01);		#     4
ok(abs(triangular_inverse(   4) -   2.37) < 0.01);		#     5
ok(abs(triangular_inverse(   5) -   2.70) < 0.01);		#     6
ok(abs(triangular_inverse(   6) -   3.00) < 0.01);		#     7
ok(abs(triangular_inverse(   7) -   3.27) < 0.01);		#     8
ok(abs(triangular_inverse(   8) -   3.53) < 0.01);		#     9
ok(abs(triangular_inverse(   9) -   3.77) < 0.01);		#    10
ok(abs(triangular_inverse(  10) -   4.00) < 0.01);		#    11
map {
    ok(triangular_inverse(-$_) + triangular_inverse($_) < 0.01)
} 1..10;							# 12-21

#######################################################################
