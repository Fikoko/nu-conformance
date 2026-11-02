# id: modules.use.all-submodule
# rule: modules.use.all
# expect: output
# ---
# sub
# ---
module m { export module sub { export def f [] { 'sub' } } }
use m *
sub f
