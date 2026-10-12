# id: strings.single-quoted.no-interpolation
# rule: strings.single-quoted.no-escapes
# expect: output
# ---
# "(1 + 1)"
# ---
'(1 + 1)' | to nuon
