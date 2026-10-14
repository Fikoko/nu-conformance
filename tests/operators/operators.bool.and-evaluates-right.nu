# id: operators.bool.and-evaluates-right
# rule: operators.bool.short-circuit
# expect: output
# ---
# side
# true
# ---
true and (do { print side; true })
