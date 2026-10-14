# id: types.list.spread-literal
# rule: types.list.spread
# expect: output
# ---
# [1, 2, 3]
# ---
[...[1 2] ...[3]] | to nuon
