# id: modules.overlay.use-as
# rule: modules.overlay.use
# expect: output
# ---
# {name: n, active: true}
# ---
module m { export def f [] { 'f' } }
overlay use m as n
overlay list | last | to nuon
