# id: strings.interp.cell-path
# rule: strings.interp.expr
# expect: output
# ---
# "5"
# ---
let x = {a: {b: 5}}
$"($x.a.b)" | to nuon
