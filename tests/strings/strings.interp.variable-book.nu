# id: strings.interp.variable-book
# rule: strings.interp.expr
# expect: output
# ---
# "greetings, Alice"
# ---
let name = "Alice"
$"greetings, ($name)" | to nuon
