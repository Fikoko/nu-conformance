# id: types.range.second-value-guide
# rule: types.range.step
# expect: output
# ---
# [1, 3, 5, 7, 9]
# ---
1..3..10 | each {||} | to nuon
