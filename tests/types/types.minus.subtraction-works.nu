# id: types.minus.subtraction-works
# rule: types.minus.literal-only
# expect: output
# ---
# -5
# ---
let x = 5
0 - $x | to nuon
