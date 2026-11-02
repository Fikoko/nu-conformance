# id: modules.use.position-same-line
# rule: modules.use.position
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
use m f; f
