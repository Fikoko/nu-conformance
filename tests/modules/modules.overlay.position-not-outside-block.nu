# id: modules.overlay.position-not-outside-block
# rule: modules.overlay.position
# expect: output
# ---
# [zero]
# ---
module m { export def f [] { 'f' } }
do { overlay use m }
overlay list | get name | to nuon
