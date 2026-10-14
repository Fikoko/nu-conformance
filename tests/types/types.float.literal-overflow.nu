# id: types.float.literal-overflow
# rule: types.float.literal-range
# expect: output
# ---
# [inf, -inf]
# ---
[1e309 -1e309] | to nuon
