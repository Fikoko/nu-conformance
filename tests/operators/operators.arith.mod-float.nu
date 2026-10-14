# id: operators.arith.mod-float
# rule: operators.arith.floor
# expect: output
# ---
# [1.5, -4.0]
# ---
[(7.5 mod 2) (-7.5 // 2)] | to nuon
