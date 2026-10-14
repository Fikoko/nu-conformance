# id: types.table.different-column-types
# rule: types.table.list-of-records
# expect: output
# ---
# table<a: oneof<int, string>>
# ---
[{a: 1} {a: "x"}] | describe
