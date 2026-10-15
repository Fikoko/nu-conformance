# id: flow.for.subexpression
# rule: flow.for.iteration
# expect: output
# ---
# 10
# 20
# 30
# ---
for x in (1..3 | each {|i| $i * 10 }) { print $x }
