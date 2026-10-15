# id: flow.for.list-book
# rule: flow.for.iteration
# expect: output
# ---
# 1
# 4
# 9
# ---
for x in [1 2 3] { $x * $x | print }
