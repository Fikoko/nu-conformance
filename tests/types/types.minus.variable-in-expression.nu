# id: types.minus.variable-in-expression
# rule: types.minus.literal-only
# expect: output
# ---
# -4
# ---
let x = 5
1 + -$x
