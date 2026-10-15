# id: flow.for.scalar-once
# rule: flow.for.single-value
# expect: output
# ---
# 5
# abc
# ---
for x in 5 { print $x }
for x in "abc" { print $x }
