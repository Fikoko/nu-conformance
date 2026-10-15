# id: scope.block.while-assigns-mut
# rule: scope.block.mut
# expect: output
# ---
# 5
# ---
mut x = 1
while $x < 5 { $x += 1 }
$x
