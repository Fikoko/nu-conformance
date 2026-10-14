# id: types.range.inclusive-guide
# rule: types.range.inclusive
# expect: output
# ---
# [1, 2, 3, 4, 5]
# ---
1..5 | each {||} | to nuon
