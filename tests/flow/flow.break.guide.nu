# id: flow.break.guide
# rule: flow.break.stops
# expect: output
# ---
# 1
# 2
# 3
# ---
for x in 1..10 { if $x > 3 { break }; print $x }
