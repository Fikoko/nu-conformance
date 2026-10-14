# id: operators.bool.and-short-circuits
# rule: operators.bool.short-circuit
# expect: output
# ---
# false
# ---
false and (do { print side; true })
