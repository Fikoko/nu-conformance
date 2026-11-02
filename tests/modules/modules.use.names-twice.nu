# id: modules.use.names-twice
# rule: modules.use.names
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
use m f
use m f
f
