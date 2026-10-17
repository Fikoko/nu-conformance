# id: operators.not.applies-to-variable-comparison
# rule: operators.not.operand
# expect: output
# ---
# true
# ---
# status: pending
let x = 1
not $x == 2
