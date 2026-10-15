# id: flow.if.condition-expression
# rule: flow.if.condition
# expect: output
# ---
# [y, y]
# ---
[(if (1 == 1) { "y" }) (if 1 == 1 { "y" })] | to nuon
