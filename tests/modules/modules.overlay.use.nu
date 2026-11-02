# id: modules.overlay.use
# rule: modules.overlay.use
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
overlay use m
f
