# id: strings.interp.nested-double-quotes
# rule: strings.interp.nesting
# expect: output
# ---
# "inner"
# ---
$"("inner")" | to nuon
