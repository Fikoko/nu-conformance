# id: operators.bool.or-short-circuits
# rule: operators.bool.short-circuit
# expect: output
# ---
# true
# ---
true or (do { print side; true })
