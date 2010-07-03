#######################################################################
# $Id: 3_is_triangular_number.t,v 1.5 2010-07-03 04:52:46 dpchrist Exp $
#
# Test script for Dpchrist::TriangularNumber::is_triangular_number().
#
# Copyright 2010 by David Paul Christensen dpchrist@holgerdanske.com
#######################################################################

use Test::More tests => 39;

use Dpchrist::TriangularNumber qw( is_triangular_number );

$| = 1;

ok( is_triangular_number(  0));					#     1
ok( is_triangular_number(  1));					#     2
ok(!is_triangular_number(  2));					#     3
ok( is_triangular_number(  3));					#     4
ok(!is_triangular_number(  4));					#     5
ok(!is_triangular_number(  5));					#     6
ok( is_triangular_number(  6));					#     7
ok(!is_triangular_number(  7));					#     8
ok(!is_triangular_number(  8));					#     9
ok(!is_triangular_number(  9));					#    10
ok( is_triangular_number( 10));					#    11
ok(!is_triangular_number( 14));					#    12
ok( is_triangular_number( 15));					#    13
ok(!is_triangular_number( 16));					#    14
ok(!is_triangular_number( 20));					#    15
ok( is_triangular_number( 21));					#    16
ok(!is_triangular_number( 22));					#    17
ok(!is_triangular_number( 54));					#    18
ok( is_triangular_number( 55));					#    19
ok(!is_triangular_number( 56));					#    20
ok(!is_triangular_number(209));					#    21
ok( is_triangular_number(210));					#    22
ok(!is_triangular_number(211));					#    23
ok(!is_triangular_number(464));					#    24
ok( is_triangular_number(465));					#    25
ok(!is_triangular_number(466));					#    26
ok(!is_triangular_number(819));					#    27
ok( is_triangular_number(820));					#    28
ok(!is_triangular_number(821));					#    29
map {
    ok(is_triangular_number(-$_) == is_triangular_number($_))
} 1..10;							# 30-39

#######################################################################
