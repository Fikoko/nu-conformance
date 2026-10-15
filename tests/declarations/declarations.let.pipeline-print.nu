# id: declarations.let.pipeline-print
# rule: declarations.let.binding
# expect: output
# ---
# 5
# nothing
# ---
let x = 5 | print
$x | describe
