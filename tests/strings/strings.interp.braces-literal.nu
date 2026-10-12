# id: strings.interp.braces-literal
# rule: strings.interp.only-parens
# expect: output
# ---
# "a {b} c"
# ---
$"a {b} c" | to nuon
