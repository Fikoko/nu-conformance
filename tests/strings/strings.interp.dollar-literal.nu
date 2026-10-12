# id: strings.interp.dollar-literal
# rule: strings.interp.only-parens
# expect: output
# ---
# "$x"
# ---
let x = 3
$"$x" | to nuon
