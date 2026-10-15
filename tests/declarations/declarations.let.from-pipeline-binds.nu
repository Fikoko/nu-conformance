# id: declarations.let.from-pipeline-binds
# rule: declarations.let.from-pipeline
# expect: output
# ---
# [1, 2, 3]
# ---
[3 1 2] | sort | let sorted
$sorted | to nuon
