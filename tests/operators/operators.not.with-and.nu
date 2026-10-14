# id: operators.not.with-and
# rule: operators.not.operand
# expect: output
# ---
# [false, true]
# ---
[(not true and false) (not (true and false))] | to nuon
