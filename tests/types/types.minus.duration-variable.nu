# id: types.minus.duration-variable
# rule: types.minus.literal-only
# expect: output
# ---
# true
# ---
# status: pending
let x = 5sec
(-$x) == -5sec
