# id: types.list.membership
# rule: types.list.operators
# expect: output
# ---
# [true, true, true, true]
# ---
[(2 in [1 2 3]) ([1 2 3] has 2) (4 not-in [1 2 3]) ([1 2 3] not-has 4)] | to nuon
