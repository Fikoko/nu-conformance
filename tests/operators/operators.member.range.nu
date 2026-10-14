# id: operators.member.range
# rule: operators.member.range
# expect: output
# ---
# [true, false, false]
# ---
[(1 in 1..5) (6 in 1..5) (1.5 in 1..5)] | to nuon
