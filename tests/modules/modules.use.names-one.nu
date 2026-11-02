# id: modules.use.names-one
# rule: modules.use.names
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
use m f
f
