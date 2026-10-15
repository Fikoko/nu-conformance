# id: scope.block.do-shadow
# rule: scope.block.local
# expect: output
# ---
# 1
# ---
let x = 1
do { let x = 2 }
$x
