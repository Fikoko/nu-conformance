# id: types.minus.duration-variable
# rule: types.minus.literal-only
# expect: output
# ---
# true
# ---
let x = 5sec
(-$x) == -5sec
