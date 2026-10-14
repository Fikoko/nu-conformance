# id: types.minus.variable
# rule: types.minus.literal-only
# expect: output
# ---
# "-$x"
# ---
let x = 5
-$x | to nuon
