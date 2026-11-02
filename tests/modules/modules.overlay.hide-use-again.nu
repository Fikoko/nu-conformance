# id: modules.overlay.hide-use-again
# rule: modules.overlay.hide
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
overlay use m
overlay hide m
overlay use m
f
