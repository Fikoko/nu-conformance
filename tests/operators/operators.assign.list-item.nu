# id: operators.assign.list-item
# rule: operators.assign.cell-path
# expect: output
# ---
# [9, 2]
# ---
mut l = [1 2]
$l.0 = 9
$l | to nuon
