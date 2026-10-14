# id: operators.prec.compare-before-and
# rule: operators.precedence
# expect: output
# ---
# [true, true]
# ---
[(1 < 2 and 2 < 3) (1 + 1 == 2 and true)] | to nuon
