# id: scope.block.match-assigns-mut
# rule: scope.block.mut
# expect: output
# ---
# 3
# ---
mut x = 1
match 1 { 1 => { $x = 3 } }
$x
