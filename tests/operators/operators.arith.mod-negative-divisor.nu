# id: operators.arith.mod-negative-divisor
# rule: operators.arith.floor
# expect: output
# ---
# [-2, -1]
# ---
[(7 mod -3) (-7 mod -3)] | to nuon
