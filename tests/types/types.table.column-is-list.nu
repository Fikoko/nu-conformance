# id: types.table.column-is-list
# rule: types.table.access
# expect: output
# ---
# [1, 2]
# ---
let t = [[a]; [1] [2]]
$t.a | to nuon
