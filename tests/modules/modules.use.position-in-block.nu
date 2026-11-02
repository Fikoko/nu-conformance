# id: modules.use.position-in-block
# rule: modules.use.position
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
do { use m f; f }
