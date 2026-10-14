# id: operators.assign.divide-float
# rule: operators.assign.compound
# expect: output
# ---
# 0.5
# ---
mut x = 1.0
$x /= 2
$x | to nuon
