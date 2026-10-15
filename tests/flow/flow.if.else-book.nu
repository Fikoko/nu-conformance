# id: flow.if.else-book
# rule: flow.if.branches
# expect: output
# ---
# non-positive
# ---
let x = -5
if $x > 0 { 'positive' } else { 'non-positive' }
