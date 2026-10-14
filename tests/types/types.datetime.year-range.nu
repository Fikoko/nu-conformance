# id: types.datetime.year-range
# rule: types.datetime.literal
# expect: output
# ---
# [0001-01-01T00:00:00+00:00, 9999-12-31T00:00:00+00:00]
# ---
[0001-01-01 9999-12-31] | to nuon
