# id: flow.match.guard-against-variable-guide
# rule: flow.match.binding
# expect: output
# ---
# unexpected 5
# ---
let expected = 1
match 5 { $n if $n == $expected => 'expected', $n => $"unexpected ($n)" }
