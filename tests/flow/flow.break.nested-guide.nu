# id: flow.break.nested-guide
# rule: flow.break.stops
# expect: output
# ---
# 1,1
# 2,1
# 3,1
# ---
for i in 1..3 { for j in 1..3 { if $j == 2 { break }; print $"($i),($j)" } }
