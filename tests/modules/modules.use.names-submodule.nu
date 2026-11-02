# id: modules.use.names-submodule
# rule: modules.use.names
# expect: output
# ---
# sub
# ---
module m { export module sub { export def f [] { 'sub' } } }
use m sub
sub f
