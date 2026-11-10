# id: operators.not.right-of-comparison-match
# rule: operators.not.operand
# expect: output
# ---
# 1
# ---
[{a: true, b: false}] | where a == not b | length
