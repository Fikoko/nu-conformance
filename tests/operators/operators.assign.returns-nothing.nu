# id: operators.assign.returns-nothing
# rule: operators.assign.value
# expect: output
# ---
# nothing
# ---
mut x = 1
($x = 2) | describe
