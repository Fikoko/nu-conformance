# id: types.table.record-and-other
# rule: types.table.list-of-records
# expect: output
# ---
# list<oneof<record<a: int>, int>>
# ---
[{a: 1} 5] | describe
