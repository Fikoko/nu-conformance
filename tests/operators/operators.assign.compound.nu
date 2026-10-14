# id: operators.assign.compound
# rule: operators.assign.compound
# expect: output
# ---
# [3, 3, 6]
# ---
mut a = 1
$a += 2
mut b = 5
$b -= 2
mut c = 3
$c *= 2
[$a $b $c] | to nuon
