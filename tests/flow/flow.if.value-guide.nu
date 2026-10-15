# id: flow.if.value-guide
# rule: flow.if.value
# expect: output
# ---
# odd
# ---
let x = 5
let label = if $x mod 2 == 0 { "even" } else { "odd" }
$label
