# id: strings.interp.variable-guide
# rule: strings.interp.expr
# expect: output
# ---
# "My favorite shell is Nushell"
# ---
let name = "Nushell"
$"My favorite shell is ($name)" | to nuon
