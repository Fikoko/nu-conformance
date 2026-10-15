# id: flow.try.body-assigns-mut
# rule: flow.try.mut
# expect: output
# ---
# 2
# ---
mut x = 0
try { $x = 2 }
$x
