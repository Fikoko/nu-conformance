# id: types.float.underscores
# rule: types.float.underscores
# expect: output
# ---
# [1000.5, 1.05, 10000000000.0]
# ---
[1_000.5 1.0_5 1e1_0] | to nuon
