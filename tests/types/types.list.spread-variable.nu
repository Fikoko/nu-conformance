# id: types.list.spread-variable
# rule: types.list.spread
# expect: output
# ---
# [1, 2, 3]
# ---
let l = [1 2]
[...$l 3] | to nuon
