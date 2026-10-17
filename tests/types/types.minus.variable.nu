# id: types.minus.variable
# rule: types.minus.literal-only
# expect: output
# ---
# -5
# ---
# status: pending
let x = 5
-$x | to nuon
