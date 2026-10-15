# id: flow.match.record-book
# rule: flow.match.records
# expect: output
# ---
# 10
# ---
let foo = { name: 'bar', count: 7 }
match $foo {
    { name: 'bar', count: $it } => ($it + 3),
    { name: _, count: $it } => ($it + 7),
    _ => 1
}
