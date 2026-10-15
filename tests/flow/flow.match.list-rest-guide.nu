# id: flow.match.list-rest-guide
# rule: flow.match.lists
# expect: output
# ---
# {first: 1, rest: [2, 3, 4]}
# ---
match [1 2 3 4] { [$first, ..$rest] => {first: $first, rest: $rest} } | to nuon
