# id: declarations.unlet.redeclare
# rule: declarations.unlet.delete
# expect: output
# ---
# 2
# ---
let x = 1
unlet $x
let x = 2
$x
