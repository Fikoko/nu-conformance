# id: types.range.no-start-exclusive
# rule: types.range.open
# expect: output
# ---
# [0, 1, 2]
# ---
..<3 | each {||} | to nuon
