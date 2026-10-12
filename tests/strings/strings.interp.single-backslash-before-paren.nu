# id: strings.interp.single-backslash-before-paren
# rule: strings.interp.single-no-escapes
# expect: output
# ---
# "a \\1"
# ---
$'a \(1)' | to nuon
