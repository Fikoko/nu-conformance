# id: flow.break.in-match
# rule: flow.break.stops
# expect: output
# ---
# 1
# ---
for x in [1 2 3] { match $x { 2 => { break }, _ => { print $x } } }
