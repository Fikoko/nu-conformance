# id: pipelines.in.rule2-book
# rule: pipelines.in.stage
# expect: output
# ---
# 8.0
# ---
4               # Pipeline input
| $in * $in     # $in is 4 in this expression
| $in / 2       # $in is now 16 in this expression
| $in           # $in is now 8.0
