# id: modules.overlay.position-in-block
# rule: modules.overlay.position
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
do { overlay use m; f }
