# id: operators.compare.equal
# rule: operators.compare.equality
# expect: output
# ---
# [true, true]
# ---
[(1 == 1) (1 != 2)] | to nuon
