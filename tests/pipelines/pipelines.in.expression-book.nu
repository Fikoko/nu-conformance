# id: pipelines.in.expression-book
# rule: pipelines.in.stage
# expect: output
# ---
# 6
# ---
[1 2 3] | $in.1 * $in.2
