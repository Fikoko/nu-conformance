# id: declarations.const.shadow
# rule: declarations.const.immutable
# expect: output
# ---
# 2
# ---
const x = 1
const x = 2
$x
