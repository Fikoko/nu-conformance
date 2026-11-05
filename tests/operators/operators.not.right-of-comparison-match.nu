# id: operators.not.right-of-comparison-match
# rule: operators.not.operand
# expect: output
# ---
# 1
# ---
# status: pending
[{a: true, b: false}] | where a == not b | length
