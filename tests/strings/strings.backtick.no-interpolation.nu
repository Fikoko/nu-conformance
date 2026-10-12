# id: strings.backtick.no-interpolation
# rule: strings.backtick.syntax
# expect: output
# ---
# "(1 + 1)"
# ---
echo `(1 + 1)` | to nuon
