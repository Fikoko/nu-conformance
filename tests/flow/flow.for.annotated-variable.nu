# id: flow.for.annotated-variable
# rule: flow.for.variable
# expect: output
# ---
# 1
# 2
# ---
for i: int in [1 2] { print $i }
