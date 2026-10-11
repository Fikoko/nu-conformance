# id: strings.interp.nested-expr
# rule: strings.interp.expr
# expect: output
# ---
# "value: 4"
# ---
let x = 3
$"value: ($x + 1)" | to nuon
