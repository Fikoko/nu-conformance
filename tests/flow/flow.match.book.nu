# id: flow.match.book
# rule: flow.match.arms
# expect: output
# ---
# three
# ---
match 3 {
    1 => 'one',
    2 => {
        let w = 'w'
        't' + $w + 'o'
    },
    3 => 'three',
    4 => 'four'
}
