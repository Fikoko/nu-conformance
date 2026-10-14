# id: operators.arith.pow-float
# rule: operators.arith.pow
# expect: output
# ---
# [1.4142135623730951, 1.4142135623730951]
# ---
[(2.0 ** 0.5) (2 ** 0.5)] | to nuon
