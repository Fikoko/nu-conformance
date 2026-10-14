# id: types.table.quoted-header
# rule: types.table.literal
# expect: output
# ---
# [["a b", c]; [1, 2]]
# ---
[["a b" c]; [1 2]] | to nuon
