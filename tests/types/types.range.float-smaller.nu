# id: types.range.float-smaller
# rule: types.range.float-small-step
# expect: output
# ---
# [0.0, 0.01, 0.02, 0.03, 0.04, 0.05]
# ---
0.0..0.05 | each {||} | to nuon
