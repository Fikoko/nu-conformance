# id: types.float.inf-nan
# rule: types.float.special
# expect: output
# ---
# [inf, -inf, NaN]
# ---
[inf -inf NaN] | to nuon
