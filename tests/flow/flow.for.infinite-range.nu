# id: flow.for.infinite-range
# rule: flow.for.iteration
# expect: output
# ---
# 1
# 2
# ---
for x in 1.. { if $x > 2 { break }; print $x }
