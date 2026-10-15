# id: flow.if.in-pipeline-book
# rule: flow.if.value
# expect: output
# ---
# 3
# ---
'foo' | if $in == 'foo' { 1 } else { 0 } | $in + 2
