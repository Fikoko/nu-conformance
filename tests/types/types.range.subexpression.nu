# id: types.range.subexpression
# rule: types.range.literal
# expect: output
# ---
# [1, 2, 3, 4]
# ---
1..(2 + 2) | each {||} | to nuon
