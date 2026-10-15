# id: flow.match.catch-all-book
# rule: flow.match.value
# expect: output
# ---
# other number
# ---
let foo = match 7 {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    _ => 'other number'
}
$foo
