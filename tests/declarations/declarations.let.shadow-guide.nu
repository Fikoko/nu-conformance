# id: declarations.let.shadow-guide
# rule: declarations.let.immutable
# expect: output
# ---
# 2
# ---
let x = 1
let x = $x + 1
$x
