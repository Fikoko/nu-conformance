# id: modules.overlay.list-after-use
# rule: modules.overlay.list
# expect: output
# ---
# [zero, m]
# ---
module m { export def f [] { 'f' } }
overlay use m
overlay list | get name | to nuon
