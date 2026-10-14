# id: types.table.same-as-literal
# rule: types.table.list-of-records
# expect: output
# ---
# true
# ---
[[a b]; [1 2]] == [{a: 1, b: 2}]
