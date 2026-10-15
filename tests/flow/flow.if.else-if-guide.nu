# id: flow.if.else-if-guide
# rule: flow.if.else
# expect: output
# ---
# medium
# ---
let x = 5
if $x > 10 { "big" } else if $x > 3 { "medium" } else { "small" }
