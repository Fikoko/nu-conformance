# id: types.float.literal-underflow
# rule: types.float.literal-range
# expect: output
# ---
# 0.0
# ---
1e-400 | to nuon
