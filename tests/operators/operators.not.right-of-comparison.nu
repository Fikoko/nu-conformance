# id: operators.not.right-of-comparison
# rule: operators.not.operand
# expect: output
# ---
# []
# ---
# status: pending
[{a: 1, b: true} {a: 2, b: false}] | where a == not b | to nuon
