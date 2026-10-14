# id: operators.assign.record-field
# rule: operators.assign.cell-path
# expect: output
# ---
# [{a: 5}, {a: 1, b: 5}]
# ---
mut r = {a: 1}
$r.a = 5
mut s = {a: 1}
$s.b = 5
[$r $s] | to nuon
