# id: flow.continue.nested-guide
# rule: flow.continue.skips
# expect: output
# ---
# 1,1
# 1,3
# 2,1
# 2,3
# ---
for i in 1..2 { for j in 1..3 { if $j == 2 { continue }; print $"($i),($j)" } }
