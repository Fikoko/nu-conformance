# id: types.datetime.compare-across-offsets
# rule: types.datetime.arithmetic
# expect: output
# ---
# true
# ---
2022-02-02T14:30:00+05:00 == 2022-02-02T09:30:00Z
