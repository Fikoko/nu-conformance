# id: types.table.literal-nuon
# rule: types.table.literal
# expect: output
# ---
# [[a, b]; [1, 2], [3, 4]]
# ---
[[a b]; [1 2] [3 4]] | to nuon
