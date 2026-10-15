# id: scope.block.try-assigns-mut
# rule: scope.block.mut
# expect: output
# ---
# 2
# ---
mut x = 1
try { $x = 2 }
$x
