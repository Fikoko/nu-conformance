# id: pipelines.in.cell-path-guide
# rule: pipelines.in.stage
# expect: output
# ---
# 1
# ---
[3 1 2] | sort | $in.0
