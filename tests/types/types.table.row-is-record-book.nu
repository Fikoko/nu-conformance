# id: types.table.row-is-record-book
# rule: types.table.access
# expect: output
# ---
# {x: 12, y: 5}
# ---
[{x:12, y:5}, {x:3, y:6}] | get 0 | to nuon
