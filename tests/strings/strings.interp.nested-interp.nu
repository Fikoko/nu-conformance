# id: strings.interp.nested-interp
# rule: strings.interp.nesting
# expect: output
# ---
# "nested 2"
# ---
$"($"nested (1 + 1)")" | to nuon
