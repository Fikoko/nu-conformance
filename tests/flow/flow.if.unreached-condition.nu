# id: flow.if.unreached-condition
# rule: flow.if.condition
# expect: output
# ---
# 1
# ---
if true { 1 } else if 1 { 2 }
