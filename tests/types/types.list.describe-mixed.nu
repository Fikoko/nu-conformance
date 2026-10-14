# id: types.list.describe-mixed
# rule: types.list.type
# expect: output
# ---
# list<oneof<number, string>>
# ---
[1 "a" 2.0] | describe
