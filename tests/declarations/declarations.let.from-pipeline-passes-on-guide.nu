# id: declarations.let.from-pipeline-passes-on-guide
# rule: declarations.let.from-pipeline
# expect: output
# ---
# 3
# ---
[3 1 2] | sort | let sorted | length
