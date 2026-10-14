# id: types.range.float-small-guide
# rule: types.range.float-small-step
# expect: output
# ---
# [0.1, 0.2, 0.3]
# ---
0.1..0.3 | each {||} | to nuon
