# id: scope.block.for-assigns-mut
# rule: scope.block.mut
# expect: output
# ---
# 4
# ---
mut x = 1
for i in [1 2] { $x += $i }
$x
