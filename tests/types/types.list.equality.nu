# id: types.list.equality
# rule: types.list.operators
# expect: output
# ---
# [true, false, true]
# ---
[([1 2] == [1 2]) ([1 2] == [2 1]) ([1] == [1.0])] | to nuon
