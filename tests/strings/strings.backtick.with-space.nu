# id: strings.backtick.with-space
# rule: strings.backtick.syntax
# expect: output
# ---
# "a b"
# ---
echo `a b` | to nuon
