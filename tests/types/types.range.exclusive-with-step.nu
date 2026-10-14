# id: types.range.exclusive-with-step
# rule: types.range.exclusive
# expect: output
# ---
# [1, 2, 3, 4, 5]
# ---
1..2..<6 | each {||} | to nuon
