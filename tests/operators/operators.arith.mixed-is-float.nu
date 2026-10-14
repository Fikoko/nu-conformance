# id: operators.arith.mixed-is-float
# rule: operators.arith.mixed
# expect: output
# ---
# [3.5, 2.5, 4.5, 3.0]
# ---
[(1 + 2.5) (5 - 2.5) (3 * 1.5) (7 // 2.0)] | to nuon
