# id: types.range.exclusive-descending
# rule: types.range.exclusive
# expect: output
# ---
# [5, 4, 3, 2]
# ---
5..<1 | each {||} | to nuon
