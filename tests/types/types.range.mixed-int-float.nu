# id: types.range.mixed-int-float
# rule: types.range.float
# expect: output
# ---
# [1.0, 2.0]
# ---
1..2.5 | each {||} | to nuon
