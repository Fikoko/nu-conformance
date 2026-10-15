# id: declarations.unlet.const-unaffected
# rule: declarations.unlet.const
# expect: output
# ---
# 1
# ---
const x = 1
unlet $x
$x
