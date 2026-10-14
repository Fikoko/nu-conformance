# id: types.float.special-case-insensitive
# rule: types.float.special-case
# expect: output
# ---
# [inf, inf, NaN, NaN]
# ---
[INF infinity nan NAN] | to nuon
