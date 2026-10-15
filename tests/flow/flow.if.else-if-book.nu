# id: flow.if.else-if-book
# rule: flow.if.else
# expect: output
# ---
# zero
# ---
let x = 0
if $x > 0 { 'positive' } else if $x == 0 { 'zero' } else { "negative" }
