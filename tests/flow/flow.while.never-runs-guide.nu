# id: flow.while.never-runs-guide
# rule: flow.while.condition
# expect: output
# ---
# 10
# ---
mut x = 10
while $x < 3 { print "never runs" }
$x
