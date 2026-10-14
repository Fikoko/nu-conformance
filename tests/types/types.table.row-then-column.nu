# id: types.table.row-then-column
# rule: types.table.access
# expect: output
# ---
# [2, 2]
# ---
let t = [[a]; [1] [2]]
[$t.1.a $t.a.1] | to nuon
