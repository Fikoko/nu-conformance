# id: types.range.float-guide
# rule: types.range.float
# expect: output
# ---
# [1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2]
# ---
(1.0)..(1.2)..(2.2) | each {||} | to nuon
