# id: operators.assign.rhs-expression
# rule: operators.assign.value
# expect: output
# ---
# [3, 5]
# ---
mut a = 1
$a = $a + 1 * 2
mut b = 1
$b = 2 + 3
[$a $b] | to nuon
