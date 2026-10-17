# id: types.float.special-lowercase
# rule: types.float.special-case
# expect: output
# ---
# [inf, NaN, NaN, -inf]
# ---
[inf nan NaN -inf] | to nuon
