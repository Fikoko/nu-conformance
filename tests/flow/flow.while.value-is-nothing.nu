# id: flow.while.value-is-nothing
# rule: flow.while.statement
# expect: output
# ---
# [nothing, nothing]
# ---
[(while false { 1 } | describe) ((while false { 1 }) | describe)] | to nuon
