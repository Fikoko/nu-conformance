# id: flow.for.let-gets-nothing
# rule: flow.for.statement
# expect: output
# ---
# nothing
# ---
let r = (for x in [1] { 1 })
$r | describe
