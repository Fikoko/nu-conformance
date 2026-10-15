# id: flow.match.binds-new-variable-guide
# rule: flow.match.binding
# expect: output
# ---
# matched 5
# ---
let expected = 1
match 5 { $expected => $"matched ($expected)" }
