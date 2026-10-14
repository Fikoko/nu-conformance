# id: types.range.float-step-one
# rule: types.range.float
# expect: output
# ---
# [0.0, 1.0]
# ---
0.0..1.0 | each {||} | to nuon
