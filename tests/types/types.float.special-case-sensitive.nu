# id: types.float.special-case-sensitive
# rule: types.float.special-case
# expect: output
# ---
# ["INF", "infinity", NaN, "NAN"]
# ---
# status: pending
[INF infinity nan NAN] | to nuon
