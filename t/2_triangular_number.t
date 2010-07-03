#######################################################################
# $Id: 2_triangular_number.t,v 1.5 2010-07-03 04:52:45 dpchrist Exp $
#
# Test script for Dpchrist::TriangularNumber::triangular_number().
#
# Copyright 2010 by David Christensen <dpchrist@holgerdanske.com>
#######################################################################

use Test::More tests => 21;

use Dpchrist::TriangularNumber qw( triangular_number );

$| = 1;

ok(triangular_number(  0) ==    0);				#  1
ok(triangular_number(  1) ==    1);				#  2
ok(triangular_number(  2) ==    3);				#  3
ok(triangular_number(  3) ==    6);				#  4
ok(triangular_number(  4) ==   10);				#  5
ok(triangular_number(  5) ==   15);				#  6
ok(triangular_number(  6) ==   21);				#  7
ok(triangular_number(  7) ==   28);				#  8
ok(triangular_number(  8) ==   36);				#  9
ok(triangular_number(  9) ==   45);				# 10
ok(triangular_number( 10) ==   55);				# 11

map {
    ok(triangular_number(-$_) == -triangular_number($_))
} 1..10;							# 12-21

#######################################################################
