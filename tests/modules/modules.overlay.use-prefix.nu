# id: modules.overlay.use-prefix
# rule: modules.overlay.use
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
overlay use --prefix m
m f
