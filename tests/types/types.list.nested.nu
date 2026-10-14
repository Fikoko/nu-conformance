# id: types.list.nested
# rule: types.list.literal
# expect: output
# ---
# list<list<int>>
# ---
[[1 2] [3]] | describe
