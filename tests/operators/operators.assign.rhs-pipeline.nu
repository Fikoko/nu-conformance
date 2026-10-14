# id: operators.assign.rhs-pipeline
# rule: operators.assign.value
# expect: output
# ---
# [6, a-b]
# ---
mut x = 1
$x = 1 | $in + 5
mut s = ""
$s = [a b] | str join "-"
[$x $s] | to nuon
