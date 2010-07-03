# $Id: example.t,v 1.7 2010-07-03 04:52:46 dpchrist Exp $
# Copyright 2010 by David Christensen dpchrist@holgerdanske.com

use Test::More tests => 1;
use Dpchrist::TriangularNumber qw( :all );

### triangular numbers():
print join(", ", map({ triangular_number($_)}   1..10)), "\n";

### triangular inverses():
print join(", ", map({ triangular_inverse($_)}  1..10)), "\n";

### is_triangular_number():
print join(", ", map({ is_triangular_number($_)}  1..10)), "\n";

ok(1);
