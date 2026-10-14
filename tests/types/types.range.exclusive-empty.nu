# id: types.range.exclusive-empty
# rule: types.range.exclusive
# expect: output
# ---
# []
# ---
1..<1 | each {||} | to nuon
