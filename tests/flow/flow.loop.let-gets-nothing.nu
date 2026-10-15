# id: flow.loop.let-gets-nothing
# rule: flow.loop.statement
# expect: output
# ---
# nothing
# ---
let r = loop { break }
$r | describe
