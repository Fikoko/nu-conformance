# id: declarations.let.pipeline-guide
# rule: declarations.let.binding
# expect: output
# ---
# 0
# ---
let big_files = ls | where size > 1mb | length
$big_files
