# id: flow.for.range
# rule: flow.for.iteration
# expect: output
# ---
# 1
# 2
# 3
# ---
for x in 1..3 { print $x }
