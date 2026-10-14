# id: types.table.list-of-records-guide
# rule: types.table.list-of-records
# expect: output
# ---
# table<name: string, rank: int>
# ---
[{name: "Sam", rank: 10}, {name: "Bob", rank: 7}] | describe
