# id: types.duration.compare
# rule: types.duration.arithmetic
# expect: output
# ---
# [true, true]
# ---
[(1hr == 60min) (1sec > 999ms)] | to nuon
