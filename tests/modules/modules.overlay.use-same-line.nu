# id: modules.overlay.use-same-line
# rule: modules.overlay.use
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
overlay use m; f
