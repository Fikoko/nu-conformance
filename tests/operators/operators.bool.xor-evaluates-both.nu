# id: operators.bool.xor-evaluates-both
# rule: operators.bool.short-circuit
# expect: output
# ---
# side
# false
# ---
true xor (do { print side; true })
