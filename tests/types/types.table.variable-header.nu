# id: types.table.variable-header
# rule: types.table.literal
# expect: output
# ---
# [[x]; [1]]
# ---
let k = "x"
[[$k]; [1]] | to nuon
