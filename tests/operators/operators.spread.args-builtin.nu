# id: operators.spread.args-builtin
# rule: operators.spread.args
# expect: output
# ---
# [a, b]
# ---
echo ...[a b] | to nuon
