# id: types.range.exclusive-guide
# rule: types.range.exclusive
# expect: output
# ---
# [1, 2, 3, 4]
# ---
1..<5 | each {||} | to nuon
