# id: strings.interp.escaped-open-only
# rule: strings.interp.escaped-paren
# expect: output
# ---
# "a (1 + 1)"
# ---
$"a \(1 + 1)" | to nuon
