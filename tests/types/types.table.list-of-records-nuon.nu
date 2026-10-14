# id: types.table.list-of-records-nuon
# rule: types.table.list-of-records
# expect: output
# ---
# [[name, rank]; [Sam, 10], [Bob, 7]]
# ---
[{name: "Sam", rank: 10}, {name: "Bob", rank: 7}] | to nuon
