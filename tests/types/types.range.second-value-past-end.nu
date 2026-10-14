# id: types.range.second-value-past-end
# rule: types.range.step
# expect: output
# ---
# [1]
# ---
1..3..2 | each {||} | to nuon
